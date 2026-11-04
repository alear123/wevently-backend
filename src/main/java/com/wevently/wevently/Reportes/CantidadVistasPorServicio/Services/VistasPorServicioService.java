package com.wevently.wevently.Reportes.CantidadVistasPorServicio.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.Provincia;
import com.wevently.wevently.Lugares.Repository.ProvinciaRepository;
import com.wevently.wevently.Pagos.Entities.AuditoriaTransaccion;
import com.wevently.wevently.Pagos.Repository.AuditoriaTransaccionRepository;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.DTO.DTORangoFechas;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.DTO.DTOGraficoPlatita;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.DTO.DTOCantidadContrataciones;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.DTO.DTODatos;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.DTO.DTODatosGrafico;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.DTO.DTOLocalidad;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.Entities.MetricaVistasServicio;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.Repository.MetricaVistasServicioRepository;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.Servicios.Repository.ServicioRepository;
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

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
public class VistasPorServicioService
        extends BaseService<MetricaVistasServicio, Long, MetricaVistasServicioRepository> {

    @Autowired
    private ServicioRepository servicioRepository;

    @Autowired
    private ProvinciaRepository provinciaRepository;

    @Autowired
    private ReservaRepository reservaRepository;

    @Autowired
    private AuditoriaTransaccionRepository auditoriaTransaccionRepository;

    public VistasPorServicioService(MetricaVistasServicioRepository repository) {
        super(repository);
    }

    @Transactional(isolation = Isolation.SERIALIZABLE)
    public void registrarVistaServicioUsuario(Servicio servi) {
        try {
            LocalDate hoy = LocalDate.now();

            Date fechaInicio = Date.from(hoy.atStartOfDay(ZoneId.systemDefault()).toInstant());
            Date fechaFin = Date.from(hoy.plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant());

            Optional<MetricaVistasServicio> metricaExistente = repository.findByServicioAndFechaVistaBetween(servi,
                    fechaInicio, fechaFin);

            if (metricaExistente.isPresent()) {
                MetricaVistasServicio metrica = metricaExistente.get();
                metrica.setCantidadVistas(metrica.getCantidadVistas() + 1);
                repository.save(metrica);
                log.info("incremento contador para servi {} - total de vistas hoy {}", servi.getId(),
                        metrica.getCantidadVistas());
            } else {
                MetricaVistasServicio nuevaMetrica = new MetricaVistasServicio();
                nuevaMetrica.setFechaVista(new Date());
                nuevaMetrica.setCantidadVistas(1);
                nuevaMetrica.setServicio(servi);
                repository.save(nuevaMetrica);
                log.info("nueva metrica creada para el servi {} - 1era vista del dia", servi.getId());
            }

        } catch (Exception e) {
            log.error("Error al registrar vista para servicio {}: {}",
                    servi.getId(), e.getMessage());
        }
    }

    public List<DTODatos> armarDatosFront(DTORangoFechas fechas) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Usuario usuario = (Usuario) auth.getPrincipal();

        List<Servicio> serviciosUsuario = servicioRepository.findByPrestador(usuario);
        log.info("el usuario {} tiene {} servicios", usuario.getId(), serviciosUsuario.size());

        LocalDate fechaDesdeLocal = fechas.getDesde().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate fechaHastaLocal = fechas.getHasta().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        Date fechaDesdeAjustada = Date.from(fechaDesdeLocal.atStartOfDay(ZoneId.systemDefault()).toInstant());
        Date fechaHastaAjustada = Date
                .from(fechaHastaLocal.plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant());

        log.info("Fecha desde original: {}, ajustada: {}", fechas.getDesde(), fechaDesdeAjustada);
        log.info("Fecha hasta original: {}, ajustada: {}", fechas.getHasta(), fechaHastaAjustada);

        List<MetricaVistasServicio> todasMetricas = repository.findByFechaVistaBetween(fechaDesdeAjustada,
                fechaHastaAjustada);
        log.info("recupere la lista con las metricas de servicio {}", todasMetricas.size());

        // recuepero als auditoria transaccion en el rango de fechas
        List<AuditoriaTransaccion> transacciones = auditoriaTransaccionRepository.findByFechaHoraTransaccionBetween(
                fechas.getDesde().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime(),
                fechas.getHasta().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());

        List<DTODatos> resultado = new ArrayList<>();
        for (Servicio servi : serviciosUsuario) {
            List<MetricaVistasServicio> metricasDelServicio = todasMetricas.stream()
                    .filter(s -> s.getServicio().getId().equals(servi.getId())).toList();

            List<DTODatosGrafico> datosGraficos = construirDatosPalGrafico(metricasDelServicio, fechas.getDesde(),
                    fechas.getHasta());

            List<Localidad> localidadesCobertura = servi.getAreaCobertura();

            List<DTOLocalidad> dtoLocalidades = localidadesCobertura.stream()
                    .map(localidad -> DTOLocalidad.builder()
                            .id(localidad.getId())
                            .nombreLocalidad(localidad.getNombre())
                            .build())
                    .toList();

            String nombreProvincia = obtenerNombreProvincia(localidadesCobertura);

            // Ahora recupero las reservas donde este el servi actual
            List<Reserva> reservas = reservaRepository.findByServicio(servi);

            // Ahora comparo las reservas con als transacciones y me quedo con als trasn q
            // si son
            List<AuditoriaTransaccion> transaccionesDelServi = new ArrayList<>();
            for (Reserva reserva : reservas) {
                for (AuditoriaTransaccion transaccion : transacciones) {
                    if (reserva.getId().equals(transaccion.getReservaId())) {
                        transaccionesDelServi.add(transaccion);
                    }
                }
            }

            DTOCantidadContrataciones dtoCantidadContrataciones = calcularCantidadContrataciones(transaccionesDelServi,
                    fechaDesdeLocal, fechaHastaLocal);

            DTODatos dto = DTODatos.builder()
                    .id(servi.getId())
                    .nombreServicio(servi.getNombre())
                    .provincia(nombreProvincia)
                    .localidad(dtoLocalidades)
                    .fechas(fechas)
                    .datos(datosGraficos)
                    .cantidadContrataciones(dtoCantidadContrataciones)
                    .build();

            resultado.add(dto);
        }
        return resultado;
    }

    private List<DTODatosGrafico> construirDatosPalGrafico(List<MetricaVistasServicio> metricas, Date desde,
            Date hasta) {
        Map<LocalDate, Long> sumaXdia = new HashMap<>();

        LocalDate inicio = desde.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate fin = hasta.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        log.info("Rango de fechas para grafico - Inicio: {}, Fin: {}", inicio, fin);

        inicio.datesUntil(fin.plusDays(1)).forEach(fecha -> sumaXdia.put(fecha, 0L));

        for (MetricaVistasServicio metrica : metricas) {
            LocalDate dia = metrica.getFechaVista().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            if ((dia.isEqual(inicio) || dia.isAfter(inicio)) && (dia.isEqual(fin) || dia.isBefore(fin))) {
                Long suma = sumaXdia.getOrDefault(dia, 0L);
                sumaXdia.put(dia, suma + metrica.getCantidadVistas());
                log.debug("Metrica para fecha {}: +{} vistas (total: {})", dia, metrica.getCantidadVistas(),
                        suma + metrica.getCantidadVistas());
            }
        }

        // Construir lista de resultados
        List<DTODatosGrafico> datosGrafico = new ArrayList<>();
        for (Map.Entry<LocalDate, Long> entry : sumaXdia.entrySet()) {
            DTODatosGrafico dato = DTODatosGrafico.builder()
                    .fecha(java.sql.Date.valueOf(entry.getKey()))
                    .cantidad(entry.getValue())
                    .build();

            datosGrafico.add(dato);
        }
        datosGrafico.sort(Comparator.comparing(DTODatosGrafico::getFecha));
        log.info("Total de días en el reporte: {}", datosGrafico.size());
        return datosGrafico;
    }

    private String obtenerNombreProvincia(List<Localidad> localidades) {
        if (localidades == null || localidades.isEmpty()) {
            return "Sin provincia";
        }

        Long primeraLocalidadId = localidades.get(0).getId();
        Provincia provincia = provinciaRepository.findByLocalidad(primeraLocalidadId);

        return provincia != null ? provincia.getNombre() : "Sin provincia";
    }

    private DTOCantidadContrataciones calcularCantidadContrataciones(List<AuditoriaTransaccion> transaccionesDelServi,
            LocalDate fechaDesde, LocalDate fechaHasta) {

        int cantidadContrataciones = transaccionesDelServi.size();

        Map<LocalDate, BigDecimal> sumaXdia = new HashMap<>();

        LocalDate fecha = fechaDesde;
        while (!fecha.isAfter(fechaHasta)) {
            sumaXdia.put(fecha, BigDecimal.ZERO);
            fecha = fecha.plusDays(1);
        }

        BigDecimal dineroGanado = BigDecimal.ZERO;
        for (AuditoriaTransaccion transaccion : transaccionesDelServi) {
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
                .comisionesDiarias(ganaciasDiarias)
                .build();
    }
}
