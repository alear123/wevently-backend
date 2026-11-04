package com.wevently.wevently.Backups.Controllers;

import com.wevently.wevently.Backups.DTO.DtoBajaEstadoBackup;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.wevently.wevently.Backups.Entities.EstadoBackup;
import com.wevently.wevently.Backups.Services.EstadoBackupService;
import com.wevently.wevently.Base.BaseController;

@RestController
@RequestMapping("/api/estado-backup")
public class EstadoBackupController extends BaseController<EstadoBackup, Long, EstadoBackupService> {

    public EstadoBackupController(EstadoBackupService service) {
        super(service);
    }

    @Autowired
    UsuarioDetailsService usuarioDetailsService;

    @PutMapping("/baja-estadobackup/{id}")
    public ResponseEntity<?> darBajaEstadoBackup(
            @PathVariable Long id) throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();
        try {
            DtoBajaEstadoBackup dto = service.darBajaEstadoBackup(id, usuario.getEmail());
            return ResponseEntity.ok(dto);
        }
        catch (EntityNotFoundException e) {
            return ResponseEntity.status(404).body(e.getMessage());
        }
        catch (IllegalStateException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
        catch (Exception e) {
            return ResponseEntity.internalServerError().body("Error al dar de baja el estado: " + e.getMessage());
        }
    }

    @PutMapping("/rehabilitar-estadobackup/{id}")
    public ResponseEntity<?> rehabilitarEstadoBackup(@PathVariable Long id) throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();
        try {
            DtoBajaEstadoBackup dto = service.rehabilitarEstadoBackup(id, usuario.getEmail());
            return ResponseEntity.ok(dto);
        }
        catch (EntityNotFoundException e) {
            return ResponseEntity.status(404).body(e.getMessage());
        }
        catch (IllegalStateException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
        catch (Exception e) {
            return ResponseEntity.internalServerError().body("Error al habilitar el estado: " + e.getMessage());
        }
    }

}
