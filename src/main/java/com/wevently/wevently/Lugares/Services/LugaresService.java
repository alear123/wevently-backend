/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Lugares.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Eventos.Entities.*;
import com.wevently.wevently.Eventos.Repository.TipoEventoRepository;
import com.wevently.wevently.Imagenes.Entities.Imagen;
import com.wevently.wevently.Imagenes.Services.ImagenService;
import com.wevently.wevently.Lugares.DTO.*;
import com.wevently.wevently.Lugares.Entities.*;
import com.wevently.wevently.Lugares.Repository.CaracteristicaRepository;
import com.wevently.wevently.Lugares.Repository.LocalidadRepository;
import com.wevently.wevently.Lugares.Repository.TipoLugarRepository;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.Services.VistasPorLugarService;
import com.wevently.wevently.Servicios.DTO.DtoNuevoServicio;
import com.wevently.wevently.Servicios.Entities.EstadoServicio;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.Servicios.Entities.ServicioSoportado;
import com.wevently.wevently.Servicios.Repository.TipoServicioRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import com.wevently.wevently.Eventos.Repository.EstadoEventoRepository;
import com.wevently.wevently.Eventos.Repository.EventoRepository;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Lugares.Repository.LugarRepository;
import com.wevently.wevently.Lugares.Repository.ProvinciaRepository;
import com.wevently.wevently.Servicios.Entities.TipoServicio;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;

import jakarta.persistence.EntityNotFoundException;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;
import java.util.stream.Stream;

import jakarta.transaction.Transactional;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LugaresService extends BaseService<Lugar, Long, LugarRepository> {
    @Autowired
    private ReservaRepository repoReserva;

    @Autowired
    private UsuarioRepository repoUsuario;

    @Autowired
    private LugarRepository lugarRepository;

    @Autowired
    private ImagenService imagenService;

    @Autowired
    private EventoRepository repoEvento;

    @Autowired
    private LocalidadRepository repoLocalidad;

    @Autowired
    private TipoLugarRepository repoTipoLugar;

    @Autowired
    private TipoEventoRepository repoTipoEvento;

    @Autowired
    private TipoServicioRepository repoTipoServicio;

    @Autowired
    private CaracteristicaRepository repoCaracteristica;

    @Autowired
    private VistasPorLugarService vistasPorLugarService;

    @Autowired
    private EstadoEventoRepository repoEstadoEvento;

    @Autowired
    ProvinciaRepository repoProvincia;

    public LugaresService(LugarRepository repository, ReservaRepository repoReserva, UsuarioRepository repoUsuario) {
        super(repository);
        this.repoReserva = repoReserva;
        this.repoUsuario = repoUsuario;
    }

    public DtoVerDetalleLugar verDetalleLugar(Long idLugar) {
        Lugar lugar = repository.findById(idLugar)
                .orElseThrow(() -> new EntityNotFoundException("Lugar no encontrado con id: "
                        + idLugar));

        DtoVerDetalleLugar dtoDetalle = new DtoVerDetalleLugar();
        vistasPorLugarService.registrarVistaLugarUsuario(lugar);

        dtoDetalle.setLocalidad(lugar.getLocalidad().getNombre());
        Provincia provincia = repoProvincia.findByLocalidad(lugar.getLocalidad().getId());
        dtoDetalle.setProvincia(provincia.getNombre());
        String proyectoPath = System.getProperty("user.dir");
        System.out.println("Ruta del proyecto: " + proyectoPath);

        List<String> rutasImagenes = lugar.getImagenes().stream().map(i -> i.getFilePath()).toList();

        List<String> imagenesConURL = rutasImagenes.stream()
                .map(ruta -> {
                    if (!ruta.startsWith(proyectoPath)) {
                        ruta = proyectoPath + "/imagenes/" + ruta;
                    }
                    System.out.println("Ruta de la imagen: " + ruta);
                    return imagenService.buscar(ruta);
                })
                .toList();
        dtoDetalle.setImagenes(imagenesConURL);
        dtoDetalle.setId(lugar.getId());
        dtoDetalle.setNombre(lugar.getNombre());
        dtoDetalle.setDireccion(lugar.getDireccion());
        dtoDetalle.setTipoLugar(lugar.getTipoLugar().getNombre().toString());
        lugar.getLugarPrecios().forEach(precio -> {
            if (precio.getFechaHasta() == null) {
                dtoDetalle.setPrecioLugar(precio.getPrecio().toString());
            }
        });
        if (lugar.getReseñas() != null) {
            dtoDetalle.setCountReviews(lugar.getReseñas().size());
        } else {
            dtoDetalle.setCountReviews(0);
        }
        dtoDetalle.setRating(lugar.getReseñas().stream().mapToDouble(r -> r.getEstrellas()).average().orElse(0.0));
        dtoDetalle.setDescripcion(lugar.getDescripcion());
        dtoDetalle.setPropietario(lugar.getPropietario().getNombre() + " " + lugar.getPropietario().getApellido());
        dtoDetalle.setCapacidad(lugar.getCapacidadPersonas().toString());
        List<String> tiposDeEventosSoportados = lugar.getEventosSoportados().stream()
                .map(EventoSoportado::getTipoEvento)
                .map(tipoEvento -> tipoEvento.getNombre())
                .toList();
        dtoDetalle.setTiposEventosSoportados(tiposDeEventosSoportados);
        List<String> tiposDeServiciosSoportados = lugar.getServiciosSoportados().stream()
                .map(servicioSoportado -> servicioSoportado.getTipoServicio().getNombre())
                .toList();
        dtoDetalle.setTiposServiciosSoportados(tiposDeServiciosSoportados);
        List<String> caracteristicas = lugar.getCaracteristicas().stream()
                .map(caracteristica -> caracteristica.getNombre())
                .toList();
        dtoDetalle.setCaracteristicas(caracteristicas);
        List<Reserva> reservas = repoReserva.findByServicioIsNull();
        List<Date> fechasReservadas = reservas.stream()
                .filter(reserva -> reserva.getLugar().getId().equals(idLugar))
                .filter(reserva -> reserva.getEstadoReserva().equals(EstadoReserva.COMPLETO))
                .map(Reserva::getFechaReserva)
                .toList();
        dtoDetalle.setReservas(fechasReservadas);
        dtoDetalle.setServiciosAdicionales(lugar.getCaracteristicas().stream()
                .map(caracteristica -> caracteristica.getNombre())
                .toList());
        List<DtoReseña> reseñas = lugar.getReseñas().stream()
                .map(reseña -> {
                    DtoReseña dtoReseña = new DtoReseña();
                    dtoReseña.setComentario(reseña.getDescripcion());
                    dtoReseña.setRating(reseña.getEstrellas());
                    dtoReseña.setUsuario(reseña.getUsuario().getNombre() + " " + reseña.getUsuario().getApellido());
                    dtoReseña.setId(reseña.getId());
                    return dtoReseña;
                })
                .limit(5) //  solo toma las primeras 5 reseñas
                .toList();

        dtoDetalle.setReseñas(reseñas);
        return dtoDetalle;
    }

    public List<DtoEventoDisponible> getEventoDisponibles(Long idLugar, Date fechaReserva, String email) {
        // buscamos el usuario por email
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        // convertimos la fecha a localDate
        LocalDate localFecha = fechaReserva.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        // buscamos el lugar por id
        Lugar lugar = repository.findById(idLugar)
                .orElseThrow(() -> new RuntimeException("Lugar no encontrado"));

        // buscamos el estado pendiente de evento
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

        // buscamos los tipos de eventos soportados por el lugar
        List<TipoEvento> tiposDeEventosSoportados = lugar.getEventosSoportados().stream()
                .map(EventoSoportado::getTipoEvento)
                .toList();

        // nos quedamos con los eventos que coincidan con el tipo de evento soportado
        // por el lugar
        List<Evento> eventosSoportados = eventosSinLugar.stream()
                .filter(e -> tiposDeEventosSoportados.contains(e.getTipoEvento()))
                .toList();

        // nos quedamos con los evento que no tiene servicios contratados
        List<Evento> eventosSinServicios = eventosSoportados.stream()
                .filter(e -> e.getReservas() == null || e.getReservas().isEmpty() ||
                        e.getReservas().stream()
                                .noneMatch(
                                        r -> r.getServicio() != null && r.getEstadoReserva() == EstadoReserva.COMPLETO))
                .toList();

        // buscamos los tipos de servicios soportados por el lugar
        List<TipoServicio> tiposDeServiciosSoportados = lugar.getServiciosSoportados().stream()
                .map(ServicioSoportado::getTipoServicio)
                .toList();

        // nos quedamos con los eventos que tienen servicios soportado por el lugar
        List<Evento> eventosConServiciosSoportados = eventosSoportados.stream()
                .filter(e -> e.getReservas().stream()
                        .anyMatch(r -> r.getServicio() != null &&
                                r.getServicio().getTipoServicio() != null &&
                                tiposDeServiciosSoportados.contains(r.getServicio().getTipoServicio()) &&
                                r.getEstadoReserva() == EstadoReserva.COMPLETO))
                .toList();

        // concatenamos los dos casos de eventos posibles
        List<Evento> eventosDisponibles = Stream
                .concat(eventosSinServicios.stream(), eventosConServiciosSoportados.stream())
                .filter(e -> e.getEstadoEvento().getNombre().equals("Pendiente"))
                .distinct() // elimina duplicados
                .toList();

        return eventosDisponibles.stream()
                .map(e -> new DtoEventoDisponible(e.getId(), e.getNombre()))
                .toList();
    }

    public Long iniciarReserva(DtoIniciarReserva dtoIniciarReserva, String email) {
        Reserva reserva = new Reserva();
        Evento evento = repoEvento.findById(dtoIniciarReserva.getIdEvento())
                .orElseThrow(() -> new RuntimeException("Evento no encontrado"));
        Lugar lugar = repository.findById(dtoIniciarReserva.getIdLugar())
                .orElseThrow(() -> new RuntimeException("Lugar no encontrado"));
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        Usuario propietario = lugar.getPropietario();

        LocalDate fechaLocal = dtoIniciarReserva.getFechaReserva();

        Date fechaDate = Date.from(
                fechaLocal.atStartOfDay(ZoneId.systemDefault()).toInstant());
        if (!evento.getFecha().equals(dtoIniciarReserva.getFechaReserva())) {
            System.out.println("Evento fecha: " + evento.getFecha());
            System.out.println("DTO fechaReserva (Date): " + dtoIniciarReserva.getFechaReserva());
            System.out.println("Convertido a LocalDate: " + fechaDate);
            throw new RuntimeException("Fecha del evento no coincide con la fecha elegida");
        }

        // sets reserva
        reserva.setFechaHoraAlta(LocalDateTime.now());
        reserva.setFechaReserva(fechaDate);
        reserva.setEstadoReserva(EstadoReserva.PARCIAL);
        reserva.setLugar(lugar);
        reserva.setPrestador(propietario);
        reserva.setOrganizador(usuario);

        evento.getReservas().add(reserva);

        repoReserva.save(reserva);

        return reserva.getId();
    }

    private List<DtoLugar> transformarDto(List<Lugar> lugares) {

        String proyectoPath = System.getProperty("user.dir");
        System.out.println("Ruta del proyecto: " + proyectoPath);

        return lugares.stream().map(lugar -> {

            // === Inicializar relaciones LAZY ===
            Hibernate.initialize(lugar.getServiciosSoportados());
            Hibernate.initialize(lugar.getEventosSoportados());
            Hibernate.initialize(lugar.getCaracteristicas());

            System.out.println("Lugar: " + lugar.getNombre());
            System.out.println("→ Servicios soportados: " +
                    (lugar.getServiciosSoportados() == null ? "null" : lugar.getServiciosSoportados().size()));
            System.out.println("→ Eventos soportados: " +
                    (lugar.getEventosSoportados() == null ? "null" : lugar.getEventosSoportados().size()));
            System.out.println("→ Características: " +
                    (lugar.getCaracteristicas() == null ? "null" : lugar.getCaracteristicas().size()));

            // === Imagen ===
            String ruta;
            if (lugar.getImagenes() != null && !lugar.getImagenes().isEmpty()) {
                ruta = lugar.getImagenes().getFirst().getFilePath();
                System.out.println("Ruta desde BD: " + ruta);
            } else {
                ruta = proyectoPath + "/imagenes/default.jpg";
            }

            if (!ruta.startsWith(proyectoPath)) {
                ruta = proyectoPath + "/imagenes/" + ruta;
            }

            String imagenBase64;
            try {
                imagenBase64 = imagenService.buscar(ruta);
                System.out.println("Imagen encontrada: " + (imagenBase64 != null));
            } catch (Exception e) {
                e.printStackTrace();
                imagenBase64 = null;
            }

            // === Precio ===
            float precio = 0;
            if (lugar.getLugarPrecios() != null && !lugar.getLugarPrecios().isEmpty()) {

                List<LugarPrecio> listaPrecios = lugar.getLugarPrecios();
                for (LugarPrecio precioLugar : listaPrecios) {
                    if (precioLugar.getFechaHasta() != null) {

                    } else {
                        precio = precioLugar.getPrecio();
                    }

                }
            }

            // === Rating ===
            double estrellas = 0;
            if (lugar.getReseñas() != null && !lugar.getReseñas().isEmpty()) {
                estrellas = lugar.getReseñas().stream()
                        .mapToDouble(Reseña::getEstrellas)
                        .average()
                        .orElse(0.0);
            }

            // === Listas adicionales ===
            List<TipoServicio> tiposServicios = new ArrayList<>();
            if (lugar.getServiciosSoportados() != null && !lugar.getServiciosSoportados().isEmpty()) {
                tiposServicios = lugar.getServiciosSoportados().stream()
                        .map(ServicioSoportado::getTipoServicio)
                        .toList();
            }

            List<TipoEvento> tiposEventos = new ArrayList<>();
            if (lugar.getEventosSoportados() != null && !lugar.getEventosSoportados().isEmpty()) {
                tiposEventos = lugar.getEventosSoportados().stream()
                        .map(EventoSoportado::getTipoEvento)
                        .toList();
            }

            List<Caracteristica> caracteristicas = new ArrayList<>();
            if (lugar.getCaracteristicas() != null && !lugar.getCaracteristicas().isEmpty()) {
                caracteristicas = lugar.getCaracteristicas();
            }

            // === Construcción final del DTO ===
            DtoLugar dto = new DtoLugar(lugar, imagenBase64, precio, estrellas);
            dto.setServicioSoportados(tiposServicios);
            dto.setEventoSoportados(tiposEventos);
            dto.setCaracteristicas(caracteristicas);

            return dto;

        }).toList();
    }

    @Transactional
    public List<DtoLugar> getAllDtosLugar() {
        List<Lugar> lugares = lugarRepository.findByfechaHoraBajaIsNull();
        return transformarDto(lugares);
    }

    @Transactional
    public List<DtoLugar> getLugaresByUsuarioEmail(String email) {
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        List<Lugar> lugares = lugarRepository.findByPropietario(usuario);
        return transformarDto(lugares);

    }

    @Transactional
    public DtoNuevoLugar crearNuevoLugar(DtoNuevoLugar dto, String email) throws Exception {
        System.out.println("DTO recibido: " + dto);

        // Buscar usuario que crea el lugar
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        // Buscar tipo de lugar
        TipoLugar tipoLugar = repoTipoLugar.findByIdAndFechaHoraBajaIsNull(dto.getTipoLugarId())
                .orElseThrow(() -> new EntityNotFoundException("Tipo de lugar no encontrado"));

        // Buscar localidad
        Localidad localidad = repoLocalidad.findByIdAndFechaHoraBajaIsNull(dto.getLocalidadId())
                .orElseThrow(
                        () -> new EntityNotFoundException("Localidad no encontrada con id: " + dto.getLocalidadId()));

        // Verificar si ya existe un lugar con el mismo nombre, tipo y localidad
        Optional<Lugar> lugarExistente = repository.findByNombreAndTipoLugarAndLocalidadAndFechaHoraBajaIsNull(
                dto.getNombre().trim(),
                tipoLugar,
                localidad);

        if (lugarExistente.isPresent()) {
            throw new IllegalStateException("Ya existe un lugar con el mismo nombre, tipo y localidad.");
        }

        // Crear instancia del Lugar
        Lugar lugar = new Lugar();
        lugar.setFechaHoraAlta(LocalDateTime.now());
        lugar.setFechaHoraBaja(null);
        lugar.setNombre(dto.getNombre());
        lugar.setDireccion(dto.getDireccion());
        lugar.setDescripcion(dto.getDescripcion());
        lugar.setCapacidadPersonas(dto.getCapacidad());
        lugar.setPropietario(usuario);

        // Agregar instancia de LugarPrecio al lugar creado
        LugarPrecio lugarPrecio = new LugarPrecio(LocalDateTime.now(), null, dto.getPrecioLugar());
        lugar.getLugarPrecios().add(lugarPrecio);

        lugar.setTipoLugar(tipoLugar);
        lugar.setLocalidad(localidad);

        // Guardar el lugar inicial (para generar ID)
        lugar = repository.save(lugar);

        // Procesar imágenes
        if (dto.getImagenesBase64() != null && !dto.getImagenesBase64().isEmpty()) {
            List<Imagen> imagenes = new ArrayList<>();

            for (String imgBase64 : dto.getImagenesBase64()) {
                String rutaGuardada = imagenService.guardar(imgBase64, usuario.getId().intValue());

                Imagen imagen = new Imagen();
                imagen.setFilePath(rutaGuardada);
                imagenes.add(imagenService.save(imagen));
            }

            lugar.setImagenes(imagenes);
        } else {
            System.out.println("No se encontraron imágenes para el lugar");
        }

        // Asociar tipos de servicios soportados
        if (dto.getServiciosSoportadosIds() != null) {
            List<ServicioSoportado> serviciosSoportados = new ArrayList<>();
            for (Long idTipoServicio : dto.getServiciosSoportadosIds()) {
                TipoServicio tipoServicio = repoTipoServicio.findByIdAndFechaHoraBajaIsNull(idTipoServicio)
                        .orElseThrow(() -> new EntityNotFoundException(
                                "Tipo de servicio con id " + idTipoServicio + " no encontrado"));
                ServicioSoportado servicioSoportado = new ServicioSoportado(LocalDateTime.now(), null, tipoServicio);
                serviciosSoportados.add(servicioSoportado);
            }
            lugar.setServiciosSoportados(serviciosSoportados);
        }

        // Asociar tipos de eventos soportados
        if (dto.getEventosSoportadosIds() != null) {
            List<EventoSoportado> eventosSoportados = new ArrayList<>();
            for (Long idTipoEvento : dto.getEventosSoportadosIds()) {
                TipoEvento tipoEvento = repoTipoEvento.findByIdAndFechaHoraBajaIsNull(idTipoEvento)
                        .orElseThrow(() -> new EntityNotFoundException(
                                "Tipo de evento con id " + idTipoEvento + " no encontrado"));
                EventoSoportado eventoSoportado = new EventoSoportado(LocalDateTime.now(), null, tipoEvento);
                eventosSoportados.add(eventoSoportado);
            }
            lugar.setEventosSoportados(eventosSoportados);
        }

        // Asociar características
        if (dto.getCaracteristicasId() != null) {
            List<Caracteristica> caracteristicas = new ArrayList<>();
            for (Long idCarac : dto.getCaracteristicasId()) {
                Caracteristica caracteristica = repoCaracteristica.findByIdAndFechaHoraBajaIsNull(idCarac)
                        .orElseThrow(() -> new EntityNotFoundException(
                                "Característica con id " + idCarac + " no encontrada"));
                caracteristicas.add(caracteristica);
            }
            lugar.setCaracteristicas(caracteristicas);
        }

        // Guardar lugar final con todas las relaciones
        lugar = repository.save(lugar);

        System.out.println("Lugar creado exitosamente: " + lugar.getId());

        // Convertir la entidad guardada a DTO
        DtoNuevoLugar dtoRespuesta = new DtoNuevoLugar();
        dtoRespuesta.setId(lugar.getId());
        dtoRespuesta.setNombre(lugar.getNombre());
        dtoRespuesta.setDireccion(lugar.getDireccion());
        dtoRespuesta.setDescripcion(lugar.getDescripcion());
        dtoRespuesta.setCapacidad(lugar.getCapacidadPersonas());
        dtoRespuesta.setTipoLugarId(lugar.getTipoLugar().getId());
        dtoRespuesta.setLocalidadId(lugar.getLocalidad().getId());
        dtoRespuesta.setPrecioLugar(
                lugar.getLugarPrecios().isEmpty() ? 0f
                        : lugar.getLugarPrecios().get(lugar.getLugarPrecios().size() - 1).getPrecio().floatValue());
        if (lugar.getImagenes() != null) {
            dtoRespuesta.setImagenesBase64(
                    lugar.getImagenes().stream()
                            .map(Imagen::getFilePath)
                            .toList());
        }

        return dtoRespuesta;
    }

    @Transactional
    public DtoNuevoLugar editarLugar(DtoNuevoLugar dto, String email) throws Exception {
        System.out.println("Editando lugar con ID: " + dto.getId());

        // Buscar usuario que intenta editar
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        // Buscar el lugar
        Lugar lugar = repository.findByIdAndFechaHoraBajaIsNull(dto.getId())
                .orElseThrow(() -> new EntityNotFoundException("Lugar no encontrado con id: " + dto.getId()));

        // Verificar propietario
        if (!lugar.getPropietario().getId().equals(usuario.getId())) {
            throw new SecurityException("No tienes permiso para editar este lugar (no eres el propietario).");
        }

        // Verificar campos no editables
        if (dto.getNombre() != null && !dto.getNombre().equals(lugar.getNombre())) {
            throw new IllegalArgumentException("No se puede modificar el nombre del lugar.");
        }
        if (dto.getTipoLugarId() != null && !dto.getTipoLugarId().equals(lugar.getTipoLugar().getId())) {
            throw new IllegalArgumentException("No se puede modificar el tipo de lugar.");
        }
        if (dto.getLocalidadId() != null && !dto.getLocalidadId().equals(lugar.getLocalidad().getId())) {
            throw new IllegalArgumentException("No se puede modificar la localidad del lugar.");
        }
        if (dto.getDireccion() != null && !dto.getDireccion().equals(lugar.getDireccion())) {
            throw new IllegalArgumentException("No se puede modificar la dirección del lugar.");
        }

        List<EstadoReserva> estadosValidos = List.of(EstadoReserva.COMPLETO);

        List<Reserva> reservas = repoReserva.findReservasActivasPorLugar(
                lugar,
                java.sql.Date.valueOf(LocalDate.now()),
                estadosValidos);

        if (!reservas.isEmpty()) {
            throw new IllegalStateException("No se puede editar el lugar porque tiene reservas activas o futuras.");
        }

        // Actualizar campos editables
        lugar.setDescripcion(dto.getDescripcion());
        lugar.setCapacidadPersonas(dto.getCapacidad());

        // --- GESTIÓN DE PRECIO ---
        if (dto.getPrecioLugar() != null) {
            List<LugarPrecio> precios = lugar.getLugarPrecios();
            if (!precios.isEmpty()) {
                // Marcar el precio anterior como dado de baja
                LugarPrecio ultimoPrecio = precios.getLast();
                ultimoPrecio.setFechaHasta(LocalDateTime.now());
            }
            // Crear nuevo registro de precio
            LugarPrecio nuevoPrecio = new LugarPrecio(LocalDateTime.now(), null, dto.getPrecioLugar());
            precios.add(nuevoPrecio);
        }

        // --- REEMPLAZAR IMÁGENES ---
        if (dto.getImagenesBase64() != null && !dto.getImagenesBase64().isEmpty()) {
            /*
             * Todavía no se aplica
             * // Función para eliminar imágenes anteriores (en BD y archivos)
             * if (lugar.getImagenes() != null) {
             * for (Imagen img : lugar.getImagenes()) {
             * imagenService.eliminar(img); // asegúrate de que elimine del disco y BD
             * }
             * }
             */
            List<Imagen> nuevasImagenes = new ArrayList<>();
            for (String imgBase64 : dto.getImagenesBase64()) {
                String rutaGuardada = imagenService.guardar(imgBase64, usuario.getId().intValue());
                Imagen imagen = new Imagen();
                imagen.setFilePath(rutaGuardada);
                nuevasImagenes.add(imagenService.save(imagen));
            }
            lugar.setImagenes(nuevasImagenes);
        }

        // --- ACTUALIZAR SERVICIOS SOPORTADOS ---
        if (dto.getServiciosSoportadosIds() != null) {
            List<ServicioSoportado> nuevosServicios = new ArrayList<>();
            for (Long idTipoServicio : dto.getServiciosSoportadosIds()) {
                TipoServicio tipoServicio = repoTipoServicio.findByIdAndFechaHoraBajaIsNull(idTipoServicio)
                        .orElseThrow(() -> new EntityNotFoundException(
                                "Tipo de servicio con id " + idTipoServicio + " no encontrado"));
                nuevosServicios.add(new ServicioSoportado(LocalDateTime.now(), null, tipoServicio));
            }
            lugar.setServiciosSoportados(nuevosServicios);
        }

        // --- ACTUALIZAR EVENTOS SOPORTADOS ---
        if (dto.getEventosSoportadosIds() != null) {
            List<EventoSoportado> nuevosEventos = new ArrayList<>();
            for (Long idTipoEvento : dto.getEventosSoportadosIds()) {
                TipoEvento tipoEvento = repoTipoEvento.findByIdAndFechaHoraBajaIsNull(idTipoEvento)
                        .orElseThrow(() -> new EntityNotFoundException(
                                "Tipo de evento con id " + idTipoEvento + " no encontrado"));
                nuevosEventos.add(new EventoSoportado(LocalDateTime.now(), null, tipoEvento));
            }
            lugar.setEventosSoportados(nuevosEventos);
        }

        // --- ACTUALIZAR CARACTERÍSTICAS ---
        if (dto.getCaracteristicasId() != null) {
            List<Caracteristica> nuevasCaract = new ArrayList<>();
            for (Long idCarac : dto.getCaracteristicasId()) {
                Caracteristica c = repoCaracteristica.findByIdAndFechaHoraBajaIsNull(idCarac)
                        .orElseThrow(() -> new EntityNotFoundException(
                                "Característica con id " + idCarac + " no encontrada"));
                nuevasCaract.add(c);
            }
            lugar.setCaracteristicas(nuevasCaract);
        }

        // Guardar cambios
        Lugar lugarActualizado = repository.save(lugar);
        System.out.println("Lugar actualizado correctamente: " + lugarActualizado.getId());

        // Convertir la entidad actualizada a DTO
        DtoNuevoLugar dtoRespuesta = new DtoNuevoLugar();
        dtoRespuesta.setId(lugarActualizado.getId());
        dtoRespuesta.setNombre(lugarActualizado.getNombre());
        dtoRespuesta.setDireccion(lugarActualizado.getDireccion());
        dtoRespuesta.setDescripcion(lugarActualizado.getDescripcion());
        dtoRespuesta.setCapacidad(lugarActualizado.getCapacidadPersonas());
        dtoRespuesta.setTipoLugarId(lugarActualizado.getTipoLugar().getId());
        dtoRespuesta.setLocalidadId(lugarActualizado.getLocalidad().getId());
        dtoRespuesta.setPrecioLugar(
                lugarActualizado.getLugarPrecios().isEmpty() ? 0f
                        : lugarActualizado.getLugarPrecios().get(lugarActualizado.getLugarPrecios().size() - 1)
                                .getPrecio().floatValue());
        if (lugarActualizado.getImagenes() != null) {
            dtoRespuesta.setImagenesBase64(
                    lugarActualizado.getImagenes().stream()
                            .map(Imagen::getFilePath)
                            .toList());
        }

        return dtoRespuesta;
    }

    @Transactional
    public DtoNuevoLugar darBajaLugar(Long lugarId, String email) {
        // Buscar el usuario
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        // Buscar el lugar
        Lugar lugar = repository.findById(lugarId)
                .orElseThrow(() -> new EntityNotFoundException("Lugar no encontrado con id: " + lugarId));

        // Verificar propietario
        if (!lugar.getPropietario().getId().equals(usuario.getId())) {
            throw new SecurityException("No está autorizado a dar de baja este lugar (no es el propietario).");
        }

        // Si el lugar está activo → intentar dar de baja
        if (lugar.getFechaHoraBaja() == null) {
            // Verificar si hay reservas futuras
            List<EstadoReserva> estadosValidos = List.of(EstadoReserva.COMPLETO);

            List<Reserva> reservas = repoReserva.findReservasActivasPorLugar(
                    lugar,
                    java.sql.Date.valueOf(LocalDate.now()),
                    estadosValidos);

            if (!reservas.isEmpty()) {
                throw new IllegalStateException(
                        "No se puede dar de baja el lugar porque tiene reservas activas o futuras.");
            }

            lugar.setFechaHoraBaja(LocalDateTime.now());
            System.out.println("Lugar dado de baja correctamente. Fecha baja: " + lugar.getFechaHoraBaja());
        }
        // Si el lugar está dado de baja → reactivar
        else {
            lugar.setFechaHoraBaja(null);
            System.out.println("Lugar reactivado correctamente.");
        }

        Lugar actualizado = repository.save(lugar);

        DtoNuevoLugar dtoRespuesta = new DtoNuevoLugar();
        dtoRespuesta.setId(actualizado.getId());
        dtoRespuesta.setNombre(actualizado.getNombre());
        dtoRespuesta.setDireccion(actualizado.getDireccion());
        dtoRespuesta.setDescripcion(actualizado.getDescripcion());
        dtoRespuesta.setCapacidad(actualizado.getCapacidadPersonas());
        dtoRespuesta.setTipoLugarId(actualizado.getTipoLugar().getId());
        dtoRespuesta.setLocalidadId(actualizado.getLocalidad().getId());
        dtoRespuesta.setPrecioLugar(
                actualizado.getLugarPrecios().isEmpty() ? 0f
                        : actualizado.getLugarPrecios().get(actualizado.getLugarPrecios().size() - 1).getPrecio()
                                .floatValue());
        if (actualizado.getImagenes() != null) {
            dtoRespuesta.setImagenesBase64(
                    actualizado.getImagenes().stream().map(Imagen::getFilePath).toList());
        }

        return dtoRespuesta;
    }


    public List<String> getNombresLugaresByUsuarioEmail(String email){
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        List<Lugar> lugares = lugarRepository.findByPropietario(usuario);

        return lugares.stream()
                .map(Lugar::getNombre)
                .toList();
    }

}
