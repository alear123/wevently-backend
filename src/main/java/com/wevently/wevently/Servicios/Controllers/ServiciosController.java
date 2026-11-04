/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Servicios.Controllers;

import com.wevently.wevently.Eventos.DTO.DtoEvento;
import com.wevently.wevently.Eventos.DTO.DtoNuevoEvento;
import com.wevently.wevently.Eventos.Entities.Evento;
import com.wevently.wevently.Servicios.DTO.DtoIniciarChat;
import com.wevently.wevently.Servicios.DTO.DtoNuevoServicio;
import com.wevently.wevently.Servicios.DTO.DtoServicio;
import com.wevently.wevently.Servicios.DTO.DtoVerDetalleServicio;
import com.wevently.wevently.Servicios.Entities.Servicio;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Eventos.DTO.DtoLugarContratado;
import com.wevently.wevently.Lugares.DTO.DtoEventoDisponible;
import com.wevently.wevently.Servicios.Services.ServicioService;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/servicios")
public class ServiciosController extends BaseController<Servicio, Long, ServicioService> {

    public ServiciosController(ServicioService service) {
        super(service);
    }

    @Autowired
    private UsuarioDetailsService usuarioDetailsService;

    @GetMapping("/verDetalleServicio/{idServicio}")
    public ResponseEntity<DtoVerDetalleServicio> verDetalleServicio(@PathVariable Long idServicio) {
        try {
            return ResponseEntity.ok(service.verDetalleServicio(idServicio));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(null);
        }
    }

    @PreAuthorize("isAuthenticated()")
    // @TienePermisos
    @GetMapping("/obtenerEventosDisponibles/{fecha}/{idServicio}")
    public ResponseEntity<List<DtoEventoDisponible>> obtenerEventosDisponibles(
            @PathVariable @DateTimeFormat(pattern = "yyyy-MM-dd") Date fecha, @PathVariable Long idServicio) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            return ResponseEntity.ok(service.obtenerEventosPorUsuarioYFecha(usuario.getEmail(), fecha, idServicio));
        } catch (Exception e) {
            e.printStackTrace(); // Esto imprimirá la causa real en consola
            return ResponseEntity.status(500).body(null);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/iniciarChat")
    public ResponseEntity<Long> iniciarChat(@RequestBody DtoIniciarChat dtoReserva) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            return ResponseEntity.ok(service.IniciarChat(dtoReserva, usuario.getEmail()));
        } catch (Exception e) {
            e.printStackTrace(); // Esto imprimirá la causa real en consola
            return ResponseEntity.status(500).body(null);
        }
    }

    @GetMapping("/obtenerDtosServicio")
    public ResponseEntity<?> getDtosServicio() {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(service.getDtosServicio());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("{\"error\":\"Error, por favor intente más tarde.\"}");
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/getMisServicios")
    public ResponseEntity<?> getServiciosByUsuarioEmail() throws Exception {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            return ResponseEntity.status(HttpStatus.OK).body(service.getServiciosByUsuarioEmail(usuario.getEmail()));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("{\"error\":\"Error, por favor intente más tarde.\"}");
        }

    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping("/crearServicio")
    public ResponseEntity<?> crearNuevoServicio(@RequestBody DtoNuevoServicio entity) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            DtoNuevoServicio createdServicio = service.crearNuevoServicio(entity, usuario.getEmail());
            return ResponseEntity.ok(createdServicio);
        } catch (Exception e) {
            e.printStackTrace();
            // Retornamos el mensaje exacto al frontend
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", e.getMessage()));
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping("/modificarServicio")
    public ResponseEntity<?> modificarServicio(@RequestBody DtoNuevoServicio entity) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            DtoNuevoServicio updatedServicio = service.editarServicio(entity, usuario.getEmail());
            return ResponseEntity.ok(updatedServicio);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", e.getMessage()));
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/bajaServicio/{idServicio}")
    public ResponseEntity<?> bajaServicio(@PathVariable Long idServicio) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            DtoNuevoServicio updatedServicio = service.darBajaServicio(idServicio, usuario.getEmail());
            return ResponseEntity.ok(updatedServicio);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", e.getMessage()));
        }
    }


    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/getMisNombresServicio")
    public ResponseEntity<?> getMisNombresLugar() throws Exception {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            return ResponseEntity.status(HttpStatus.OK).body(service.getNombresServiciosByUsuarioEmail(usuario.getEmail()));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", e.getMessage()));
        }

    }
}
