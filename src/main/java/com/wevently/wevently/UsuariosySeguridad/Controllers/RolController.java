package com.wevently.wevently.UsuariosySeguridad.Controllers;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.UsuariosySeguridad.Entities.Rol;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import com.wevently.wevently.UsuariosySeguridad.Services.RolService;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoRol;
import com.wevently.wevently.UsuariosySeguridad.Repository.GrupoRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/seguridad/roles")
public class RolController {

    @Autowired
    private RolService rolService;
    
    @Autowired
    private GrupoRepository grupoRepository;

    @Autowired
    private com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService usuarioDetailsService;

    @Autowired
    private com.wevently.wevently.UsuariosySeguridad.Services.UsuariosService usuariosService;
    
    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping("/nuevo")
    public ResponseEntity<?> crearRol(@RequestBody DtoRol dto) {
        try {
            Rol rol = rolService.crearRol(dto, grupoRepository);
            DtoRol respuesta = DtoRol.fromEntity(rol);
            return ResponseEntity.ok(respuesta);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/{id}/actualizar")
    public ResponseEntity<?> actualizarRol(@PathVariable Long id, @RequestBody DtoRol dto) {
        try {
            Rol rol = rolService.actualizarRol(id, dto, grupoRepository);
            DtoRol respuesta = DtoRol.fromEntity(rol);
            return ResponseEntity.ok(respuesta);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
    
    @GetMapping("/sin-privilegios")
    public ResponseEntity<?> obtenerRolesSinPrivilegios() {
        try {
            List<DtoRol> roles = rolService.obtenerRolesSinPrivilegios();
            return ResponseEntity.ok(roles);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/pantallas-inicio-posibles")
    public ResponseEntity<List<String>> obtenerPantallasInicioPosibles(
            @RequestParam String rol) throws Exception {
        List<String> rutas = rolService.obtenerPantallasInicioPosibles(rol);
        return ResponseEntity.ok(rutas);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/pantallas-inicio-posibles-por-grupos")
    public ResponseEntity<List<String>> obtenerPantallasInicioPosibles(
            @RequestParam List<Long> gruposIds) throws Exception {
        List<String> rutas = rolService.obtenerPantallasInicioPosibles(gruposIds, grupoRepository);
        return ResponseEntity.ok(rutas);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/{id}/estado")
    public ResponseEntity<?> cambiarEstadoRol(@PathVariable Long id, @RequestParam boolean activo) {
        try {
            Rol rol = rolService.cambiarEstadoRol(id, activo);
            DtoRol respuesta = DtoRol.fromEntity(rol);
            return ResponseEntity.ok(respuesta);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
    
    @GetMapping
    public ResponseEntity<Page<DtoRol>> obtenerTodosLosRoles(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) Boolean estado,
            @RequestParam(required = false) String busqueda) {
        try {
            Page<DtoRol> roles = rolService.obtenerRolesPaginados(page, size, estado, busqueda);
            return ResponseEntity.ok(roles);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
    
    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminarRol(@PathVariable Long id) {
        try {
            rolService.eliminarRol(id);
            return ResponseEntity.ok("Rol eliminado correctamente");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/mis-reportes")
    public ResponseEntity<List<String>> obtenerReportesDelRolActivo() {
        try {
            // 1. Obtener usuario autenticado
            var usuario = usuarioDetailsService.getCurrentUser();
            // 2. Obtener rol activo
            var rol = usuariosService.getCurrentRol(usuario);
            // 3. Recorrer grupos y permisos, filtrar reportes
            var rutasReportes = rol.getGrupos().stream()
                    .flatMap(grupo -> grupo.getPermisos().stream())
                    .map(permiso -> permiso.getRuta())
                    .filter(ruta -> ruta.startsWith("/api/reportes/"))
                    .distinct()
                    .toList();
            return ResponseEntity.ok(rutasReportes);
        } catch (Exception e) {
            return ResponseEntity.status(403).body(List.of());
        }
    }

}
