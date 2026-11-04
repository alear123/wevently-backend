package com.wevently.wevently.Reportes.ServiciosMasSolicitados.Controllers;

import com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.ProvinciaConLocalidadesDTO;
import com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.TipoServicioCantidad;
import com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.ProvinciaCantidadDTO;
import com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.ServicioGlobalDTO;
import com.wevently.wevently.Reportes.ServiciosMasSolicitados.Services.ServiciosMasSolicitadosService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/reportes/serviciosMasSolicitados")
public class ServiciosMasSolicitadosController {

    private final ServiciosMasSolicitadosService service;

    public ServiciosMasSolicitadosController(ServiciosMasSolicitadosService service) {
        this.service = service;
    }

    @PreAuthorize("isAuthenticated()")
    @com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos
    @GetMapping("/filtros")
    public ResponseEntity<List<ProvinciaConLocalidadesDTO>> filtros() {
        try {
            return ResponseEntity.ok(service.obtenerFiltros());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PreAuthorize("isAuthenticated()")
    @com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos
    @GetMapping
    public ResponseEntity<List<TipoServicioCantidad>> topTipos(
            @RequestParam(required = false) Long provinciaId,
            @RequestParam(required = false) Long localidadId,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date desde,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date hasta) {
        return ResponseEntity.ok(service.topTipos(provinciaId, localidadId, desde, hasta));
    }

    @PreAuthorize("isAuthenticated()")
    @com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos
    @GetMapping("/global/provincias")
    public ResponseEntity<List<ProvinciaCantidadDTO>> topProvinciasGlobal() {
        return ResponseEntity.ok(service.topProvinciasGlobal());
    }

    @PreAuthorize("isAuthenticated()")
    @com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos
    @GetMapping("/global/servicios")
    public ResponseEntity<List<ServicioGlobalDTO>> topServiciosGlobal() {
        return ResponseEntity.ok(service.topServiciosGlobal());
    }
}
