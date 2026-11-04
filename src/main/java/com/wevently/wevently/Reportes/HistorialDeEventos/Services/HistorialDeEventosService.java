package com.wevently.wevently.Reportes.HistorialDeEventos.Services;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wevently.wevently.Eventos.Entities.Evento;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import com.wevently.wevently.Eventos.Repository.EventoRepository;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Reportes.HistorialDeEventos.DTO.DTODato;
import com.wevently.wevently.Reportes.HistorialDeEventos.DTO.DTOResumenEvento;
import com.wevently.wevently.Reportes.HistorialDeEventos.DTO.DTOResumenPeriodo;
import com.wevently.wevently.Reportes.HistorialDeEventos.DTO.DTORangoFechas;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class HistorialDeEventosService {

        @Autowired
        private EventoRepository eventoRepository;

        @Autowired
        private ReservaRepository reservaRepository;

        private List<Evento> obtenerEventosDelUsuario(Usuario usuario, LocalDate fechaDesde, LocalDate fechaHasta) {
                // List<Long> eventosIds =
                // usuario.getEventos().stream().map(Evento::getId).collect(Collectors.toList());
                Long usuarioId = usuario.getId();

                return eventoRepository.findEventosByUsuarioIdYFechas(usuarioId, fechaDesde, fechaHasta);
        }

        private List<DTOResumenPeriodo> crearResumenVacio() {
                List<DTOResumenPeriodo> resumen = new ArrayList<>();

                resumen.add(DTOResumenPeriodo.builder()
                                .periodo("Total de eventos organizados")
                                .valor("0")
                                .icono("🥳")
                                .descripcion("En el período elegido")
                                .build());

                resumen.add(DTOResumenPeriodo.builder()
                                .periodo("Cantidad de lugares contratados")
                                .valor("0")
                                .icono("📍")
                                .descripcion("En el período elegido")
                                .build());

                resumen.add(DTOResumenPeriodo.builder()
                                .periodo("Cantidad de servicios contratados")
                                .valor("0")
                                .icono("🤝")
                                .descripcion("En el período elegido")
                                .build());

                resumen.add(DTOResumenPeriodo.builder()
                                .periodo("Gasto Promedio")
                                .valor("$0.00")
                                .icono("💸")
                                .descripcion("por eventos, dentro del periódo")
                                .build());

                return resumen;
        }

        @Transactional(readOnly = true)
        public DTODato organizarDatosFront(DTORangoFechas fechas) {

                Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                Usuario usuario = (Usuario) auth.getPrincipal();

                LocalDate fechaDesdeLocal = fechas.getDesde().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                LocalDate fechaHastaLocal = fechas.getHasta().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

                log.info("Generando reporte para usuario: {} desde {} hasta {}",
                                usuario.getId(), fechaDesdeLocal, fechaHastaLocal);

                List<Evento> eventos = obtenerEventosDelUsuario(usuario, fechaDesdeLocal, fechaHastaLocal);

                if (eventos.isEmpty()) {
                        log.info("No se encontraron eventos para el usuario en el rango de fechas seleccionado");
                        return DTODato.builder()
                                        .fechas(fechas)
                                        .resumen(crearResumenVacio())
                                        .eventos(new ArrayList<>())
                                        .build();
                }

                List<Long> eventosIds = eventos.stream()
                                .map(Evento::getId)
                                .collect(Collectors.toList());

                // Obtener todas las reservas asociadas a estos eventos
                List<EstadoReserva> estadosValidos = Arrays.asList(
                                EstadoReserva.COMPLETO);

                List<Reserva> reservas = reservaRepository.findReservasByUsuarioYEventos(
                                usuario.getId(),
                                eventosIds,
                                estadosValidos);

                Map<Long, List<Reserva>> reservasPorEvento = reservas.stream()
                                .collect(Collectors.groupingBy(r -> r.getEvento().getId()));

                List<DTOResumenEvento> eventosDTO = eventos.stream()
                                .map(evento -> construirDTOEvento(evento, reservasPorEvento.get(evento.getId())))
                                .collect(Collectors.toList());

                List<DTOResumenPeriodo> resumen = construirResumenPeriodo(eventos, reservas);

                return DTODato.builder()
                                .fechas(fechas)
                                .resumen(resumen)
                                .eventos(eventosDTO)
                                .build();

        }

        private DTOResumenEvento construirDTOEvento(Evento evento, List<Reserva> reservas) {
                BigDecimal totalGastado = BigDecimal.ZERO;
                int cantidadLugares = 0;
                int cantidadServicios = 0;
                String nombreLugar = "Sin lugar asignado";

                if (reservas != null && !reservas.isEmpty()) {
                        for (Reserva reserva : reservas) {
                                if (reserva.getPrecioReserva() != null) {
                                        BigDecimal precioReserva = BigDecimal.valueOf(reserva.getPrecioReserva());
                                        totalGastado = totalGastado.add(precioReserva);
                                }

                                if (reserva.getLugar() != null) {
                                        cantidadLugares++;
                                        if (nombreLugar.equals("Sin lugar asignado")) {
                                                nombreLugar = reserva.getLugar().getNombre();
                                        }
                                }

                                if (reserva.getServicio() != null) {
                                        cantidadServicios++;
                                }
                        }
                }

                return DTOResumenEvento.builder()
                                .idEvento(evento.getId())
                                .nombreEvento(evento.getNombre())
                                .nombreLugar(nombreLugar)
                                .descripcionEvento(evento.getDescripcion())
                                .fecha(evento.getFecha())
                                .horaInicio(evento.getHoraInicio())
                                .horaFin(evento.getHoraFin())
                                .personas(evento.getPersonas())
                                .totalGastado(totalGastado.setScale(2, RoundingMode.HALF_UP))
                                .estadoEvento(evento.getEstadoEvento().getNombre())
                                .cantidadLugares(cantidadLugares)
                                .cantidadServicios(cantidadServicios)
                                .build();
        }

        private List<DTOResumenPeriodo> construirResumenPeriodo(List<Evento> eventos, List<Reserva> reservas) {
                List<DTOResumenPeriodo> resumen = new ArrayList<>();

                resumen.add(DTOResumenPeriodo.builder()
                                .periodo("cantidad de eventos creados")
                                .valor(String.valueOf(eventos.size()))
                                .icono("🥳")
                                .descripcion("en el período elegido")
                                .build());

                long cantidadLugares = reservas.stream()
                                .filter(r -> r.getLugar() != null)
                                .map(r -> r.getLugar().getId())
                                .distinct()
                                .count();

                resumen.add(DTOResumenPeriodo.builder()
                                .periodo("cantidad de lugares contratados")
                                .valor(String.valueOf(cantidadLugares))
                                .icono("🏙️")
                                .descripcion("en el período elegido")
                                .build());

                long cantidadServicios = reservas.stream()
                                .filter(r -> r.getServicio() != null)
                                .map(r -> r.getServicio().getId())
                                .distinct()
                                .count();

                resumen.add(DTOResumenPeriodo.builder()
                                .periodo("cantidad de servicios contratados")
                                .valor(String.valueOf(cantidadServicios))
                                .icono("🤝")
                                .descripcion("en el período elegido")
                                .build());

                double totalGastado = reservas.stream()
                                .filter(r -> r.getPrecioReserva() != null)
                                .mapToDouble(Reserva::getPrecioReserva)
                                .sum();

                double promedioGasto = eventos.size() > 0 ? totalGastado / eventos.size() : 0.0;

                resumen.add(DTOResumenPeriodo.builder()
                                .periodo("Gasto Promedio")
                                .valor(String.format("$%.2f", promedioGasto))
                                .icono("💸")
                                .descripcion("por evento, dentro del período")
                                .build());

                return resumen;
        }
}
