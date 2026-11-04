/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Reportes.CantidadVistasPorLugar.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Lugares.Entities.Lugar;
import com.wevently.wevently.Lugares.Entities.Provincia;
import com.wevently.wevently.Lugares.Repository.LugarRepository;
import com.wevently.wevently.Lugares.Repository.ProvinciaRepository;
import com.wevently.wevently.Pagos.Entities.AuditoriaTransaccion;
import com.wevently.wevently.Pagos.Repository.AuditoriaTransaccionRepository;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.DTO.DTOCantidadContrataciones;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.DTO.DTODatos;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.DTO.DTODatosGrafico;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.DTO.DTOGraficoPlatita;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.DTO.DTORangoFechas;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.Entities.MetricaVistasLugar;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.Repository.MetricaVistasLugarRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;

import lombok.extern.slf4j.Slf4j;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
public class VistasPorLugarService extends BaseService<MetricaVistasLugar, Long, MetricaVistasLugarRepository> {

    @Autowired
    private LugarRepository lugarRepository;

    @Autowired
    private ProvinciaRepository provinciaRepository;

    @Autowired
    private AuditoriaTransaccionRepository auditoriaTransaccionRepository;

    @Autowired
    private ReservaRepository reservaRepository;

    public VistasPorLugarService(MetricaVistasLugarRepository repository) {
        super(repository);
    }

    // crear la metrica cdo un usuario ingresa al detalle del lugar
    @Transactional(isolation = Isolation.SERIALIZABLE)
    public void registrarVistaLugarUsuario(Lugar lugar) {
        try {
            LocalDate hoy = LocalDate.now();

            Date fechaInicio = Date.from(hoy.atStartOfDay(ZoneId.systemDefault()).toInstant());
            Date fechaFin = Date.from(hoy.plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant());

            Optional<MetricaVistasLugar> metricaExistente = repository.findByLugarAndFechaVistaBetween(lugar,
                    fechaInicio, fechaFin);

            if (metricaExistente.isPresent()) {
                MetricaVistasLugar metrica = metricaExistente.get();
                metrica.setCantidadVistas(metrica.getCantidadVistas() + 1);
                repository.save(metrica);
                log.info("incrementando contador para lugar {} - total de vistas hoy: {}", lugar.getId(),
                        metrica.getCantidadVistas());
            } else {
                MetricaVistasLugar nuevaMetrica = new MetricaVistasLugar();
                nuevaMetrica.setFechaVista(new Date());
                nuevaMetrica.setCantidadVistas(1);
                nuevaMetrica.setLugar(lugar);
                repository.save(nuevaMetrica);
                log.info("Creada nueva métrica para lugar {} - Primer vista del día",
                        lugar.getId());
            }
        } catch (Exception e) {
            log.error("Error al registrar vista para lugar {}: {}",
                    lugar.getId(), e.getMessage());
        }
    }

    private List<MetricaVistasLugar> obtenerTodasXfecha(Date inicio, Date fin) {
        return repository.findByFechaVistaBetween(inicio, fin);
    }

    public List<DTODatos> armarDatosFront(DTORangoFechas fechas) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Usuario usuario = ((Usuario) auth.getPrincipal());
        log.info("El usuario recuperado es: {} {}", usuario.getId(), usuario.getNombre());

        List<Lugar> lugaresUsuario = lugarRepository.findByPropietario(usuario);
        log.info("Usuario {} tiene {} lugares", usuario.getId(), lugaresUsuario.size());

        // ajusto la fechas para q busqeu bien los datos
        LocalDate fechaDesdeLocal = fechas.getDesde().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate fechaHastaLocal = fechas.getHasta().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        Date fechaDesdeAjustada = Date.from(fechaDesdeLocal.atStartOfDay(ZoneId.systemDefault()).toInstant());
        Date fechaHastaAjustada = Date
                .from(fechaHastaLocal.plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant());

        log.info("Fecha desde original: {}, ajustada: {}", fechas.getDesde(), fechaDesdeAjustada);
        log.info("Fecha hasta original: {}, ajustada: {}", fechas.getHasta(), fechaHastaAjustada);

        List<MetricaVistasLugar> todasMetricas = obtenerTodasXfecha(fechaDesdeAjustada, fechaHastaAjustada);
        log.info("recupere la lista de metricas actividad con: {} ", todasMetricas.size());

        List<AuditoriaTransaccion> todasAuditorias = auditoriaTransaccionRepository.findByFechaHoraTransaccionBetween(
                fechas.getDesde().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime(),
                fechas.getHasta().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());

        List<DTODatos> resultado = new ArrayList<>();
        for (Lugar lugar : lugaresUsuario) {
            List<MetricaVistasLugar> metricasDelLugar = todasMetricas.stream()
                    .filter(m -> m.getLugar().getId().equals(lugar.getId()))
                    .toList();

            List<DTODatosGrafico> datosGrafico = construirDatosGrafico(metricasDelLugar, fechas.getDesde(),
                    fechas.getHasta());

            Provincia provincia = provinciaRepository.findByLocalidad(lugar.getLocalidad().getId());

            List<Reserva> reservasDelLugar = reservaRepository.findByLugar(lugar);

            List<AuditoriaTransaccion> transaccionesDelLugar = new ArrayList<>();
            for (Reserva reserva : reservasDelLugar) {
                for (AuditoriaTransaccion audi : todasAuditorias) {
                    if (audi.getReservaId().equals(reserva.getId())) {
                        transaccionesDelLugar.add(audi);
                    }
                }
            }

            DTOCantidadContrataciones dtoCantidadContrataciones = calcularCantidadContrataciones(transaccionesDelLugar,
                    fechaDesdeLocal, fechaHastaLocal);

            DTODatos dto = DTODatos.builder()
                    .idLugar(lugar.getId())
                    .nombreLugar(lugar.getNombre())
                    .localidad(lugar.getLocalidad().getNombre())
                    .provincia(provincia.getNombre())
                    .rangoFechas(fechas)
                    .datos(datosGrafico)
                    .cantidadContrataciones(dtoCantidadContrataciones)
                    .build();

            resultado.add(dto);
        }

        return resultado;
    }

    private List<DTODatosGrafico> construirDatosGrafico(List<MetricaVistasLugar> metricas, Date desde, Date hasta) {
        Map<LocalDate, Long> sumaXdia = new HashMap<>();

        LocalDate inicio = desde.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate fin = hasta.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        LocalDate fecha = inicio;
        while (!fecha.isAfter(fin)) {
            sumaXdia.put(fecha, 0L);
            fecha = fecha.plusDays(1);
        }

        for (MetricaVistasLugar metrica : metricas) {
            LocalDate dia = metrica.getFechaVista().toInstant()
                    .atZone(ZoneId.systemDefault())
                    .toLocalDate();

            Long suma = sumaXdia.getOrDefault(dia, 0L);
            sumaXdia.put(dia, suma + metrica.getCantidadVistas());
        }

        List<DTODatosGrafico> datosGrafico = new ArrayList<>();
        for (Map.Entry<LocalDate, Long> entry : sumaXdia.entrySet()) {
            DTODatosGrafico dato = DTODatosGrafico.builder()
                    .fecha(java.sql.Date.valueOf(entry.getKey()))
                    .cantidad(entry.getValue())
                    .build();
            datosGrafico.add(dato);
        }
        datosGrafico.sort(Comparator.comparing(DTODatosGrafico::getFecha));
        return datosGrafico;
    }

    private DTOCantidadContrataciones calcularCantidadContrataciones(List<AuditoriaTransaccion> transacciones,
            LocalDate desde, LocalDate hasta) {

        int cantidadContrataciones = transacciones.size();

        Map<LocalDate, BigDecimal> sumaXdia = new HashMap<>();

        LocalDate fecha = desde;
        while (!fecha.isAfter(hasta)) {
            sumaXdia.put(fecha, BigDecimal.ZERO);
            fecha = fecha.plusDays(1);
        }

        BigDecimal dineroGanado = BigDecimal.ZERO;
        for (AuditoriaTransaccion transaccion : transacciones) {
            LocalDate dia = transaccion.getFechaHoraCreacionAuditoria().toLocalDate();

            dineroGanado = dineroGanado.add(transaccion.getMontoAtransferir());

            BigDecimal suma = sumaXdia.getOrDefault(dia, BigDecimal.ZERO);
            sumaXdia.put(dia, suma.add(transaccion.getMontoAtransferir()));
        }

        List<DTOGraficoPlatita> ganaciasDiarias = new ArrayList<>();
        for (Map.Entry<LocalDate, BigDecimal> entry : sumaXdia.entrySet()) {
            DTOGraficoPlatita dto = DTOGraficoPlatita.builder()
                    .fecha(entry.getKey())
                    .cantidad(entry.getValue())
                    .build();

            ganaciasDiarias.add(dto);

        }
        ganaciasDiarias.sort(Comparator.comparing(DTOGraficoPlatita::getFecha));

        return DTOCantidadContrataciones.builder()
                .cantidadContrataciones(cantidadContrataciones)
                .dineroGanado(dineroGanado)
                .gananciasDiarias(ganaciasDiarias)
                .build();

    }

}
