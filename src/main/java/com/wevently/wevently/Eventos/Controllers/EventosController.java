/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Eventos.Controllers;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Eventos.DTO.DtoEvento;
import com.wevently.wevently.Eventos.DTO.DtoLugarContratado;
import com.wevently.wevently.Eventos.DTO.DtoNuevoEvento;
import com.wevently.wevently.Eventos.DTO.DtoServicioContratado;
import com.wevently.wevently.Eventos.Entities.Evento;
import com.wevently.wevently.Eventos.Services.EventoService;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;

import jakarta.websocket.server.PathParam;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@RestController
@RequestMapping("/api/eventos")
public class EventosController extends BaseController<Evento, Long, EventoService> {

    @Autowired
    UsuarioDetailsService usuarioDetailsService;

    public EventosController(EventoService service) {
        super(service);
    }

    @GetMapping("/mis-eventos")
    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    public ResponseEntity<List<DtoEvento>> getEventosByUsuarioEmail() throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();
        List<DtoEvento> eventos = service.getEventosByUsuarioEmail(usuario.getEmail());
        return ResponseEntity.ok(eventos);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping("/nuevo")
    public ResponseEntity<Evento> crearNuevoEvento(@RequestBody DtoNuevoEvento entity) throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();
        Evento createdEvento = service.crearNuevoEvento(entity, usuario.getEmail());
        return ResponseEntity.ok(createdEvento);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/editar/{idEvento}")
    public ResponseEntity<DtoNuevoEvento> editarEvento(@RequestBody DtoNuevoEvento entity, @PathVariable Long idEvento)
            throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();
        DtoNuevoEvento updatedEvento = service.editarEvento(entity, idEvento, usuario.getEmail());

        return ResponseEntity.ok(updatedEvento);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/cancelar/{idEvento}")
    public ResponseEntity<?> cancelarEvento(@PathVariable Long idEvento) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            Evento eventoCancelado = service.cancelarEvento(idEvento, usuario.getEmail());
            return ResponseEntity.ok(eventoCancelado);
        } catch (Exception e) {
            e.printStackTrace(); // Esto imprimirá la causa real en consola
            return ResponseEntity.status(500).body(e.getMessage());
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/obtenerLugar/{idEvento}")
    public ResponseEntity<DtoLugarContratado> obtenerLugar(@PathVariable Long idEvento) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            DtoLugarContratado dtoLugarContratado = service.obtenerLugar(idEvento, usuario.getEmail());
            return ResponseEntity.ok(dtoLugarContratado);
        } catch (Exception e) {
            e.printStackTrace(); // Esto imprimirá la causa real en consola
            return ResponseEntity.status(500).body(null);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/obtenerServicios/{idEvento}")
    public ResponseEntity<List<DtoServicioContratado>> obtenerServicios(@PathVariable Long idEvento) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            return ResponseEntity.ok(service.obtenerServiciosContratados(idEvento, usuario.getEmail()));
        } catch (Exception e) {
            e.printStackTrace(); // Esto imprimirá la causa real en consola
            return ResponseEntity.status(500).body(null);
        }
    }

    @PostMapping("/actualizar-realizados")
    public ResponseEntity<String> actualizarEventosRealizadosManualmente() {
        service.actualizarEventosRealizados();
        return ResponseEntity.ok("Eventos actualizados manualmente");
    }

}
