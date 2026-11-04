package com.wevently.wevently.Servicios.Controllers;

import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Servicios.DTO.DtoMensaje;
import com.wevently.wevently.Servicios.DTO.DtoNuevaPropuesta;
import com.wevently.wevently.Servicios.Services.ChatService;
import com.wevently.wevently.Servicios.Services.PropuestaService;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import com.wevently.wevently.UsuariosySeguridad.Services.UsuariosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.*;

@RestController()
@RequestMapping("/api/chat")
public class ChatController {

    @Autowired
    private final SimpMessagingTemplate messagingTemplate;
    @Autowired
    private final ChatService chatService;
    @Autowired
    private PropuestaService propuestaService;
    @Autowired
    UsuariosService usuariosService;

    public ChatController(SimpMessagingTemplate messagingTemplate, ChatService chatService) {
        this.messagingTemplate = messagingTemplate;
        this.chatService = chatService;
    }

    @PreAuthorize("isAuthenticated()")
    // @TienePermisos
    @GetMapping("")
    public ResponseEntity<?> getChat(@RequestParam Long id) {
        try {
            return ResponseEntity.status(200).body(chatService.getChat(id));
        } catch (io.jsonwebtoken.ExpiredJwtException e) {

            return ResponseEntity.status(401).body("La sesion ha expirado, inicia sesion nuevamente");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());

        }
    }

    @MessageMapping("/mensajes/nuevo")
    public void nuevoMensaje(@Payload DtoMensaje dto, StompHeaderAccessor accessor) throws ErrorDeNegocio {
        // Recuperar usuario desde el STOMP header
        UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) accessor.getUser();
        if (auth == null) {
            throw new RuntimeException("Usuario no autenticado");
        }

        String email = (String) auth.getPrincipal();
        Usuario usuario = usuariosService.findByEmail(email);

        // Llamar a tu servicio para enviar el mensaje
        chatService.nuevoMensaje(dto, usuario);
    }

    @PreAuthorize("isAuthenticated()")
    // @TienePermisos
    @PostMapping("/propuesta")
    public ResponseEntity<?> propuesta(@RequestParam Long chatId, @RequestBody DtoNuevaPropuesta dtoNuevaPropuesta) {
        try {
            return ResponseEntity.status(200).body(this.chatService.nuevaPropuesta(chatId, dtoNuevaPropuesta));
        }

        catch (ErrorDeNegocio e) {
            return ResponseEntity.badRequest().body(e.getMessage());

        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());

        }
    }

    @PreAuthorize("isAuthenticated()")
    // @TienePermisos
    @PutMapping("/propuestas/eliminar")
    public ResponseEntity<?> eliminar(@RequestParam Long id) {
        try {
            this.chatService.eliminarPropuesta(id);
            return ResponseEntity.status(200).body("Propuesta dada de baja correctamente");
        }

        catch (ErrorDeNegocio e) {
            return ResponseEntity.badRequest().body(e.getMessage());

        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());

        }
    }

    @PreAuthorize("isAuthenticated()")
    // @TienePermisos
    @PutMapping("/propuestas/aceptar")
    public ResponseEntity<?> aceptar(@RequestParam Long id) {
        try {
            return ResponseEntity.status(200).body(this.chatService.aceptarPropuesta(id));
        }

        catch (ErrorDeNegocio e) {
            return ResponseEntity.badRequest().body(e.getMessage());

        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());

        }
    }
}
