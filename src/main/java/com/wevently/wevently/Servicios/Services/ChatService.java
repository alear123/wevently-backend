/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Servicios.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Pagos.Services.ParametroComisionService;
import com.wevently.wevently.Servicios.DTO.*;
import com.wevently.wevently.Servicios.Entities.Chat;
import com.wevently.wevently.Servicios.Entities.Mensaje;
import com.wevently.wevently.Servicios.Entities.Propuesta;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.Servicios.Repository.ChatRepository;
import com.wevently.wevently.Imagenes.Entities.Imagen;
import com.wevently.wevently.Imagenes.Services.ImagenService;
import com.wevently.wevently.UsuariosySeguridad.DTO.NotificacionRequest;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Enum.TipoNotificacion;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;
import com.wevently.wevently.UsuariosySeguridad.Services.NotificacionService;
import com.wevently.wevently.UsuariosySeguridad.Services.UsuariosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class ChatService extends BaseService<Chat, Long, ChatRepository> {

    @Autowired
    private UsuarioDetailsService usersDetailsService;
    @Autowired
    ParametroComisionService parametroComisionService;
    @Autowired
    NotificacionService notificacionService;

    public ChatService(ChatRepository repository) {
        super(repository);
    }

    @Autowired
    public UsuarioDetailsService usuarioDetailsService;
    @Autowired
    public ImagenService imagenService;
    @Autowired
    private SimpMessagingTemplate messagingTemplate;
    @Autowired
    PropuestaService propuestaService;

    @Transactional
    public DtoChat getChat(Long id) throws Exception {
        Usuario usuarioLogueado = usuarioDetailsService.getCurrentUser(); // loadUserByEmail(null);
        Optional<Chat> chat = repository.findById(id);
        if (!chat.isPresent()) {
            throw new ErrorDeNegocio("No existe un chat con el ID especificado");
        }
        Collections.sort(chat.get().getMensajes(), Comparator.comparing(Mensaje::getFechaHora));

        List<DtoMensaje> dtosMensajes = new ArrayList<>();

        for (Mensaje m : chat.get().getMensajes()) {
            dtosMensajes.add(new DtoMensaje(m.getTexto(), m.getFechaHora(), !m.getUsuario().equals(usuarioLogueado),
                    chat.get().getId()));

        }
        Usuario us = null;
        DtoUsuario destinatario = new DtoUsuario();

        if (chat.get().getPrestador().equals(usuarioLogueado)) {
            us = chat.get().getOrganizador();
        } else {
            us = chat.get().getPrestador();
        }

        destinatario.setNombre(us.getNombre());
        destinatario.setApellido(us.getApellido());
        destinatario.setEmail(us.getEmail());
        destinatario.setFoto(getfotoPerfil(us));
        DtoPropuesta dtoPropuesta = DtoPropuesta.builder()
                .cliente(chat.get().getOrganizador().getNombre() + " " + chat.get().getOrganizador().getApellido())
                .evento(chat.get().getEvento().getNombre())
                .fecha(chat.get().getEvento().getFecha().getDayOfMonth() + "/"
                        + (chat.get().getEvento().getFecha().getMonthValue() + 1) + "/"
                        + (chat.get().getEvento().getFecha().getYear()))
                .servicio(chat.get().getServicio().getNombre())
                .descripcion(chat.get().getServicio().getDescripcion())
                .comision(parametroComisionService.findParametroComisionActivo().getComisionServicio())
                .build();

        Propuesta propuesta = propuestaService.getPropuestaActiva(chat.get());
        if (propuesta != null) {
            dtoPropuesta.setNumero(propuesta.getId());
            dtoPropuesta.setSeña(propuesta.getSeña());
            dtoPropuesta.setTotal(propuesta.getPresupuestoTotal());
            dtoPropuesta.setAclaraciones(propuesta.getDescripcion());
            dtoPropuesta.setMostrar(true);
            dtoPropuesta.setComision(parametroComisionService.findParametroComisionActivo().getComisionServicio());
        }
        DtoChat dtoChat = new DtoChat(chat.get().getId(), destinatario, dtosMensajes, dtoPropuesta);
        return dtoChat;

    }

    public String getfotoPerfil(Usuario usuario) throws Exception {
        try {
            if (usuario.getImagen() != null) {
                Imagen imagen = imagenService.findById(usuario.getImagen().getId());
                return imagenService.buscar(imagen.getFilePath());
            }
            return null;
        } catch (IOException e) {
            return null;
        }
    }

    public DtoPropuesta nuevaPropuesta(Long idChat, DtoNuevaPropuesta dtoPropuesta) throws Exception {
        Chat chat = null;
        if (repository.findById(idChat).isPresent()) {
            chat = repository.findById(idChat).get();
        }
        Usuario usuarioLogueado = usersDetailsService.getCurrentUser();

        if (chat != null) {
            if (usuarioLogueado != null) {
                if (usuarioLogueado.equals(chat.getPrestador())) {
                    Propuesta propuesta = new Propuesta(dtoPropuesta.getTotal(), dtoPropuesta.getSeña(),
                            dtoPropuesta.getComentario(), LocalDateTime.now(), null);
                    for (Propuesta p : chat.getPropuestas()) {
                        if (p.getFechaHoraBaja() == null) {
                            throw new ErrorDeNegocio("Ya existe una propuesta activa para este evento");
                        }
                    }
                    if (dtoPropuesta.getSeña() < 0) {
                        throw new ErrorDeNegocio("El monto de la seña debe ser mayor a cero");
                    }
                    if (dtoPropuesta.getTotal() < 0) {
                        throw new ErrorDeNegocio("El monto total debe ser mayor a cero");
                    }
                    if (dtoPropuesta.getSeña() > dtoPropuesta.getTotal()) {
                        throw new ErrorDeNegocio("El monto de la seña no puede ser mayor que el total");
                    }
                    chat.getPropuestas().add(propuesta);
                    repository.save(chat);
                    DtoPropuesta dto = new DtoPropuesta(propuesta.getId(), chat.getOrganizador().getNombre(),
                            chat.getEvento().getNombre(),
                            chat.getEvento().getFecha().getDayOfMonth() + "/"
                                    + (chat.getEvento().getFecha().getMonthValue() + 1) + "/"
                                    + (chat.getEvento().getFecha().getYear()),
                            chat.getServicio().getNombre(), chat.getServicio().getDescripcion(),
                            dtoPropuesta.getComentario(), propuesta.getSeña(), propuesta.getPresupuestoTotal(), true,
                            parametroComisionService.findParametroComisionActivo().getComisionServicio());
                    messagingTemplate.convertAndSendToUser(chat.getOrganizador().getEmail(), "/queue/propuestas", dto);
                    return dto;
                }
                throw new ErrorDeNegocio("Solo el usuario con rol 'Prestador de servicios' puede enviar una propuesta");
            }
        }
        throw new ErrorDeNegocio("No se pudo encontrar el usuario a partir del token");

    }

    @Transactional
    public Boolean nuevoMensaje(DtoMensaje mensaje, Usuario usuarioLogueado) throws ErrorDeNegocio {

        try {
            Chat chat = null;
            if (repository.findById(mensaje.getChatId()).isPresent()) {
                chat = repository.findById(mensaje.getChatId()).get();
            }
            Usuario destinatario = null;

            if (usuarioLogueado.getEmail().equals(chat.getPrestador().getEmail())) {
                destinatario = chat.getOrganizador();
            } else {
                if (usuarioLogueado.getEmail().equals(chat.getOrganizador().getEmail())) {
                    destinatario = chat.getPrestador();

                } else {
                    throw new ErrorDeNegocio(
                            "El usuario: " + usuarioLogueado.getEmail() + " no es participe del chat " + chat.getId());
                }
            }

            chat.getMensajes().add(new Mensaje(mensaje.getTexto(), LocalDateTime.now(), usuarioLogueado));
            repository.save(chat);

            mensaje.setEsEntrante(true);
            messagingTemplate.convertAndSendToUser(
                    destinatario.getEmail(), // nombre del usuario
                    "/queue/mensajes", // cola privada
                    mensaje // mensaje
            );
            NotificacionRequest notificacion = NotificacionRequest.builder()
                    .tipoNotificacion(TipoNotificacion.Mensaje)
                    .usuarioId(destinatario.getId())
                    .titulo("Nuevo mensaje de " + usuarioLogueado.getNombre() + " " + usuarioLogueado.getApellido())
                    .urlReferencia("/chatear?id=" + chat.getId())
                    .resumen(mensaje.getTexto())
                    .build();
            notificacionService.crearNotificacion(notificacion);

            return true;
        } catch (Exception e) {
            return false;
        }

    }

    public void eliminarPropuesta(Long id) throws ErrorDeNegocio {
        try {
            Optional<Chat> chat = repository.findById(id);
            if (chat.isPresent()) {
                Propuesta propuesta = propuestaService.getPropuestaActiva(chat.get());
                if (propuesta != null) {
                    propuesta.setFechaHoraBaja(LocalDateTime.now());
                    repository.save(chat.get());
                    return;
                }
                throw new ErrorDeNegocio("No existe una instancia de propuesta activa");
            }
            throw new ErrorDeNegocio("No existe una instancia de chat con el ID indicado");

        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw new ErrorDeNegocio("No se ha podido eliminar la propuesta");

        }

    }

    public Long aceptarPropuesta(Long id) throws ErrorDeNegocio {
        try {
            Optional<Chat> chat = repository.findById(id);
            if (chat.isPresent()) {
                Reserva reserva = chat.get().getReserva();
                Propuesta propuesta = propuestaService.getPropuestaActiva(chat.get());
                if (propuesta != null) {
                    propuesta.setFechaHoraAlta(LocalDateTime.now());
                    reserva.setPropuesta(propuesta);
                    repository.save(chat.get());
                    chat.get().getReserva().setPropuesta(propuesta);
                    return chat.get().getReserva().getId();
                }
                throw new ErrorDeNegocio("No existe una instancia de propuesta activa");
            }
            throw new ErrorDeNegocio("No existe una instancia de chat con el ID indicado");

        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw new ErrorDeNegocio("No se ha podido aceptar la propuesta");

        }

    }

}
