package com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.Services;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Entities.Reseña;
import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Lugares.Entities.Lugar;
import com.wevently.wevently.Lugares.Repository.LugarRepository;
import com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO.DTOCantidadReservas;
import com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO.DTODato;
import com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO.DTODatosLugar;
import com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO.DTORangoFechas;
import com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO.DTOResumenPeriodo;
import com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO.DTOTendenciaReseñas;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CantidadSolicitudesPorLugarService {

        @Autowired
        private ReservaRepository reservaRepository;

        @Autowired
        private LugarRepository lugarRepository;

        public DTODato hacerDatosFront(DTORangoFechas fechas) {

                Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                Usuario usuario = (Usuario) auth.getPrincipal();

                LocalDate fechaDesdeLocal = fechas.getDesde().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                LocalDate fechaHastaLocal = fechas.getHasta().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

                Date fechaDesdeAjustada = Date.from((fechaDesdeLocal.atStartOfDay(ZoneId.systemDefault())).toInstant());
                Date fechaHastaAjustada = Date
                                .from(fechaHastaLocal.plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant());

                log.info("Fecha desde original: {}, ajustada: {}", fechas.getDesde(), fechaDesdeAjustada);
                log.info("Fecha hasta original: {}, ajustada: {}", fechas.getHasta(), fechaHastaAjustada);

                List<Reserva> reservasDentroDelRango = reservaRepository
                                .findByFechaReservaBetweenAndPrestadorId(fechaDesdeAjustada, fechaHastaAjustada,
                                                usuario.getId());

                List<Lugar> lugaresDelUsuario = lugarRepository.findByPropietarioAndFechaHoraBajaIsNull(usuario);

                List<Reserva> reservasCompletas = new ArrayList<>();
                List<Reserva> reservasPendientes = new ArrayList<>();
                List<Reserva> reservasCanceladas = new ArrayList<>();

                for (Reserva reserva : reservasDentroDelRango) {
                        if (reserva.getEstadoReserva() == EstadoReserva.COMPLETO) {
                                reservasCompletas.add(reserva);
                        } else if (reserva.getEstadoReserva() == EstadoReserva.PARCIAL) {
                                reservasPendientes.add(reserva);
                        } else {
                                reservasCanceladas.add(reserva);
                        }
                }

                List<DTODatosLugar> lugares = new ArrayList<>();
                for (Lugar lugar : lugaresDelUsuario) {
                        List<DTOResumenPeriodo> resumen = calcularResumenPeriodos(reservasCompletas, lugar, fechas);

                        List<Lugar> lugaresSimilares = lugarRepository
                                        .findByTipoLugarAndFechaHoraBajaIsNull(lugar.getTipoLugar());
                        // calculo la cantidad de estrellas que tiene y como se compara con lugares de
                        // otros usuarios
                        DTOResumenPeriodo promedioEstrellas = calcularPromedioEstrellas(lugar, lugaresSimilares);
                        resumen.add(promedioEstrellas);

                        // Calcular tendencia temporal de reseñas
                        List<DTOTendenciaReseñas> tendenciaReseñas = calcularTendenciaReseñas(lugar, fechas);

                        DTOCantidadReservas confirmadas = contarReservas(reservasCompletas, lugar, "Confirmadas");
                        DTOCantidadReservas pendientes = contarReservas(reservasPendientes, lugar, "Parciales");
                        DTOCantidadReservas canceladas = contarReservas(reservasCanceladas, lugar, "Canceladas");

                        List<DTOCantidadReservas> cantidadReservas = new ArrayList<>();

                        cantidadReservas.add(confirmadas);
                        cantidadReservas.add(pendientes);
                        cantidadReservas.add(canceladas);

                        DTODatosLugar nuevo = DTODatosLugar.builder()
                                        .nombreLugar(lugar.getNombre())
                                        .idLugar(lugar.getId())
                                        .cantidadReservas(cantidadReservas)
                                        .resumen(resumen)
                                        .tendenciaReseñas(tendenciaReseñas)
                                        .build();

                        lugares.add(nuevo);
                }

                DTODato datoFinal = DTODato.builder()
                                .fechas(fechas)
                                .lugares(lugares)
                                .build();

                return datoFinal;
        }

        private List<DTOResumenPeriodo> calcularResumenPeriodos(List<Reserva> reservasCompletas, Lugar lugar,
                        DTORangoFechas fechas) {
                List<DTOResumenPeriodo> resumen = new ArrayList<>();

                List<Reserva> reservasLugar = reservasCompletas.stream()
                                .filter(reserva -> reserva.getLugar() != null &&
                                                Objects.requireNonNull(reserva.getLugar()).getId()
                                                                .equals(lugar.getId()))
                                .collect(Collectors.toList());

                // Días únicos con reservas completas
                Set<LocalDate> diasUnicos = new HashSet<>();
                double ingresos = 0.0;
                for (Reserva reserva : reservasLugar) {
                        LocalDate dia = reserva.getFechaReserva().toInstant().atZone(ZoneId.systemDefault())
                                        .toLocalDate();
                        diasUnicos.add(dia);
                        if (reserva.getPrecioReserva() != null) {
                                ingresos += reserva.getPrecioReserva();
                        }
                }
                long uniqueDays = diasUnicos.size();

                // Días totales en rango
                LocalDate fechaDesdeLocal = fechas.getDesde().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                LocalDate fechaHastaLocal = fechas.getHasta().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                long totalDays = ChronoUnit.DAYS.between(fechaDesdeLocal, fechaHastaLocal) + 1; // Inclusivo

                // Tasa de ocupación (%)
                double tasaOcupacion = totalDays > 0 ? (uniqueDays / (double) totalDays) * 100 : 0;

                // DTOResumenPeriodo para ocupación
                String valorOcupacion = String.format("%.2f%%", tasaOcupacion);
                DTOResumenPeriodo ocupacion = DTOResumenPeriodo.builder()
                                .periodo("Rango Seleccionado")
                                .valor(valorOcupacion)
                                .icono("📊")
                                .descripcion("Tasa de ocupación")
                                .build();

                // DTOResumenPeriodo para ingresos
                String valorIngresos = String.format("$%.2f", ingresos);
                DTOResumenPeriodo ingresosItem = DTOResumenPeriodo.builder()
                                .periodo("Rango Seleccionado")
                                .valor(valorIngresos)
                                .icono("💵")
                                .descripcion("Ingresos generados")
                                .build();

                resumen.add(ocupacion);
                resumen.add(ingresosItem);

                log.info("Resumen para lugar {}: ocupacion {}%, ingresos ${}", lugar.getNombre(), valorOcupacion,
                                valorIngresos);

                return resumen;
        }

        private DTOCantidadReservas contarReservas(List<Reserva> reservas, Lugar lugar, String estado) {
                List<Reserva> reservasLugar = reservas.stream()
                                .filter(reserva -> reserva.getLugar() != null
                                                && reserva.getLugar().getId().equals(lugar.getId()))
                                .collect(Collectors.toList());

                long cantidad = reservasLugar.size();
                // String estado = reservasLugar.isEmpty() ? "NINGUNA" :
                // reservasLugar.get(0).getEstadoReserva().name();

                log.info("Conteo para lugar {} y estado {}: {}", lugar.getNombre(), estado, cantidad);

                return DTOCantidadReservas.builder()
                                .cantidadReservas(cantidad)
                                .estadoReserva(estado)
                                .build();
        }

        private DTOResumenPeriodo calcularPromedioEstrellas(Lugar lugar, List<Lugar> todosLugares) {
                // Calcular promedio del lugar específico
                double promedioLugar = lugar.getReseñas().stream()
                                .mapToDouble(Reseña::getEstrellas)
                                .average()
                                .orElse(0.0);

                // Calcular promedio de lugares del mismo tipo
                double promedioTipo = todosLugares.stream()
                                .filter(l -> l.getTipoLugar().equals(lugar.getTipoLugar()))
                                .flatMap(l -> l.getReseñas().stream())
                                .mapToDouble(Reseña::getEstrellas)
                                .average()
                                .orElse(0.0);

                // Determinar si está por encima o por debajo del promedio
                String comparacion = promedioLugar > promedioTipo ? "↑" : "↓";
                String valor = String.format("%.1f (%s)",
                                promedioLugar, comparacion);

                return DTOResumenPeriodo.builder()
                                .periodo("Total de reseñas: " + lugar.getReseñas().size())
                                .valor(valor)
                                .icono("⭐")
                                .descripcion("Calificación promedio (tendencia)")
                                .build();
        }

        private List<DTOTendenciaReseñas> calcularTendenciaReseñas(Lugar lugar, DTORangoFechas fechas) {
                LocalDate inicio = fechas.getDesde().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                LocalDate fin = fechas.getHasta().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

                log.info("Calculando tendencia de reseñas para lugar {} - Rango: {} a {}",
                                lugar.getNombre(), inicio, fin);

                // Mapa para agrupar reseñas por día
                Map<LocalDate, List<Reseña>> reseñasPorDia = new HashMap<>();

                // Inicializar todos los días del rango con listas vacías
                inicio.datesUntil(fin.plusDays(1)).forEach(fecha -> reseñasPorDia.put(fecha, new ArrayList<>()));

                // Agrupar las reseñas por fecha
                for (Reseña reseña : lugar.getReseñas()) {
                        if (reseña.getFechaHoraAlta() != null) {
                                LocalDate diaReseña = reseña.getFechaHoraAlta().toLocalDate();

                                // Solo incluir reseñas dentro del rango de fechas
                                if ((diaReseña.isEqual(inicio) || diaReseña.isAfter(inicio)) &&
                                                (diaReseña.isEqual(fin) || diaReseña.isBefore(fin))) {

                                        reseñasPorDia.computeIfAbsent(diaReseña, k -> new ArrayList<>()).add(reseña);
                                }
                        }
                }

                // Construir la lista de resultados
                List<DTOTendenciaReseñas> tendencia = new ArrayList<>();
                for (Map.Entry<LocalDate, List<Reseña>> entry : reseñasPorDia.entrySet()) {
                        LocalDate fecha = entry.getKey();
                        List<Reseña> reseñasDia = entry.getValue();

                        // Calcular promedio de estrellas para el día
                        double promedioEstrellas = reseñasDia.isEmpty() ? 0.0
                                        : reseñasDia.stream()
                                                        .mapToDouble(Reseña::getEstrellas)
                                                        .average()
                                                        .orElse(0.0);

                        DTOTendenciaReseñas dto = DTOTendenciaReseñas.builder()
                                        .fecha(fecha)
                                        .promedioEstrellas(promedioEstrellas)
                                        .cantidadReseñas(reseñasDia.size())
                                        .build();

                        tendencia.add(dto);
                }

                // Ordenar por fecha
                tendencia.sort(Comparator.comparing(DTOTendenciaReseñas::getFecha));

                log.info("Tendencia calculada - Total de días: {}, Reseñas procesadas: {}",
                                tendencia.size(), lugar.getReseñas().size());

                return tendencia;
        }
}
