package com.wevently.wevently.Pagos.Controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wevently.wevently.Pagos.DTO.DTOTransferenciaPendiente;
import com.wevently.wevently.Pagos.Services.AuditoriaTransaccionService;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("/api/auditoriaTransaccion")
public class AuditoriaTransaccionController {

    @Autowired
    private AuditoriaTransaccionService auditoriaTransaccionService;

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/transferencias-pendientes")
    public ResponseEntity<List<DTOTransferenciaPendiente>> obtenerTransferenciasPendientes() {
        List<DTOTransferenciaPendiente> pendientes = auditoriaTransaccionService
                .obtenerTransferenciasPendientes();
        return ResponseEntity.ok(pendientes);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/confirmar-transferencia/{id}")
    public ResponseEntity<Void> confirmarTransferencia(@PathVariable Long id) {
        auditoriaTransaccionService.actualizarEstadoTransaccion(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

}
