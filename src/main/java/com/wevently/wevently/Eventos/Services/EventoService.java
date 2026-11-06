/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Eventos.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.DTO.DtoEvento;
import com.wevently.wevently.Eventos.DTO.DtoLugarContratado;
import com.wevently.wevently.Eventos.DTO.DtoNuevoEvento;
import com.wevently.wevently.Eventos.DTO.DtoServicioContratado;
import com.wevently.wevently.Eventos.Entities.EstadoEvento;
import com.wevently.wevently.Eventos.Entities.Evento;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Entities.TipoEvento;
import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import com.wevently.wevently.Eventos.Repository.EstadoEventoRepository;
import com.wevently.wevently.Eventos.Repository.EventoRepository;
import com.wevently.wevently.Eventos.Repository.TipoEventoRepository;
import com.wevently.wevently.Imagenes.Services.ImagenService;
import com.wevently.wevently.Servicios.Repository.ChatRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;

import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class EventoService extends BaseService<Evento, Long, EventoRepository> {

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    TipoEventoRepository tipoEventoRepository;

    @Autowired
    EstadoEventoRepository estadoEventoRepository;

    @Autowired
    ChatRepository chatRepository;

    @Autowired
    ImagenService imagenService;

    public EventoService(EventoRepository repository) {
        super(repository);
    }

    public List<DtoEvento> getEventosByUsuarioEmail(String email) {
        Usuario usuario = usuarioRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        String proyectoPath = System.getProperty("user.dir");
        System.out.println("Ruta del proyecto: " + proyectoPath);

        return usuario.getEventos().stream()
                .map(evento -> {
                    // Tomamos la primera imagen de los lugares de las reservas
                    String rutaImagen = evento.getReservas().stream()
                            .filter(r -> r.getLugar() != null)
                            .filter(r -> r.getEstadoReserva().equals(EstadoReserva.COMPLETO))
                            .map(Reserva::getLugar)
                            .filter(lugar -> lugar.getImagenes() != null && !lugar.getImagenes().isEmpty())
                            .map(lugar -> {
                                String ruta = lugar.getImagenes().getFirst().getFilePath();
                                System.out.println("Ruta desde BD: " + ruta);
                                return ruta;
                            })
                            .findFirst()
                            .orElse(proyectoPath + "/imagenes/default.jpg");

                    if (!rutaImagen.startsWith(proyectoPath)) {
                        rutaImagen = proyectoPath + "/imagenes/" + rutaImagen;
                    }

                    System.out.println("Ruta a buscar: " + rutaImagen);
                    String imagenBase64;
                    try {
                        imagenBase64 = imagenService.buscar(rutaImagen);
                        System.out.println("Imagen encontrada: " + (imagenBase64 != null));
                    } catch (Exception e) {
                        imagenBase64 = null;
                    }

                    return new DtoEvento(evento, imagenBase64);
                })
                .toList();
    }

    @Transactional
    public Evento crearNuevoEvento(DtoNuevoEvento dtoNuevoEvento, String email) {

        Usuario usuario = usuarioRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        Evento evento = new Evento();
        evento.setNombre(dtoNuevoEvento.getNombre());
        evento.setDescripcion(dtoNuevoEvento.getDescripcion());
        evento.setFecha(LocalDate.parse(dtoNuevoEvento.getFecha()));
        evento.setHoraInicio(LocalTime.parse(dtoNuevoEvento.getHoraInicio()));
        evento.setHoraFin(LocalTime.parse(dtoNuevoEvento.getHoraFin()));
        evento.setPersonas(dtoNuevoEvento.getPersonas());

        TipoEvento tipoEvento = tipoEventoRepository.findByIdAndFechaHoraBajaIsNull(dtoNuevoEvento.getIdTipoEvento())
                .orElseThrow(() -> new EntityNotFoundException(
                        "Tipo de evento no encontrado con id: " + dtoNuevoEvento.getIdTipoEvento()));

        evento.setTipoEvento(tipoEvento);

        EstadoEvento estadoEvento = estadoEventoRepository.findByNombre("Pendiente");
        if (estadoEvento == null) {
            throw new EntityNotFoundException("Estado de evento 'Pendiente' no encontrado");
        }
        evento.setEstadoEvento(estadoEvento);

        evento.setFechaHoraAlta(LocalDateTime.now());
        evento.setFechaHoraBaja(null);

        usuario.getEventos().add(evento);
        evento.setReservas(List.of());
        evento = repository.save(evento);
        usuarioRepository.save(usuario);

        return evento;
    }

    @Transactional
    public DtoNuevoEvento editarEvento(DtoNuevoEvento dtoNuevoEvento, Long idEvento, String email) {
        Usuario usuario = usuarioRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        Evento evento = repository.findById(idEvento)
                .orElseThrow(() -> new EntityNotFoundException("Evento no encontrado con id: " + idEvento));

        if (!usuario.getEventos().contains(evento)) {
            throw new SecurityException("El usuario no tiene permiso para editar este evento");
        }

        evento.setNombre(dtoNuevoEvento.getNombre());
        evento.setDescripcion(dtoNuevoEvento.getDescripcion());
        evento.setHoraInicio(LocalTime.parse(dtoNuevoEvento.getHoraInicio()));
        evento.setHoraFin(LocalTime.parse(dtoNuevoEvento.getHoraFin()));
        evento.setPersonas(dtoNuevoEvento.getPersonas());
        evento = repository.save(evento);
        return dtoNuevoEvento;
    }

    @Transactional
    public Evento cancelarEvento(Long idEvento, String email) {
        Usuario usuario = usuarioRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        Evento evento = repository.findById(idEvento)
                .orElseThrow(() -> new EntityNotFoundException("Evento no encontrado con id: " + idEvento));

        if (!usuario.getEventos().contains(evento)) {
            throw new SecurityException("El usuario no tiene permiso para cancelar este evento");
        }

        evento.getReservas().forEach(reserva -> {
            reserva.setEstadoReserva(EstadoReserva.CANCELADA);
            reserva.setFechaHoraBaja(LocalDateTime.now());
        });
        evento.setEstadoEvento(estadoEventoRepository.findByNombre("Cancelado"));
        evento.setFechaHoraBaja(LocalDateTime.now());
        repository.save(evento);
        return evento;
    }

    public double calcularRating(List<Integer> ratings) {
        if (ratings == null || ratings.isEmpty()) {
            return 0;
        }
        Integer suma = 0;
        for (Integer rating : ratings) {
            suma += rating;
        }
        return (double) ((double) suma / (double) ratings.size());
    }

    public DtoLugarContratado obtenerLugar(Long idEvento, String email) throws Exception {
        Usuario usuario = usuarioRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        Evento evento = repository.findById(idEvento)
                .orElseThrow(() -> new EntityNotFoundException("Evento no encontrado con id: " + idEvento));

        if(evento.getEstadoEvento().getNombre().equals("Cancelado")){
            throw new ErrorDeNegocio("Este evento está cancelado, no se puede acceder a sus contrataciones");
        }
        if (!usuario.getEventos().contains(evento)) {
            throw new SecurityException("El usuario no tiene permiso para ver este evento");
        }

        Reserva reserva = evento.getReservas().stream()
                .filter(r -> r.getLugar() != null)
                .filter(r -> r.getEstadoReserva().equals(EstadoReserva.COMPLETO))
                .findFirst()
                .orElse(null);

        if (reserva == null) {
            System.out.println("No hay lugar contratado para este evento");
            return null;
        }

        DtoLugarContratado dtoLugarContratado = new DtoLugarContratado();
        dtoLugarContratado.setId(reserva.getLugar().getId());
        dtoLugarContratado.setNombre(reserva.getLugar().getNombre());
        dtoLugarContratado.setDireccion(reserva.getLugar().getDireccion());
        dtoLugarContratado.setCapacidad(reserva.getLugar().getCapacidadPersonas());
        dtoLugarContratado.setDescripcion(reserva.getLugar().getDescripcion());
        dtoLugarContratado.setRating(
                calcularRating(reserva.getLugar().getReseñas().stream().map(r -> r.getEstrellas()).toList()));
        dtoLugarContratado.setCantReviews(reserva.getLugar().getReseñas().size());
        dtoLugarContratado
                .setCaracteristicas(reserva.getLugar().getCaracteristicas().stream().map(c -> c.getNombre()).toList());
        dtoLugarContratado.setImagenes(
                reserva.getLugar().getImagenes().stream()
                        .limit(3)
                        .map(i -> i.getFilePath())
                        .toList());
        dtoLugarContratado.setTelefono(reserva.getLugar().getPropietario().getTelefono());
        dtoLugarContratado.setEmail(reserva.getLugar().getPropietario().getEmail());
        dtoLugarContratado.setPrecio(reserva.getLugar().getLugarPrecios().stream()
                .filter(lp -> lp.getFechaHasta() == null)
                .findFirst()
                .map(lp -> lp.getPrecio().floatValue())
                .orElse(0f));
        dtoLugarContratado.setTipo(reserva.getLugar().getTipoLugar().getNombre());
        String proyectoPath = System.getProperty("user.dir");
        System.out.println("Ruta del proyecto: " + proyectoPath);
        dtoLugarContratado.setImagenes(
                reserva.getLugar().getImagenes().stream()
                        .limit(3)
                        .map(i -> {
                            String ruta = i.getFilePath();
                            System.out.println("Ruta desde BD: " + ruta);
                            if (!ruta.startsWith(proyectoPath)) {
                                ruta = proyectoPath + "/imagenes/" + ruta;
                            }
                            System.out.println("Ruta a buscar: " + ruta);
                            String imagenBase64;
                            try {
                                imagenBase64 = imagenService.buscar(ruta);
                                System.out.println("Imagen encontrada: " + (imagenBase64 != null));
                            } catch (Exception e) {
                                imagenBase64 = null;
                            }
                            return imagenBase64;
                        })
                        .toList());

        return dtoLugarContratado;

    }

    public List<DtoServicioContratado> obtenerServiciosContratados(Long idEvento, String email) throws Exception {
        Usuario usuario = usuarioRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        Evento evento = repository.findById(idEvento)
                .orElseThrow(() -> new EntityNotFoundException("Evento no encontrado con id: " + idEvento));

        if(evento.getEstadoEvento().getNombre().equals("Cancelado")){
            throw new ErrorDeNegocio("Este evento está cancelado, no se puede acceder a sus contrataciones");
        }

        if (!usuario.getEventos().contains(evento)) {
            throw new SecurityException("El usuario no tiene permiso para ver este evento");
        }

        List<Reserva> reservas = evento.getReservas().stream()
                .filter(r -> r.getServicio() != null)
                .toList();

        if (reservas.isEmpty()) {
            System.out.println("No hay servicios contratados para este evento");
        }

        return reservas.stream().map(reserva -> {
            DtoServicioContratado dtoServicioContratado = new DtoServicioContratado();
            dtoServicioContratado.setId(reserva.getServicio().getId());
            dtoServicioContratado.setNombre(reserva.getServicio().getNombre());
            dtoServicioContratado.setDescripcion(reserva.getServicio().getDescripcion());
            dtoServicioContratado.setEstado(reserva.getEstadoReserva().toString());
            dtoServicioContratado.setTipo(reserva.getServicio().getTipoServicio().getNombre().toString());
            dtoServicioContratado.setCantidadResenas(reserva.getServicio().getReseñas().size());
            dtoServicioContratado.setPuntuacion(calcularRating(reserva.getServicio().getReseñas().stream()
                    .map(r -> r.getEstrellas())
                    .toList()));
            dtoServicioContratado.setFechaContratacion(reserva.getFechaHoraAlta().toLocalDate());
            // dtoServicioContratado.setDuracion(reserva.getDuracion());

            dtoServicioContratado.setIdChat(
                    chatRepository.findByReserva(reserva)
                            .map(chat -> chat.getId()) // si existe, devuelve el id
                            .orElse(null) // si no existe, devuelve null
            );
            if (reserva.getPropuesta() != null) {
                dtoServicioContratado.setPrecio(reserva.getPropuesta().getPresupuestoTotal().floatValue());
            } else {
                dtoServicioContratado.setPrecio(00);
            }
            dtoServicioContratado.setProveedor(reserva.getServicio().getPrestador().getNombre() + " "
                    + reserva.getServicio().getPrestador().getApellido());
            return dtoServicioContratado;
        }).toList();
    }

    @Transactional
    @Scheduled(cron = "0 0 2 * * *") // Todos los días a las 2:00 AM
    public void actualizarEventosRealizados() {
        LocalDate hoy = LocalDate.now();

        EstadoEvento estadoRealizado = estadoEventoRepository.findByNombre("Realizado");
        if (estadoRealizado == null) {
            throw new EntityNotFoundException("Estado de evento 'Realizado' no encontrado");
        }

        List<Evento> eventos = repository.findAll();
        for (Evento evento : eventos) {
            // Verificar si el evento es hoy o ya pasó, y además si está Pendiente
            if ((evento.getFecha().isBefore(hoy) || evento.getFecha().isEqual(hoy)) &&
                    evento.getEstadoEvento().getNombre().equalsIgnoreCase("Pendiente")) {

                evento.setEstadoEvento(estadoRealizado);
                repository.save(evento);
            }
        }
    }



}