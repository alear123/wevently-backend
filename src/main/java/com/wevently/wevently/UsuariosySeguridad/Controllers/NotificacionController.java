package com.wevently.wevently.UsuariosySeguridad.Controllers;

import java.util.concurrent.CompletableFuture;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.security.core.Authentication;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.UsuariosySeguridad.DTO.NotificacionDTO;
import com.wevently.wevently.UsuariosySeguridad.DTO.NotificacionRequest;
import com.wevently.wevently.UsuariosySeguridad.Entities.Notificacion;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Services.NotificacionService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("api/notificaciones")
@Slf4j
public class NotificacionController extends BaseController<Notificacion, Long, NotificacionService> {

    public NotificacionController(NotificacionService service) {
        super(service);
    }

    @GetMapping("/mias")
    public ResponseEntity<Page<NotificacionDTO>> obtenerMisNotificaciones(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestParam(defaultValue = "false") boolean soloNoLeidas,
            Authentication authentication) {
        Long usuarioId = obtenerUsuarioId(authentication);
        return ResponseEntity.ok(service
                .obtenerNotificacionesUsuario(usuarioId, soloNoLeidas, PageRequest.of(page, size)));
    }

    @GetMapping("/count")
    public ResponseEntity<Map<String, Long>> contarMisNoLeidas(Authentication authentication) {
        Long usuarioId = obtenerUsuarioId(authentication);
        Long count = service.contarNoLeidas(usuarioId);
        return ResponseEntity.ok(Map.of("count", count));
    }

    @PutMapping("/{notificacionId}/leer")
    public ResponseEntity<Void> marcarComoLeida(
            @PathVariable Long notificacionId,
            Authentication authentication) {
        try {
            Long usuarioId = obtenerUsuarioId(authentication);
            service.marcarComoLeida(notificacionId, usuarioId);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            log.error("Error marcando como leída: {}", e.getMessage());
            return ResponseEntity.badRequest().build();
        }
    }

    @PutMapping("/leer-todas")
    public ResponseEntity<Void> marcarTodasComoLeidas(
            Authentication authentication) {
        try {
            Long usuarioAutenticado = obtenerUsuarioId(authentication);

            service.marcarTodasComoLeidas(usuarioAutenticado);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            log.error("Error marcando todas como leídas: {}", e.getMessage());
            return ResponseEntity.badRequest().build();
        }
    }

    // Este endpoint no se usa pa borrar, se usa el del base controller
    @DeleteMapping("/{notificacionId}")
    public ResponseEntity<Void> eliminarNotificacion(
            @PathVariable Long notificacionId,
            Authentication authentication) {
        try {
            Long usuarioId = obtenerUsuarioId(authentication);
            service.eliminarNotificacion(notificacionId, usuarioId);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            log.error("Error eliminando notificación: {}", e.getMessage());
            return ResponseEntity.badRequest().build();
        }
    }

    /*
     * Cuando manden el "TipoNotificacion" acuerdense que maneajmos: Propuesta,
     * Mensaje, Recordatorio, Alerta
     */
    @PostMapping("/crear")
    public ResponseEntity<Map<String, String>> crearNotificacion(
            @RequestBody NotificacionRequest request) {
        try {
            CompletableFuture<Notificacion> futureNotificacion = service.crearNotificacion(request);

            log.info("rec", futureNotificacion);
            return ResponseEntity.ok(Map.of("status", "success",
                    "message", "Notificación creada correctamente"));
        } catch (Exception e) {
            log.error("Error creando notificación: {}", e.getMessage());
            return ResponseEntity.badRequest()
                    .body(Map.of("error", "Error al crear la notificación"));
        }
    }

    private Long obtenerUsuarioId(Authentication authentication) {
        if (authentication != null && authentication.getPrincipal() instanceof Usuario) {
            Usuario usuario = (Usuario) authentication.getPrincipal();
            log.debug("Usuario autenticado: {} (ID: {})", usuario.getEmail(), usuario.getId());
            return usuario.getId();
        }

        log.error("Usuario no autenticado o principal no es Usuario: {}",
                authentication != null ? authentication.getPrincipal().getClass() : "null");
        throw new RuntimeException("Usuario no autenticado");
    }

    // ESTOS SON PARA PROBAR NOMAS, NO USAR
    @PostMapping("/test/propuesta/{usuarioId}")
    public ResponseEntity<Void> crearNotificacionPrueba(@PathVariable Long usuarioId) {
        CompletableFuture<Void> future = service
                .notificarNuevaPropuesta(usuarioId, "Esta es una prueba", "/eventos/123");

        log.info("rec", future);
        return ResponseEntity.ok().build();
    }

    // endpoitn para probar otro tipo
    @PostMapping("/test/recordatorio/{usuarioId}")
    public ResponseEntity<Void> crearRecordatorioPrueba(@PathVariable Long usuarioId) {
        CompletableFuture<Void> future = service.notificarRecordatorioEvento(usuarioId, "charli xcx rave",
                "24/09/2025", "/urlEventoCharli");
        log.info("resp:", future);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/test/mensaje/{usuarioId}")
    public ResponseEntity<Void> crearMensaje(@PathVariable Long usuarioId) {
        CompletableFuture<Void> future = service.notificarMensajeNuevo(usuarioId, "cacho catering",
                "si eso incluye servicio comp...", "/chat/12312432");
        log.info("resp:", future);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/test/alerta/{usuarioId}")
    public ResponseEntity<Void> crearAlerta(@PathVariable Long usuarioId) {
        CompletableFuture<Void> future = service.notificarAlerta(usuarioId, "Backup completo",
                "El backup programado se completo", "/backups/1234");
        log.info("resp:", future);
        return ResponseEntity.ok().build();
    }
}
