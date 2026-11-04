/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Eventos.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.DTO.*;
import com.wevently.wevently.Eventos.Entities.*;
import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import com.wevently.wevently.Eventos.Enum.TipoFactura;
import com.wevently.wevently.Eventos.Repository.EventoRepository;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Lugares.DTO.DtoLocalidad;
import com.wevently.wevently.Lugares.DTO.DtoLugar;
import com.wevently.wevently.Lugares.Entities.*;
import com.wevently.wevently.Lugares.Repository.LocalidadRepository;
import com.wevently.wevently.Lugares.Repository.LugarRepository;
import com.wevently.wevently.Lugares.Repository.ProvinciaRepository;
import com.wevently.wevently.Pagos.Entities.MedioDePago;
import com.wevently.wevently.Pagos.Services.AuditoriaTransaccionService;
import com.wevently.wevently.Pagos.Services.PagosService;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.Servicios.Entities.ServicioSoportado;
import com.wevently.wevently.Servicios.Entities.TipoServicio;
import com.wevently.wevently.Servicios.Repository.ChatRepository;
import com.wevently.wevently.Servicios.Repository.ServicioRepository;
import com.wevently.wevently.UsuariosySeguridad.DTO.NotificacionRequest;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Enum.TipoNotificacion;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;
import com.wevently.wevently.UsuariosySeguridad.Services.NotificacionService;
import com.wevently.wevently.Imagenes.Services.ImagenService;
import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.slf4j.Slf4j;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
@Transactional
public class ReservaService extends BaseService<Reserva, Long, ReservaRepository> {

    @Autowired
    private NotificacionService notificacionService;

    @Autowired
    private ReservaRepository repoReserva;

    @Autowired
    private PagosService pagosService;

    @Autowired
    private AuditoriaTransaccionService auditoriaService;

    @Autowired
    private ProvinciaRepository repoProvincia;

    @Autowired
    private LocalidadRepository repoLocalidad;

    @Autowired
    private UsuarioRepository repoUsuario;

    @Autowired
    private LugarRepository repoLugar;

    @Autowired
    private ImagenService imagenService;

    @Autowired
    private EventoRepository repoEvento;

    @Autowired
    private ServicioRepository repoServicio;

    @Autowired
    private ChatRepository chatRepository;

    public ReservaService(ReservaRepository repository) {
        super(repository);
    }

    @Transactional(rollbackFor = ErrorDeNegocio.class)
    public void terminarReserva(ConfirmarReservaDTO entity) throws ErrorDeNegocio {
        try {

            log.info("INICIO terminarReserva para idReserva={}", entity.getIdReserva());
            Reserva r = repository.findById(entity.getIdReserva())
                    .orElseThrow(
                            () -> new RuntimeException("no se encontro la reserva con id: " + entity.getIdReserva()));

            log.debug("Reserva encontrada: estado={}, idPago={}", r.getEstadoReserva(), r.getIdPago());

            if (r.getEstadoReserva() == EstadoReserva.COMPLETO) {
                throw new ErrorDeNegocio("la reserva con id" + entity.getIdReserva() + "ya esta completa");
            }

            r.setEstadoReserva(EstadoReserva.COMPLETO);
            log.info("Estado de reserva seteado a COMPLETO");
            r.setIdPago(entity.getIdPago());
            log.info("IdPago seteado: {}", entity.getIdPago());

            try {
                log.debug("Buscando medio de pago por código: {}", entity.getPaymentMethodId());
                MedioDePago medioPago = pagosService.buscarPorCodigo(entity.getPaymentMethodId());
                if (medioPago == null) {
                    throw new ErrorDeNegocio("no se encontro el metodo de pago: " + entity.getPaymentMethodId());
                }
                r.setMedioDePago(medioPago);
            } catch (Exception e) {
                throw new ErrorDeNegocio("error al obtener el método de pago " + e.getMessage());
            }

            log.info("ya setie el medio de pago: {}" + r.getMedioDePago().getNombre());

            log.info("Fecha de pago seteada: {}", entity.getDateApproved().toLocalDateTime());
            r.setFechaHoraPago(entity.getDateApproved().toLocalDateTime());

            // seteo los datos del de la reserva:
            r.setNombre(entity.getNombreComprador());
            r.setApellido(entity.getApellidoComprador());
            r.setEmail(entity.getMailComprador());
            r.setTelefono(entity.getTelefonoComprador());

            try {
                if (entity.getTipoFactura() == null || entity.getTipoFactura().isBlank()) {
                    throw new ErrorDeNegocio("El tipo de factura no puede ser nulo o vacío");
                }

                TipoFactura tipoFactura = TipoFactura.valueOf(entity.getTipoFactura().trim().toUpperCase());
                r.setTipoFactura(tipoFactura);

            } catch (IllegalArgumentException e) {
                throw new ErrorDeNegocio("Tipo de factura inválido: " + entity.getTipoFactura() +
                        ". Valores permitidos: A, B");
            }

            log.debug("Datos del comprador seteados: nombre={}, apellido={}, email={}, telefono={}",
                    entity.getNombreComprador(), entity.getApellidoComprador(), entity.getMailComprador(),
                    entity.getTelefonoComprador());
            // preguntar por los otros atributos cdo se setearian al ale/marcio
            // proponer sacar los not null xq sino va a dar error cdo le seties algo
            // preguntar tambien como determinariamos el tipo de factura a realizar
            //
            Reserva actualizada = repository.save(r);
            log.info("Reserva actualizada y guardada en base de datos, id={}", actualizada.getId());

            // envio la notificacion al prestador del evento
            try {
                // primero creo la notificaion del aviso de la reserva
                log.info("Creando notificación para prestador id={}", actualizada.getPrestador().getId());
                crearNotificacionReserva(actualizada);

                // registro el movimeinto en auditoria
                log.info("Registrando movimiento en auditoría para reserva id={}", actualizada.getId());
                auditoriaService.registrarProximaTransferencia(entity, actualizada);
            } catch (Exception e) {
                log.error("error al crear la notificacion {}", e.getMessage(), e);
            }
            log.info("FIN terminarReserva para idReserva={}", entity.getIdReserva());
        } catch (ErrorDeNegocio e) {
            log.error("ocurrio un error al termianr la reserva {}", e.getMessage(), e);
            throw e;
        } catch (Exception e) {
            log.error("Error inesperado al terminar reserva ID: {}", entity.getIdReserva(), e);
            throw new ErrorDeNegocio("Error interno al procesar reserva: " + e.getMessage());
        }
    }

    private void crearNotificacionReserva(Reserva reserva) {
        try {
            log.debug("INICIO crearNotificacionReserva para reserva id={}", reserva.getId());
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String fechaFormateada = formatter.format(reserva.getFechaReserva());

            log.debug("Datos para notificación: usuarioId={}, fechaFormateada={}", reserva.getPrestador().getId(),
                    fechaFormateada);
            String url= "";
            if(reserva.getLugar() != null){
             url ="/Inicio/mis-reservaciones";
            } else {
                url = "/Inicio/mis-prestaciones";
            }

            notificacionService.crearNotificacion(NotificacionRequest.builder()
                    .usuarioId(reserva.getPrestador().getId())
                    .tipoNotificacion(TipoNotificacion.Recordatorio)
                    .titulo("¡Tenes una nueva reserva!")
                    .resumen(String.format(
                            "Para el día " + fechaFormateada
                                    + ", el dinero de la seña te será transferido al cbu/alias registrado dentro de las 48 a 72 hs"))
                    .urlReferencia(url)
                    .build());
            log.info("Notificación creada para prestador ID: {}", reserva.getPrestador().getId());
        } catch (Exception e) {
            log.error("Error al crear notificación para reserva ID: {} - prestador ID: {}",
                    reserva.getId(), reserva.getPrestador().getId(), e);
            // la reserva se completa aunque falle la notificación
        }
    }

    public DtoFormularioReserva datosFormularioReserva(Long idReserva, Usuario user) {
        Reserva reserva = repository.findById(idReserva).get();
        if (!reserva.getOrganizador().getId().equals(user.getId())) {
            System.out.println("El organizador de la reserva no coincide con el usuario concurrente");
            System.out.println("id user actual: " + user.getId());
            System.out.println("id organizador: " + reserva.getOrganizador().getId());
            throw new RuntimeException("El organizador de la reserva no coincide con el usuario concurrente");
        }
        DtoFormularioReserva dtoFormularioReserva = new DtoFormularioReserva();
        if (reserva.getLugar() != null) {
            dtoFormularioReserva.setTipo("Lugar");
            dtoFormularioReserva.setNombre(reserva.getLugar().getNombre());
            dtoFormularioReserva.setCantReviews(reserva.getLugar().getReseñas().size());
            dtoFormularioReserva.setDescripcion(reserva.getLugar().getDireccion());
            DtoLocalidadReserva dtoLocalidadReserva = new DtoLocalidadReserva();
            dtoLocalidadReserva.setId(reserva.getLugar().getLocalidad().getId());
            dtoLocalidadReserva.setNombre(reserva.getLugar().getLocalidad().getNombre());
            DtoProvinciaReserva dtoProvinciaReserva = new DtoProvinciaReserva();
            Provincia provincia = repoProvincia.findByLocalidad(reserva.getLugar().getLocalidad().getId());
            dtoProvinciaReserva.setIdProvincia(provincia.getId());
            dtoProvinciaReserva.setNombre(provincia.getNombre());
            List<DtoLocalidadReserva> arrayDtoLocalidad = new ArrayList<DtoLocalidadReserva>();
            arrayDtoLocalidad.add(dtoLocalidadReserva);
            dtoProvinciaReserva.setLocalidades(arrayDtoLocalidad);
            dtoFormularioReserva.setProvincia(dtoProvinciaReserva);
            dtoFormularioReserva.setRating(
                    reserva.getLugar().getReseñas().stream().mapToDouble(r -> r.getEstrellas()).average().orElse(0.0));
        } else if (reserva.getServicio() != null) {
            dtoFormularioReserva.setTipo("Servicio");
            dtoFormularioReserva.setNombre(reserva.getServicio().getNombre());
            dtoFormularioReserva.setCantReviews(reserva.getServicio().getReseñas().size());
            dtoFormularioReserva.setDescripcion(reserva.getServicio().getDescripcion());
            List<DtoLocalidadReserva> dtoLocalidadesReserva = reserva.getServicio().getAreaCobertura().stream()
                    .map(localidad -> {
                        DtoLocalidadReserva dto = new DtoLocalidadReserva();
                        dto.setId(localidad.getId());
                        dto.setNombre(localidad.getNombre());
                        return dto;
                    })
                    .collect(Collectors.toList());
            DtoProvinciaReserva dtoProvinciaReserva = new DtoProvinciaReserva();
            Provincia provincia = repoProvincia
                    .findByLocalidad(reserva.getServicio().getAreaCobertura().getFirst().getId());
            dtoProvinciaReserva.setIdProvincia(provincia.getId());
            dtoProvinciaReserva.setNombre(provincia.getNombre());
            dtoProvinciaReserva.setLocalidades(dtoLocalidadesReserva);
            dtoFormularioReserva.setProvincia(dtoProvinciaReserva);
            dtoFormularioReserva.setRating(
                    reserva.getServicio().getReseñas().stream().mapToDouble(r -> r.getEstrellas()).average()
                            .orElse(0.0));
        }
        return dtoFormularioReserva;
    }

    public DtoReservaApagar reservaAPagar(DtoFormularioLlenoReserva dto, Usuario usuario) {
        Reserva reserva = repository.findById(dto.getIdReserva()).get();
        reserva.setApellido(dto.getApellidoComprador());
        reserva.setNombre(dto.getNombreComprador());
        reserva.setEmail(dto.getEmailComprador());
        reserva.setTelefono(dto.getTelefonoComprador());
        Localidad localidad = repoLocalidad.findByNombre(dto.getLocalidad());
        reserva.setLocalidad(localidad);
        reserva.setCuit(dto.getCuit());
        if (reserva.getLugar() != null) {
            Optional<LugarPrecio> lugarPrecioActivo = reserva.getLugar().getLugarPrecios().stream()
                    .filter(lp -> lp.getFechaHasta() == null)
                    .findFirst(); // devuelve Optional<LugarPrecio>

            if (lugarPrecioActivo.isPresent()) {
                LugarPrecio activo = lugarPrecioActivo.get();
                double precio = activo.getPrecio(); // o el atributo que necesites
                System.out.println("Precio activo del lugar: " + precio);
                reserva.setPrecioReserva(precio);
            } else {
                System.out.println("No se encontró un precio activo para este lugar.");
            }
        }
        DtoReservaApagar dtoReservaAPagar = new DtoReservaApagar();
        if (reserva.getLugar() != null) {
            dtoReservaAPagar.setNombre(reserva.getLugar().getNombre());
            dtoReservaAPagar.setCantidadResenia(reserva.getLugar().getReseñas().size());
            dtoReservaAPagar.setId(reserva.getLugar().getId());
            dtoReservaAPagar.setDescripcion(reserva.getLugar().getDescripcion());
            dtoReservaAPagar.setReseniaGeneral(
                    reserva.getLugar().getReseñas().stream().mapToDouble(r -> r.getEstrellas()).average().orElse(0.0));
        }
        if (reserva.getServicio() != null) {
            dtoReservaAPagar.setNombre(reserva.getServicio().getNombre());
            dtoReservaAPagar.setCantidadResenia(reserva.getServicio().getReseñas().size());
            dtoReservaAPagar.setId(reserva.getServicio().getId());
            dtoReservaAPagar.setDescripcion(reserva.getServicio().getDescripcion());
            dtoReservaAPagar.setReseniaGeneral(reserva.getServicio().getReseñas().stream()
                    .mapToDouble(r -> r.getEstrellas()).average().orElse(0.0));
            dtoReservaAPagar.setMonto(reserva.getPropuesta().getPresupuestoTotal());
            reserva.setPrecioReserva(reserva.getPropuesta().getPresupuestoTotal().doubleValue());
        }
        dtoReservaAPagar.setApellidoComprador(reserva.getApellido());
        dtoReservaAPagar.setNombreComprador(reserva.getNombre());
        dtoReservaAPagar.setCUIT(reserva.getCuit());
        dtoReservaAPagar.setIdReserva(reserva.getId());
        dtoReservaAPagar.setTelefonoComprador(reserva.getTelefono());
        dtoReservaAPagar.setEmailComprador(reserva.getEmail());
        dtoReservaAPagar.setFechaReserva(reserva.getFechaReserva());
        dtoReservaAPagar.setTipoFactura(dto.getTipoFactura());
        dtoReservaAPagar.setMonto(reserva.getPrecioReserva());
        return dtoReservaAPagar;
    }

    public List<DtoReservaLugar> getMisReservasLugares(String email) {
        // Buscar usuario prestador
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        // Buscar sus lugares (propietario)
        List<Lugar> lugares = repoLugar.findByPropietario(usuario);

        String proyectoPath = System.getProperty("user.dir");

        // Buscar reservas de todos sus lugares
        return lugares.stream()
                .flatMap(lugar -> {
                    List<Reserva> reservas = repoReserva.findByLugar(lugar);

                    return reservas.stream().map(reserva -> {
                        // === Imagen ===
                        String ruta;
                        if (lugar.getImagenes() != null && !lugar.getImagenes().isEmpty()) {
                            ruta = lugar.getImagenes().getFirst().getFilePath();
                        } else {
                            ruta = proyectoPath + "/imagenes/default.jpg";
                        }

                        if (!ruta.startsWith(proyectoPath)) {
                            ruta = proyectoPath + "/imagenes/" + ruta;
                        }

                        String imagenBase64;
                        try {
                            imagenBase64 = imagenService.buscar(ruta);
                        } catch (Exception e) {
                            imagenBase64 = null;
                        }

                        // === Obtener nombre del evento ===
                        Evento evento = repoEvento.findByReservasContains(reserva)
                                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

                        // === Construcción DTO ===
                        DtoReservaLugar dto = new DtoReservaLugar();
                        dto.setId(reserva.getId());
                        dto.setNombreEvento(evento != null ? evento.getNombre() : "Sin evento");
                        dto.setNombreLugar(lugar.getNombre());

                        assert evento != null;
                        dto.setNombreTipoEvento(evento.getTipoEvento().getNombre());

                        dto.setNombreTipoLugar(lugar.getTipoLugar().getNombre());
                        dto.setEstadoReserva(reserva.getEstadoReserva().name());
                        dto.setPrecioReserva(reserva.getPrecioReserva());
                        dto.setFechaReserva(reserva.getFechaReserva());
                        dto.setCapacidad(lugar.getCapacidadPersonas());
                        dto.setImagen(imagenBase64);

                        return dto;
                    });
                })
                .toList();
    }

    public List<DtoReservaServicio> getMisReservasServicios(String email) {
        // === Buscar usuario prestador ===
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        // === Buscar los servicios del usuario prestador ===
        List<Servicio> servicios = repoServicio.findByPrestador(usuario);

        String proyectoPath = System.getProperty("user.dir");

        // === Recorrer cada servicio y sus reservas ===
        return servicios.stream()
                .flatMap(servicio -> {
                    List<Reserva> reservas = repoReserva.findByServicio(servicio);

                    return reservas.stream().map(reserva -> {
                        // === Imagen ===
                        String ruta;
                        if (servicio.getImagenes() != null && !servicio.getImagenes().isEmpty()) {
                            ruta = servicio.getImagenes().getFirst().getFilePath();
                        } else {
                            ruta = proyectoPath + "/imagenes/default.jpg";
                        }

                        if (!ruta.startsWith(proyectoPath)) {
                            ruta = proyectoPath + "/imagenes/" + ruta;
                        }

                        String imagenBase64;
                        try {
                            imagenBase64 = imagenService.buscar(ruta);
                        } catch (Exception e) {
                            imagenBase64 = null;
                        }

                        // === Obtener nombre del evento ===
                        Evento evento = repoEvento.findByReservasContains(reserva)
                                .orElseThrow(() -> new RuntimeException("Evento no encontrado"));

                        // === Construir DTO ===
                        DtoReservaServicio dto = new DtoReservaServicio();
                        dto.setId(reserva.getId());
                        dto.setNombreEvento(evento != null ? evento.getNombre() : "Sin evento");
                        dto.setNombreServicio(servicio.getNombre());

                        assert evento != null;
                        dto.setNombreTipoEvento(evento.getTipoEvento().getNombre());
                        dto.setNombreTipoServicio(servicio.getTipoServicio().getNombre());
                        dto.setEstadoReserva(reserva.getEstadoReserva().name());
                        dto.setPrecioReserva(reserva.getPrecioReserva());
                        dto.setFechaReserva(reserva.getFechaReserva());
                        dto.setImagen(imagenBase64);
                        dto.setIdChat(
                                chatRepository.findByReserva(reserva)
                                        .map(chat -> chat.getId()) // si existe, devuelve el id
                                        .orElse(null) // si no existe, devuelve null
                        );

                        return dto;
                    });
                })
                .toList();
    }

}
