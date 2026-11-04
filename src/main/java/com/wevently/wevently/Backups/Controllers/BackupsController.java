/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Backups.Controllers;

import com.wevently.wevently.Backups.DTO.*;
import com.wevently.wevently.Backups.Services.BackupsService;
import com.wevently.wevently.Backups.Entities.BackupConfiguracion;
import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;

import java.util.List;


import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/api/backups")
public class BackupsController extends BaseController<BackupConfiguracion, Long, BackupsService> {

    @Autowired
    UsuarioDetailsService usuarioDetailsService;

    public BackupsController(BackupsService service) {
        super(service);
    }

    @GetMapping("/mis-backups")
    // @PreAuthorize("isAuthenticated()")
    // @TienePermisos
    public ResponseEntity<List<DtoBackup>> getBackups() throws Exception {
        List<DtoBackup> backups = service.listarBackups();
        return ResponseEntity.ok(backups);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<BackupConfiguracionResponseDTO> updateBackup(@PathVariable Long id, @RequestBody DtoModificacionBackup dto) {
        BackupConfiguracionResponseDTO  backup = service.modificarConfiguracion(id, dto);
        return ResponseEntity.ok(backup);
    }

    @PostMapping("/create")
    //@PreAuthorize("isAuthenticated()")
    // @TienePermisos
    public ResponseEntity<BackupConfiguracion> create(@RequestBody DtoNuevoBackup entity) throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();
        BackupConfiguracion createdBackup = service.createBackup(entity, usuario.getEmail());
        return ResponseEntity.ok(createdBackup);
    }

    // @PreAuthorize("isAuthenticated()")
    // @TienePermisos
    @PostMapping("/realizar-backups")
    public ResponseEntity<String> realizarBackupsManualmente() {
        service.ejecutarBackupsPendientes();
        return ResponseEntity.ok("Backups realizados manualmente");
    }

    @PutMapping("/baja-logica-backup/{idBackup}")
    public ResponseEntity<?> bajaLogicaBackup(@PathVariable Long idBackup) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            BackupConfiguracion config = service.cancelarBackup(idBackup, usuario.getEmail());

            // Convertir a DTO (evita problema de serialización lazy)
            BackupConfiguracionDTO dto = new BackupConfiguracionDTO(
                    config.getId(),
                    config.getNombre(),
                    config.getDiasRetencion()
            );

            return ResponseEntity.ok(dto);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al cancelar el backup: " + e.getMessage());
        }
    }



    @PostMapping("/limpiar-retencion")
    //@PreAuthorize("isAuthenticated()")
    public ResponseEntity<?> limpiarBackupsPorRetencion() {
        try {
            service.limpiarBackupsPorRetencion();
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
    }

    /*@GetMapping("/download/{idBackup}")
    //@PreAuthorize("isAuthenticated()")
    // @TienePermisos
    public ResponseEntity<Resource> descargarBackup(@PathVariable Long idBackup) {
        try {
            Resource recurso = service.descargarBackup(idBackup);

            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .header(HttpHeaders.CONTENT_DISPOSITION,
                            "attachment; filename=\"" + recurso.getFilename() + "\"")
                    .body(recurso);

        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        } catch (ResponseStatusException e) {
            return ResponseEntity.status(e.getStatusCode()).body(null);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }*/

    @PostMapping("/restaurar/{idBackup}")
    //@PreAuthorize("isAuthenticated()")
    // @TienePermisos
    public ResponseEntity<?> restaurarBackup(@PathVariable Long idBackup) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            service.restaurarBackup(idBackup, usuario.getEmail());
            return ResponseEntity.ok("Backup restaurado correctamente");
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (ResponseStatusException e) {
            return ResponseEntity.status(e.getStatusCode()).body(e.getReason());
            } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al restaurar backup");
        }
    }

    @PostMapping("/rehabilitar/{idBackup}")
    //@PreAuthorize("isAuthenticated()")
    //@TienePermisos
    public ResponseEntity<?> rehabilitarBackup(@PathVariable Long idBackup) {
        try {
            // Obtener usuario autenticado
            Usuario usuario = usuarioDetailsService.getCurrentUser();

            // Llamar al servicio para rehabilitar la configuración
            service.habilitarBackupConfiguracion(idBackup, usuario.getEmail());

            return ResponseEntity.ok("Backup rehabilitado correctamente");
        }
        catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
        catch (IllegalStateException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
        catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al rehabilitar el backup");
        }
    }

}
