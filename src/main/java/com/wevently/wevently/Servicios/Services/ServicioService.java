/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Servicios.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Eventos.Entities.Reseña;
import com.wevently.wevently.Imagenes.Entities.Imagen;
import com.wevently.wevently.Lugares.DTO.DtoLugar;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.Lugar;
import com.wevently.wevently.Lugares.Repository.LocalidadRepository;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.Services.VistasPorServicioService;
import com.wevently.wevently.Lugares.Repository.ProvinciaRepository;
import com.wevently.wevently.Servicios.DTO.*;
import com.wevently.wevently.Servicios.Entities.Chat;
import com.wevently.wevently.Eventos.Entities.EstadoEvento;
import com.wevently.wevently.Eventos.Entities.Evento;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import com.wevently.wevently.Servicios.Entities.EstadoServicio;
import com.wevently.wevently.Servicios.Entities.TipoServicio;
import com.wevently.wevently.Servicios.Repository.ChatRepository;
import com.wevently.wevently.Eventos.Repository.EstadoEventoRepository;
import com.wevently.wevently.Eventos.Repository.EventoRepository;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Imagenes.Services.ImagenService;
import com.wevently.wevently.Lugares.DTO.DtoEventoDisponible;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.Servicios.Repository.EstadoServicioRepository;
import com.wevently.wevently.Servicios.Repository.ServicioRepository;
import com.wevently.wevently.Servicios.Repository.TipoServicioRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;
import java.util.stream.Stream;

import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicioService extends BaseService<Servicio, Long, ServicioRepository> {

    @Autowired
    private ReservaRepository repoReserva;

    @Autowired
    private ImagenService imagenService;

    @Autowired
    private UsuarioRepository repoUsuario;

    @Autowired
    private EventoRepository repoEvento;

    @Autowired
    private ServicioRepository repoServicio;

    @Autowired
    private ChatRepository repoChat;

    @Autowired
    private TipoServicioRepository repoTipoServicio;

    @Autowired
    private EstadoServicioRepository repoEstadoServicio;

    @Autowired
    private LocalidadRepository repoLocalidad;

    @Autowired
    private VistasPorServicioService vistasPorServicioService;

    @Autowired
    private EstadoEventoRepository repoEstadoEvento;

    @Autowired
    private ProvinciaRepository repoProvincia;

    public ServicioService(ServicioRepository repository) {
        super(repository);
    }

    public DtoVerDetalleServicio verDetalleServicio(Long idServicio) {
        Servicio servicio = repository.findById(idServicio)
                .orElseThrow(() -> new RuntimeException("Servicio no encontrado"));

        vistasPorServicioService.registrarVistaServicioUsuario(servicio);

        DtoVerDetalleServicio dto = new DtoVerDetalleServicio();
        dto.setId(servicio.getId());
        dto.setNombre(servicio.getNombre());
        dto.setLocalidades(
                servicio.getAreaCobertura()
                        .stream()
                        .map(Localidad::getNombre)
                        .toList());
        dto.setProvincia(repoProvincia.findByLocalidad(servicio.getAreaCobertura().getFirst().getId()).getNombre());

        String proyectoPath = System.getProperty("user.dir");
        System.out.println("Ruta del proyecto: " + proyectoPath);

        List<String> rutasImagenes = servicio.getImagenes().stream().map(i -> i.getFilePath()).toList();

        List<String> imagenesConURL = rutasImagenes.stream()
                .map(ruta -> {
                    if (!ruta.startsWith(proyectoPath)) {
                        ruta = proyectoPath + "/imagenes/" + ruta;
                    }
                    System.out.println("Ruta de la imagen: " + ruta);
                    return imagenService.buscar(ruta);
                })
                .toList();
        dto.setImagenes(imagenesConURL);

        dto.setTipoServicio(servicio.getTipoServicio().getNombre());
        dto.setCountReviews(servicio.getReseñas().size());
        dto.setRating(servicio.getReseñas().stream().mapToDouble(r -> r.getEstrellas()).average().orElse(0.0));

        dto.setDescripcion(servicio.getDescripcion());
        dto.setPrestador(servicio.getPrestador().getNombre() + " " + servicio.getPrestador().getApellido());

        List<Reserva> reservas = repoReserva.findByLugarIsNull();
        List<Date> fechasReservadas = reservas.stream()
                .filter(reserva -> reserva.getServicio().getId().equals(idServicio))
                .filter(reserva -> reserva.getEstadoReserva().equals(EstadoReserva.COMPLETO))
                .map(Reserva::getFechaReserva)
                .toList();
        dto.setFechasReservadas(fechasReservadas);

        List<DtoReseña> reseñas = new ArrayList<DtoReseña>();
        servicio.getReseñas().forEach(r -> {
            DtoReseña dtoReseña = new DtoReseña();
            dtoReseña.setId(r.getId());
            dtoReseña.setComentario(r.getDescripcion());
            dtoReseña.setRating(r.getEstrellas());
            dtoReseña.setUsuario(r.getUsuario().getNombre() + " " + r.getUsuario().getApellido());
            reseñas.add(dtoReseña);
            System.out.println("Reseña agregada: " + dtoReseña.getComentario() + " de " + dtoReseña.getUsuario());
        });
        dto.setReseñas(reseñas);
        return dto;
    }

    public List<DtoEventoDisponible> obtenerEventosPorUsuarioYFecha(String email, Date fecha, Long idServicio) {
        // traer todos los eventos en
        // - estado pendiente
        // - en fecha elegida
        // - eventos que no tengan lugar contratado
        // - evetnos que tengan lugar contratado y esten dentro del area de cobertura
        // - eventos que tengan lugar contratado y soporten el tipo de servicio a
        // contratar
        // - eventos que tengan lugar contratado y esten dentro del area de cobertura
        // del servicio

        // buscamos al usuario
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        // convertimos la fecha
        LocalDate localFecha = fecha.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        // buscamos el servicio
        Servicio servicio = repoServicio.findById(idServicio)
                .orElseThrow(() -> new RuntimeException("Servicio no encontrado"));

        EstadoEvento estadoEvento = repoEstadoEvento.findByNombre("Pendiente");

        // filtramos los eventos de un usuario por fecha y estado pendiente
        List<Evento> eventosEnFecha = usuario.getEventos().stream()
                .filter(e -> e.getFecha().equals(localFecha))
                .filter(ep -> ep.getEstadoEvento().equals(estadoEvento))
                .toList();

        // nos quedamos con los eventos que no tienen lugar reservado
        List<Evento> eventosSinLugar = eventosEnFecha.stream()
                .filter(e -> e.getReservas() == null || e.getReservas().isEmpty() ||
                        e.getReservas().stream()
                                .noneMatch(r -> r.getLugar() != null && r.getEstadoReserva() == EstadoReserva.COMPLETO))
                .toList();

        TipoServicio tipoServicio = servicio.getTipoServicio();

        List<Evento> eventosConLugarSoportaServicio = eventosEnFecha.stream()
                .filter(e -> e.getReservas() != null && !e.getReservas().isEmpty() &&
                        e.getReservas().stream()
                                .anyMatch(r -> r.getLugar() != null &&
                                        r.getEstadoReserva() == EstadoReserva.COMPLETO &&
                                        r.getLugar().getServiciosSoportados().stream()
                                                .anyMatch(ss -> ss.getTipoServicio().equals(tipoServicio))))
                .toList();

        List<Evento> eventosConLugarDentroCobertura = eventosConLugarSoportaServicio.stream()
                .filter(evento -> evento.getReservas() != null)
                .filter(evento -> evento.getReservas().stream()
                        .anyMatch(reserva -> reserva.getLugar() != null &&
                                reserva.getEstadoReserva() == EstadoReserva.COMPLETO &&
                                servicio.getAreaCobertura().contains(reserva.getLugar().getLocalidad())))
                .toList();

        // concatenamos los dos casos de eventos posibles
        List<Evento> eventosDisponibles = Stream
                .concat(eventosSinLugar.stream(), eventosConLugarDentroCobertura.stream())
                .distinct() // elimina duplicados
                .toList();
        return eventosDisponibles.stream()
                .map(e -> new DtoEventoDisponible(e.getId(), e.getNombre()))
                .toList();
    }

    public Long IniciarChat(DtoIniciarChat dtoReserva, String email) {
        Reserva reserva = new Reserva();
        Evento evento = repoEvento.findById(dtoReserva.getIdEvento())
                .orElseThrow(() -> new RuntimeException("Evento no encontrado"));
        Servicio servicio = repoServicio.findById(dtoReserva.getIdServicio())
                .orElseThrow(() -> new RuntimeException("Servicio no encontrado"));
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        Usuario prestador = servicio.getPrestador();

        // sets chat
        Chat chat = new Chat();
        chat.setFechaHoraInicio(LocalDateTime.now());
        chat.setReserva(reserva);
        chat.setOrganizador(usuario);
        chat.setPrestador(prestador);
        chat.setServicio(servicio);
        chat.setEvento(evento);

        // sets reserva
        LocalDate localDate = dtoReserva.getFechaReserva();
        Date fechaReserva = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
        reserva.setFechaReserva(fechaReserva);
        reserva.setFechaHoraAlta(LocalDateTime.now());
        reserva.setEstadoReserva(EstadoReserva.EN_CHAT);
        reserva.setOrganizador(usuario);
        reserva.setServicio(servicio);
        reserva.setPrestador(prestador);

        // sets eventos
        evento.getReservas().add(reserva);

        // save reserva
        repoReserva.save(reserva);

        // save chat
        repoChat.save(chat);

        return chat.getId();
    }

    @Transactional
    private List<DtoServicio> transformarDto(List<Servicio> servicios) {
        String proyectoPath = System.getProperty("user.dir");
        System.out.println("Ruta del proyecto: " + proyectoPath);

        return servicios.stream().map(servicio -> {

            String ruta;
            if (servicio.getImagenes() != null && !servicio.getImagenes().isEmpty()) {
                ruta = servicio.getImagenes().getFirst().getFilePath();
                System.out.println("Ruta desde BD: " + ruta);
            } else {
                ruta = proyectoPath + "/imagenes/default.jpg";
            }

            if (!ruta.startsWith(proyectoPath)) {
                ruta = proyectoPath + "/imagenes/" + ruta;
            }

            System.out.println("Ruta a buscar: " + ruta);

            String imagenBase64;
            try {
                imagenBase64 = imagenService.buscar(ruta);
                System.out.println("Imagen encontrada: " + (imagenBase64 != null));
            } catch (Exception e) {
                e.printStackTrace();
                imagenBase64 = null;
            }

            double estrellas = 0;
            if (servicio.getReseñas() != null && !servicio.getReseñas().isEmpty()) {
                double avg = servicio.getReseñas().stream()
                        .mapToDouble(Reseña::getEstrellas)
                        .average()
                        .orElse(0.0);
                estrellas = avg;
            }

            return new DtoServicio(servicio, imagenBase64, estrellas);
        }).toList();

    }

    public List<DtoServicio> getDtosServicio() {
        List<Servicio> servicios = repoServicio.findByfechaHoraBajaIsNull();
        return transformarDto(servicios);
    }

    public List<DtoServicio> getServiciosByUsuarioEmail(String email) {
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        List<Servicio> servicios = repoServicio.findByPrestador(usuario);
        return transformarDto(servicios);

    }

    @Transactional
    public DtoNuevoServicio crearNuevoServicio(DtoNuevoServicio dto, String email) throws Exception {
        System.out.println("DTO recibido: " + dto);

        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        TipoServicio tipoServicio = repoTipoServicio.findByIdAndFechaHoraBajaIsNull(dto.getTipoServicioId())
                .orElseThrow(() -> new EntityNotFoundException("Tipo de servicio no encontrado"));

        EstadoServicio estadoActivo = repoEstadoServicio.findByNombreAndFechaHoraBajaIsNull("Activo")
                .orElseThrow(() -> new EntityNotFoundException("Estado activo no encontrado"));

        Localidad localidad = repoLocalidad.findByIdAndFechaHoraBajaIsNull(dto.getAreaCoberturaIds().getFirst())
                .orElseThrow(() -> new EntityNotFoundException("Localidad no encontrada"));

        Optional<Servicio> servicioExistente = repository.findByNombreTipoServicioYLocalidad(
                dto.getNombre().trim(),
                tipoServicio,
                localidad);

        if (servicioExistente.isPresent()) {
            throw new IllegalStateException("Ya existe un servicio con el mismo nombre y tipo.");
        }

        Servicio servicio = new Servicio();
        servicio.setNombre(dto.getNombre());
        servicio.setDescripcion(dto.getDescripcion());
        servicio.setTipoServicio(tipoServicio);
        servicio.setEstadoServicio(estadoActivo);
        servicio.setPrestador(usuario);
        servicio.setFechaHoraAlta(LocalDateTime.now());
        servicio.setFechaHoraBaja(null);

        List<Localidad> localidades = new ArrayList<>();
        for (Long idLoc : dto.getAreaCoberturaIds()) {
            Localidad loc = repoLocalidad.findByIdAndFechaHoraBajaIsNull(idLoc)
                    .orElseThrow(() -> new EntityNotFoundException("Localidad con id " + idLoc + " no encontrada"));
            localidades.add(loc);
        }
        servicio.setAreaCobertura(localidades);

        // Guardar servicio inicial
        servicio = repoServicio.save(servicio);

        // Procesar imágenes
        if (dto.getImagenesBase64() != null && !dto.getImagenesBase64().isEmpty()) {
            List<Imagen> imagenes = new ArrayList<>();
            for (String imgBase64 : dto.getImagenesBase64()) {
                String ruta = imagenService.guardar(imgBase64, usuario.getId().intValue());
                Imagen img = new Imagen();
                img.setFilePath(ruta);
                imagenes.add(imagenService.save(img));
            }
            servicio.setImagenes(imagenes);
        } else {
            System.out.println("No se encontraron imágenes.");
        }

        servicio = repoServicio.save(servicio);

        System.out.println("Servicio creado exitosamente: " + servicio.getId());

        return mapServicioADto(servicio);
    }

    @Transactional
    public DtoNuevoServicio editarServicio(DtoNuevoServicio dto, String email) throws Exception {
        System.out.println("Editando servicio con ID: " + dto.getId());

        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado"));

        Servicio servicio = repoServicio.findByIdAndFechaHoraBajaIsNull(dto.getId())
                .orElseThrow(() -> new EntityNotFoundException("Servicio no encontrado con id: " + dto.getId()));

        if (!servicio.getPrestador().getId().equals(usuario.getId())) {
            throw new SecurityException("No tienes permiso para editar este servicio.");
        }

        // Verificar reservas futuras
        List<EstadoReserva> estadosValidos = List.of(EstadoReserva.COMPLETO);

        List<Reserva> reservas = repoReserva.findReservasActivasPorServicio(
                servicio,
                java.sql.Date.valueOf(LocalDate.now()),
                estadosValidos);

        if (!reservas.isEmpty()) {
            throw new IllegalStateException("No se puede editar el servicio porque tiene reservas activas o futuras.");
        }

        // Actualizar campos editables
        servicio.setDescripcion(dto.getDescripcion());

        List<Localidad> nuevasLocalidades = new ArrayList<>();
        for (Long idLoc : dto.getAreaCoberturaIds()) {
            Localidad loc = repoLocalidad.findByIdAndFechaHoraBajaIsNull(idLoc)
                    .orElseThrow(() -> new EntityNotFoundException("Localidad con id " + idLoc + " no encontrada"));
            nuevasLocalidades.add(loc);
        }
        servicio.setAreaCobertura(nuevasLocalidades);

        // Actualizar imágenes
        if (dto.getImagenesBase64() != null && !dto.getImagenesBase64().isEmpty()) {
            if (servicio.getImagenes() != null)
                servicio.getImagenes().clear();
            List<Imagen> nuevasImagenes = new ArrayList<>();
            for (String base64 : dto.getImagenesBase64()) {
                String ruta = imagenService.guardar(base64, usuario.getId().intValue());
                Imagen img = new Imagen();
                img.setFilePath(ruta);
                nuevasImagenes.add(imagenService.save(img));
            }
            servicio.setImagenes(nuevasImagenes);
        }

        servicio = repoServicio.save(servicio);

        System.out.println("Servicio actualizado correctamente: " + servicio.getId());

        return mapServicioADto(servicio);
    }

    @Transactional
    public DtoNuevoServicio darBajaServicio(Long servicioId, String email) throws Exception {
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado"));

        Servicio servicio = repoServicio.findById(servicioId)
                .orElseThrow(() -> new EntityNotFoundException("Servicio no encontrado"));

        if (!servicio.getPrestador().getId().equals(usuario.getId())) {
            throw new SecurityException("No está autorizado a dar de baja este servicio.");
        }

        if (servicio.getFechaHoraBaja() == null) {
            // Verificar reservas futuras
            List<EstadoReserva> estadosValidos = List.of(EstadoReserva.COMPLETO);

            List<Reserva> reservas = repoReserva.findReservasActivasPorServicio(
                    servicio,
                    java.sql.Date.valueOf(LocalDate.now()),
                    estadosValidos);

            if (!reservas.isEmpty()) {
                throw new IllegalStateException(
                        "No se puede dar de baja el servicio porque tiene reservas activas o futuras.");
            }
            servicio.setFechaHoraBaja(LocalDateTime.now());
            System.out.println("Servicio dado de baja correctamente.");
        } else {
            // Reactivar
            servicio.setFechaHoraBaja(null);
            System.out.println("Servicio reactivado correctamente.");
        }

        servicio = repoServicio.save(servicio);

        return mapServicioADto(servicio);
    }

    // Mapper
    private DtoNuevoServicio mapServicioADto(Servicio s) {
        DtoNuevoServicio dto = new DtoNuevoServicio();
        dto.setId(s.getId());
        dto.setNombre(s.getNombre());
        dto.setDescripcion(s.getDescripcion());
        dto.setTipoServicioId(s.getTipoServicio().getId());
        dto.setAreaCoberturaIds(s.getAreaCobertura().stream().map(Localidad::getId).toList());
        if (s.getImagenes() != null) {
            dto.setImagenesBase64(
                    s.getImagenes().stream()
                            .map(Imagen::getFilePath)
                            .toList());
        }
        return dto;
    }


    public List<String> getNombresServiciosByUsuarioEmail(String email){
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        List<Servicio> servicios = repoServicio.findByPrestador(usuario);

        return servicios.stream()
                .map(Servicio::getNombre)
                .toList();
    }

}
