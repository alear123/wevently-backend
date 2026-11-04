/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Reportes.CantidadUsuariosActivos.Services;

import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTOCantidadContrataciones;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTODatoGrafico;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTODatos;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTODatosGraficoPlata;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTOProporcionContrataciones;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTORangoFechas;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTOTopMedio;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTOresumenPeriodo;
import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Pagos.Entities.AuditoriaTransaccion;
import com.wevently.wevently.Pagos.Repository.AuditoriaTransaccionRepository;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.Entities.MetricaActividad;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.Repository.MetricaActividadRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;

import jakarta.persistence.EntityNotFoundException;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Comparator;

@Service
@Slf4j
public class CantidadUsuariosActivosService extends BaseService<MetricaActividad, Long, MetricaActividadRepository> {

    @Autowired
    private AuditoriaTransaccionRepository auditoriaTransaccionRepository;

    @Autowired
    private ReservaRepository reservaRepository;

    public CantidadUsuariosActivosService(MetricaActividadRepository repository) {
        super(repository);
    }

    // metodo para crear una metrica actividad cdo el usuario inicia sesion
    public void registrarIngresoUsuario(Usuario usuario) {
        try {
            LocalDate hoy = LocalDate.now();

            Date fechaInicio = Date.from(hoy.atStartOfDay(ZoneId.systemDefault()).toInstant());
            Date fechaFin = Date.from(hoy.plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant());

            Optional<MetricaActividad> metricaExistente = repository
                    .findByUsuarioIdAndFechaIngresoBetween(usuario.getId(), fechaInicio, fechaFin);

            if (metricaExistente.isPresent()) {
                MetricaActividad metrica = metricaExistente.get();
                metrica.setCantidadIngresos(metrica.getCantidadIngresos() + 1);
                repository.save(metrica);
                log.info("incrementando contador para usuario {} - total de ingresos hoy: {}", usuario.getId(),
                        metrica.getCantidadIngresos());
            } else {
                MetricaActividad nuevaMetrica = new MetricaActividad();
                nuevaMetrica.setFechaIngreso(new Date());
                nuevaMetrica.setCantidadIngresos(1);
                nuevaMetrica.setUsuario(usuario);
                repository.save(nuevaMetrica);
                log.info("Creada nueva métrica para usuario {} - Primer ingreso del día",
                        usuario.getId());
            }
        } catch (Exception e) {
            log.error("Error al registrar ingreso para usuario {}: {}",
                    usuario.getId(), e.getMessage());
        }
    }

    private List<MetricaActividad> obtenerTodasSegunFecha(Date fechaInicio, Date fechaFin) {
        return repository.findByFechaIngresoBetween(fechaInicio, fechaFin);
    }

    public DTODatos ArmarDatosFront(DTORangoFechas fechas) {

        LocalDate fechaDesdeLocal = fechas.getDesde().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate fechaHastaLocal = fechas.getHasta().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        Date fechaDesdeAjustada = Date.from(fechaDesdeLocal.atStartOfDay(ZoneId.systemDefault()).toInstant());
        Date fechaHastaAjustada = Date
                .from(fechaHastaLocal.plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant());

        log.info("Fecha desde original: {}, ajustada: {}", fechas.getDesde(), fechaDesdeAjustada);
        log.info("Fecha hasta original: {}, ajustada: {}", fechas.getHasta(), fechaHastaAjustada);

        List<MetricaActividad> lista = obtenerTodasSegunFecha(fechaDesdeAjustada, fechaHastaAjustada);
        log.info("recupere la lista de metricas actividad con: {} ", lista.size());

        List<DTODatoGrafico> datosGrafico = construirDatosGrafico(lista);
        log.info("ya pude aramr la info pal grafico: {}", datosGrafico.size());

        List<DTOresumenPeriodo> resumenPeriodos = contruirResumenPeriodo(lista, fechas);
        log.info("ya arme los resumen periodps: {}", resumenPeriodos);

        List<AuditoriaTransaccion> transacciones = auditoriaTransaccionRepository
                .findByRangoFechas(fechaDesdeLocal.atStartOfDay(), fechaHastaLocal.atTime(LocalTime.MAX));

        // me quedo con las transacciones de lugares
        List<AuditoriaTransaccion> transaccionesDeLugar = new ArrayList<>();
        List<AuditoriaTransaccion> transaccionDeServicio = new ArrayList<>();

        for (AuditoriaTransaccion transaccion : transacciones) {
            Reserva reserva = reservaRepository.findById(transaccion.getReservaId())
                    .orElseThrow(() -> new EntityNotFoundException("No existe la reserva para la transacción"));

            if (reserva.getLugar() != null) {
                transaccionesDeLugar.add(transaccion);
            } else {
                transaccionDeServicio.add(transaccion);
            }
        }

        List<DTOTopMedio> mediosMasUsados = calcularMedioMasUsado(transacciones);

        DTOCantidadContrataciones contratacionesLugar = calcularCantidadDeContrataciones(transaccionesDeLugar,
                fechaDesdeLocal, fechaHastaLocal.plusDays(1));

        DTOCantidadContrataciones contratacionesServicio = calcularCantidadDeContrataciones(transaccionDeServicio,
                fechaDesdeLocal, fechaHastaLocal.plusDays(1));

        List<DTOProporcionContrataciones> proporciones = calcularProporcionContrataciones(contratacionesLugar,
                contratacionesServicio);

        return DTODatos.builder()
                .resumenPeriodo(resumenPeriodos)
                .datosGrafico(datosGrafico)
                .rangoFechas(fechas)
                .contratacionesLugares(contratacionesLugar)
                .contratacionesServicios(contratacionesServicio)
                .topMedios(mediosMasUsados)
                .proporcionContrataciones(proporciones)
                .build();
    }

    private List<DTODatoGrafico> construirDatosGrafico(List<MetricaActividad> metricas) {
        Map<LocalDate, Long> sumaPorDia = new HashMap<>();

        for (MetricaActividad metrica : metricas) {
            LocalDate dia = metrica.getFechaIngreso().toInstant()
                    .atZone(ZoneId.systemDefault())
                    .toLocalDate();

            Long suma = sumaPorDia.getOrDefault(dia, 0L);
            sumaPorDia.put(dia, suma + metrica.getCantidadIngresos());
        }

        List<DTODatoGrafico> datosGrafico = new ArrayList<>();
        for (Map.Entry<LocalDate, Long> entry : sumaPorDia.entrySet()) {
            DTODatoGrafico dato = DTODatoGrafico.builder()
                    .fechaIngreso(java.sql.Date.valueOf(entry.getKey()))
                    .cantidadIngresos(entry.getValue())
                    .build();
            datosGrafico.add(dato);
        }
        datosGrafico.sort(Comparator.comparing(DTODatoGrafico::getFechaIngreso));
        return datosGrafico;
    }

    private List<DTOresumenPeriodo> contruirResumenPeriodo(List<MetricaActividad> metricas, DTORangoFechas fechas) {
        List<DTOresumenPeriodo> resumen = new ArrayList<>();

        LocalDate hoy = LocalDate.now();
        LocalDate inicioSemana = hoy.minusDays(7);
        LocalDate inicioMesPasado = hoy.minusMonths(1).withDayOfMonth(1);
        LocalDate finMesPasado = hoy.minusMonths(1).withDayOfMonth(hoy.minusMonths(1).lengthOfMonth());

        long usuariosHoy = calcularUsuariosPorPeriodo(metricas, hoy, hoy);
        resumen.add(DTOresumenPeriodo.builder()
                .periodo("hoy")
                .valor(usuariosHoy)
                .icono("👥")
                .descripcion("usuarios conectados")
                .build());

        long usuariosSemana = calcularUsuariosPorPeriodo(metricas, inicioSemana, hoy);
        resumen.add(DTOresumenPeriodo.builder()
                .periodo("esta semana")
                .valor(usuariosSemana)
                .icono("📊")
                .descripcion("usuarios activos")
                .build());

        long usuariosMesPasado = calcularUsuariosPorPeriodo(metricas, inicioMesPasado, finMesPasado);
        resumen.add(DTOresumenPeriodo.builder()
                .periodo("mes pasado")
                .valor(usuariosMesPasado)
                .icono("📈")
                .descripcion("total de usuarios")
                .build());

        return resumen;
    }

    private long calcularUsuariosPorPeriodo(List<MetricaActividad> metricas, LocalDate inicio, LocalDate fin) {
        long totalIngresos = 0;

        for (MetricaActividad metrica : metricas) {
            LocalDate fechaMetrica = metrica.getFechaIngreso().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            if (!fechaMetrica.isBefore(inicio) && !fechaMetrica.isAfter(fin)) {
                totalIngresos += metrica.getCantidadIngresos();
            }
        }

        return totalIngresos;
    }

    // la idea seria calcular el dtocantidadcontrataciones y luego calcular cuanto
    // es lo que se gana por día para servicios y lugares respectivamente
    private DTOCantidadContrataciones calcularCantidadDeContrataciones(List<AuditoriaTransaccion> auditorias,
            LocalDate desde,
            LocalDate hasta) {

        int cantidadContrataciones = auditorias.size();

        Map<LocalDate, BigDecimal> sumaXdia = new HashMap<>();

        LocalDate fecha = desde;
        while (!fecha.isAfter(hasta)) {
            sumaXdia.put(fecha, BigDecimal.ZERO);
            fecha = fecha.plusDays(1);
        }

        // ahora loopeo por las auditorias y recupero
        BigDecimal dineroGanadoTotal = BigDecimal.ZERO;
        for (AuditoriaTransaccion auditoria : auditorias) {
            log.info("fecha de la creación auditoria: {} y comision para ese dia: {}",
                    auditoria.getFechaHoraCreacionAuditoria(), auditoria.getComisionNosotros());
            LocalDate dia = auditoria.getFechaHoraCreacionAuditoria().toLocalDate();
            dineroGanadoTotal = dineroGanadoTotal.add(auditoria.getComisionNosotros());
            log.info("dinero total calculado hasta el momento del loop: {}", dineroGanadoTotal);
            BigDecimal suma = sumaXdia.getOrDefault(dia, BigDecimal.ZERO);
            sumaXdia.put(dia, suma.add(auditoria.getComisionNosotros()));
        }
        log.info("dinero total calculado final: {}", dineroGanadoTotal);

        List<DTODatosGraficoPlata> datosGraficoPlatita = new ArrayList<>();
        for (Map.Entry<LocalDate, BigDecimal> entry : sumaXdia.entrySet()) {
            DTODatosGraficoPlata dato = DTODatosGraficoPlata.builder()
                    .cantidad(entry.getValue())
                    .fecha(entry.getKey())
                    .build();
            datosGraficoPlatita.add(dato);
        }
        datosGraficoPlatita.sort(Comparator.comparing(DTODatosGraficoPlata::getFecha));

        return DTOCantidadContrataciones.builder()
                .cantidadContrataciones(cantidadContrataciones)
                .dineroGanado(dineroGanadoTotal)
                .comisionesDiarias(datosGraficoPlatita)
                .build();
    }

    // calcular medio de pago mas utilizado
    private List<DTOTopMedio> calcularMedioMasUsado(List<AuditoriaTransaccion> auditorias) {
        Map<String, Integer> cantidadMedio = new HashMap<>();

        List<DTOTopMedio> medios = new ArrayList<>();
        for (AuditoriaTransaccion auditoria : auditorias) {
            String medio = auditoria.getMetodoPago();
            if (medio == null || medio.isBlank()) {
                continue;
            }
            medio = medio.trim();

            Integer cantidadActual = cantidadMedio.getOrDefault(medio, 0);
            cantidadMedio.put(medio, cantidadActual + 1);
        }

        for (Map.Entry<String, Integer> entry : cantidadMedio.entrySet()) {
            DTOTopMedio dto = DTOTopMedio.builder()
                    .cantidadVeces(entry.getValue())
                    .nombreMedio(entry.getKey())
                    .build();
            medios.add(dto);
        }

        medios.sort((a, b) -> Integer.compare(b.getCantidadVeces(), a.getCantidadVeces()));

        return medios;
    }

    private List<DTOProporcionContrataciones> calcularProporcionContrataciones(
            DTOCantidadContrataciones contratacionesLugar,
            DTOCantidadContrataciones contratacionesServicio) {

        int cantLugares = contratacionesLugar.getCantidadContrataciones();
        int cantServicios = contratacionesServicio.getCantidadContrataciones();
        int total = cantLugares + cantServicios;

        List<DTOProporcionContrataciones> resultado = new ArrayList<>();

        if (total == 0) {
            return resultado;
        }

        double porcentajeLugares = (cantLugares * 100.0) / total;
        double porcentajeServicios = (cantServicios * 100.0) / total;

        resultado.add(DTOProporcionContrataciones.builder()
                .tipo("LUGAR")
                .cantidad(cantLugares)
                .porcentaje(porcentajeLugares)
                .build());

        resultado.add(DTOProporcionContrataciones.builder()
                .tipo("SERVICIO")
                .cantidad(cantServicios)
                .porcentaje(porcentajeServicios)
                .build());

        return resultado;
    }

}
