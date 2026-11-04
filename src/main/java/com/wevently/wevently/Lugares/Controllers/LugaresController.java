/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Lugares.Controllers;

import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Lugares.DTO.*;
import com.wevently.wevently.Lugares.Entities.Lugar;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Lugares.Services.LugaresService;
import com.wevently.wevently.Servicios.DTO.DTOEstadoServicio;
import com.wevently.wevently.Servicios.DTO.DtoIniciarChat;
import com.wevently.wevently.Servicios.DTO.DtoNuevoServicio;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;

import jakarta.persistence.EntityNotFoundException;
import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/lugares")
public class LugaresController extends BaseController<Lugar, Long, LugaresService> {

    public LugaresController(LugaresService service) {
        super(service);
    }

    @Autowired
    private UsuarioDetailsService usuarioDetailsService;

    @GetMapping("/verDetalleLugar/{idLugar}")
    public ResponseEntity<DtoVerDetalleLugar> verDetalleLugar(@PathVariable Long idLugar) {
        try {
            return ResponseEntity.ok(service.verDetalleLugar(idLugar));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(null);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/obtenerEventosDisponibles/{fecha}/{idLugar}")
    public ResponseEntity<List<DtoEventoDisponible>> obtenerEventosDisponibles(
            @PathVariable @DateTimeFormat(pattern = "yyyy-MM-dd") Date fecha, @PathVariable Long idLugar) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            return ResponseEntity.ok(service.getEventoDisponibles(idLugar, fecha, usuario.getEmail()));
        } catch (Exception e) {
            e.printStackTrace(); // Esto imprimirá la causa real en consola
            return ResponseEntity.status(500).body(null);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/iniciarReserva")
    public ResponseEntity<Long> iniciarReserva(@RequestBody DtoIniciarReserva dtoIniciarReserva) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            return ResponseEntity.ok(service.iniciarReserva(dtoIniciarReserva, usuario.getEmail()));
        } catch (Exception e) {
            e.printStackTrace(); // Esto imprimirá la causa real en consola
            return ResponseEntity.status(500).body(null);
        }
    }

    @GetMapping("/obtenerDtoLugares")
    public ResponseEntity<?> getAllDtosLugar() {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(service.getAllDtosLugar());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("{\"error\":\"Error, por favor intente más tarde.\"}");
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/getMisLugares")
    public ResponseEntity<?> getLugaresByUsuarioEmail() throws Exception {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            return ResponseEntity.status(HttpStatus.OK).body(service.getLugaresByUsuarioEmail(usuario.getEmail()));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("{\"error\":\"Error, por favor intente más tarde.\"}");
        }

    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/getMisNombresLugar")
    public ResponseEntity<?> getMisNombresLugar() throws Exception {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            return ResponseEntity.status(HttpStatus.OK).body(service.getNombresLugaresByUsuarioEmail(usuario.getEmail()));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", e.getMessage()));
        }

    }



    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping("/crearLugar")
    public ResponseEntity<?> crearNuevoLugar(@RequestBody DtoNuevoLugar entity) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            DtoNuevoLugar createdLugar = service.crearNuevoLugar(entity, usuario.getEmail());
            return ResponseEntity.ok(createdLugar);
        } catch (EntityNotFoundException e) {
            // errores por entidad inexistente (usuario, tipo, localidad, etc.)
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", e.getMessage()));
        } catch (IllegalStateException | IllegalArgumentException | SecurityException e) {
            // errores de negocio, validaciones o permisos
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            e.printStackTrace();
            // error genérico
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("error", "Ocurrió un error inesperado al crear el lugar."));
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping("/modificarLugar")
    public ResponseEntity<?> modificarLugar(@RequestBody DtoNuevoLugar entity) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            DtoNuevoLugar updatedLugar = service.editarLugar(entity, usuario.getEmail());
            return ResponseEntity.ok(updatedLugar);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", e.getMessage()));
        } catch (IllegalStateException | IllegalArgumentException | SecurityException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("error", "Ocurrió un error inesperado al modificar el lugar."));
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/bajaLugar/{idLugar}")
    public ResponseEntity<?> bajaLugar(@PathVariable Long idLugar) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            DtoNuevoLugar updatedLugar = service.darBajaLugar(idLugar, usuario.getEmail());
            return ResponseEntity.ok(updatedLugar);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", e.getMessage()));
        } catch (IllegalStateException | SecurityException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("error", "Ocurrió un error inesperado al dar de baja el lugar."));
        }
    }

}
