package com.wevently.wevently.UsuariosySeguridad.Services;

import java.time.LocalDateTime;
import java.util.concurrent.CompletableFuture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.data.domain.Page;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Pageable;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.UsuariosySeguridad.DTO.NotificacionDTO;
import com.wevently.wevently.UsuariosySeguridad.DTO.NotificacionRequest;
import com.wevently.wevently.UsuariosySeguridad.Entities.Notificacion;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Enum.TipoNotificacion;
import com.wevently.wevently.UsuariosySeguridad.Repository.NotificacionRepository;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;
import com.wevently.wevently.UsuariosySeguridad.Services.Events.NotificacionCreadaEvent;

import lombok.extern.slf4j.Slf4j;

/*Si al querer hacer una notificacion y la base de datos da un error de violacion de constraints
 * tenes que ejecutar esto:
 * ALTER TABLE notificaciones DROP CHECK notificaciones_chk_1;
ALTER TABLE notificaciones MODIFY tipo_notificacion enum('Propuesta','Mensaje','Recordatorio','Alerta');
Nose que le pinto al mysql que se puso la gorra
 */

@Service
@Slf4j
public class NotificacionService extends BaseService<Notificacion, Long, NotificacionRepository> {

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @Autowired
    private UsuarioRepository usuarioRepository;

    public NotificacionService(NotificacionRepository repository) {
        super(repository);
    }

    @Transactional
    public CompletableFuture<Notificacion> crearNotificacion(NotificacionRequest request) {
        return CompletableFuture.supplyAsync(() -> {
            try {
                log.debug("Buscando usuario por ID: {}", request.getUsuarioId());
                Usuario usuario = usuarioRepository.findById(request.getUsuarioId())
                        .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
                log.debug("Usuario encontrado: id={}, email={}", usuario.getId(), usuario.getEmail());

                Notificacion notificacion = new Notificacion();
                notificacion.setTipoNotificacion(request.getTipoNotificacion());
                notificacion.setTitulo(request.getTitulo());
                notificacion.setResumen(request.getResumen());
                notificacion.setUrl_referencia(request.getUrlReferencia());
                notificacion.setUsuario(usuario);
                notificacion.setFechaHoraAlta(LocalDateTime.now());
                notificacion.setLeida(false);

                Notificacion guardada = repository.save(notificacion);
                log.info("Notificación guardada: id={}, usuarioId={}", guardada.getId(), usuario.getId());
                return guardada;
            } catch (Exception e) {
                log.error("error creando la notificacion: {}", e.getMessage());
                throw new RuntimeException("error al crear la notificacion", e);
            }
        });
    }

    @EventListener
    @Async
    public void handleNotificacionCreada(NotificacionCreadaEvent event) {
        try {
            Notificacion notificacion = event.getNotificacion();

            // Enviar por WebSocket
            enviarNotificacionWebSocket(notificacion);

            log.info("Notificación enviada via WebSocket a usuario: {}",
                    notificacion.getUsuario().getId());

        } catch (Exception e) {
            log.error("Error enviando notificación: {}", e.getMessage());
        }
    }

    private void enviarNotificacionWebSocket(Notificacion notificacion) {
        NotificacionDTO dto = convertirADTO(notificacion);
        String destination = "/user/" + notificacion.getUsuario().getEmail() +
                "/ws-notifications";
        messagingTemplate.convertAndSend(destination, dto);
    }

    public Page<NotificacionDTO> obtenerNotificacionesUsuario(Long usuarioId,
            boolean soloNoLeidas, Pageable pageable) {
        Page<Notificacion> notificaciones;

        if (soloNoLeidas) {
            notificaciones = repository.findUnreadByUsuarioId(
                    usuarioId, pageable);
        } else {
            notificaciones = repository.findByUsuarioIdNotDeleted(
                    usuarioId, pageable);
        }

        return notificaciones.map(this::convertirADTO);
    }

    public Long contarNoLeidas(Long usuarioId) {
        return repository.countUnreadByUsuarioId(usuarioId);
    }

    @Transactional
    public void marcarComoLeida(Long notificacionId, Long usuarioId) {
        Notificacion notificacion = repository.findById(notificacionId)
                .orElseThrow(() -> new RuntimeException("Notificación no encontrada"));

        // Verificar pertenencia al usuario
        if (!notificacion.getUsuario().getId().equals(usuarioId)) {
            throw new RuntimeException("Acceso denegado a la notificación");
        }

        notificacion.setLeida(true);
        repository.save(notificacion);
    }

    @Transactional
    public void marcarTodasComoLeidas(Long usuarioId) {
        repository.markAllAsReadByUsuarioId(usuarioId);
    }

    @Transactional
    public void eliminarNotificacion(Long notificacionId, Long usuarioId) {
        Notificacion notificacion = repository.findById(notificacionId)
                .orElseThrow(() -> new RuntimeException("Notificación no encontrada"));

        if (!notificacion.getUsuario().getId().equals(usuarioId)) {
            throw new RuntimeException("Acceso denegado a la notificación");
        }

        notificacion.setFechaHoraBaja(LocalDateTime.now());
        repository.save(notificacion);
    }

    // Métodos de notificación para eventos específicos
    @Async
    public CompletableFuture<Void> notificarNuevaPropuesta(Long usuarioId, String detalle, String urlEvento) {
        NotificacionRequest request = NotificacionRequest.builder()
                .usuarioId(usuarioId)
                .tipoNotificacion(TipoNotificacion.Propuesta)
                .titulo("Nueva propuesta recibida")
                .resumen(detalle)
                .urlReferencia(urlEvento)
                .build();

        return crearNotificacion(request)
                .thenAccept(n -> log.info("Notificación de propuesta creada para usuario: {}", usuarioId));
    }

    @Async
    public CompletableFuture<Void> notificarRecordatorioEvento(Long usuarioId, String nombreEvento, String fecha,
            String urlEvento) {
        NotificacionRequest request = NotificacionRequest.builder()
                .usuarioId(usuarioId)
                .tipoNotificacion(TipoNotificacion.Recordatorio)
                .titulo("Recordatorio de evento")
                .resumen("Tu evento '" + nombreEvento + "' es el " + fecha)
                .urlReferencia(urlEvento)
                .build();

        return crearNotificacion(request).thenAccept(n -> log.info("Recordatorio creado para usuario: {}", usuarioId));
    }

    @Async
    public CompletableFuture<Void> notificarMensajeNuevo(Long IDusuarioDestino, String nombreUsuarioEmisor,
            String resumenMensaje, String UrlConversacion) {
        NotificacionRequest request = NotificacionRequest.builder()
                .usuarioId(IDusuarioDestino)
                .tipoNotificacion(TipoNotificacion.Mensaje)
                .titulo("Mensaje nuevo de " + nombreUsuarioEmisor)
                .resumen(resumenMensaje)
                .urlReferencia(UrlConversacion)
                .build();

        return crearNotificacion(request).thenAccept(n -> log.info("mensaje notificado a {}", IDusuarioDestino));
    }

    @Async
    public CompletableFuture<Void> notificarAlerta(Long idUsuario, String tituloAlerta, String resumenAlerta,
            String UrlAlerta) {
        NotificacionRequest request = NotificacionRequest.builder()
                .tipoNotificacion(TipoNotificacion.Alerta)
                .titulo(tituloAlerta)
                .resumen(resumenAlerta)
                .urlReferencia(UrlAlerta)
                .usuarioId(idUsuario)
                .build();

        return crearNotificacion(request).thenAccept(n -> log.info("alerta enviada al usuario {}", idUsuario));
    }

    private NotificacionDTO convertirADTO(Notificacion notificacion) {
        return NotificacionDTO.builder()
                .id(notificacion.getId())
                .tipoNotificacion(notificacion.getTipoNotificacion())
                .titulo(notificacion.getTitulo())
                .resumen(notificacion.getResumen())
                .fechaHoraAlta(notificacion.getFechaHoraAlta())
                .leida(notificacion.getLeida())
                .urlReferencia(notificacion.getUrl_referencia())
                .build();
    }

}
