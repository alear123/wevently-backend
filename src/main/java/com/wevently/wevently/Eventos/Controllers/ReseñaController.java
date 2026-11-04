package com.wevently.wevently.Eventos.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Eventos.DTO.DtoObtenerReseña;
import com.wevently.wevently.Eventos.DTO.DtoObtenerReseña;
import com.wevently.wevently.Eventos.DTO.DtoReseñaCreada;
import com.wevently.wevently.Eventos.Entities.Evento;
import com.wevently.wevently.Eventos.Entities.Reseña;
import com.wevently.wevently.Eventos.Entities.TipoEvento;
import com.wevently.wevently.Eventos.Services.ReseñaService;
import com.wevently.wevently.Eventos.Services.TipoEventoService;
import com.wevently.wevently.Lugares.DTO.DtoReseña;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;

import jakarta.persistence.EntityNotFoundException;

@RestController
@RequestMapping("/api/resena")
public class ReseñaController extends BaseController<Reseña, Long, ReseñaService> {

    public ReseñaController(ReseñaService service) {
        super(service);
    }

    @Autowired
    UsuarioDetailsService usuarioDetailsService;

    @PreAuthorize("isAuthenticated()")
    // @TienePermisos
    @PostMapping("/crear")
    public ResponseEntity<DtoReseña> create(@RequestBody DtoReseñaCreada dto) throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();
        return ResponseEntity.ok(service.create(dto, usuario));
    }

    @PreAuthorize("isAuthenticated()")
    // @TienePermisos
    @PutMapping("/update/{idReseña}")
    public ResponseEntity<DtoReseña> update(@RequestBody DtoReseñaCreada dto, @PathVariable Long idReseña)
            throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();
        return ResponseEntity.ok(service.update(dto, usuario, idReseña));
    }

    @PreAuthorize("isAuthenticated()")
    @DeleteMapping("/delete/{idReseña}")
    public ResponseEntity<DtoReseña> deleteResena(@PathVariable Long idReseña) throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();
        return ResponseEntity.ok(service.delete(usuario, idReseña));
    }

    @PostMapping("/getResenaPorUsuario") //  Sin tilde
    public ResponseEntity<?> getResena(@RequestBody DtoObtenerReseña dto) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            DtoReseña resena = service.ObtenerReseñaDeUnUsuario(usuario, dto);

            if (resena == null) {
                return ResponseEntity.status(404).body(null); //  Retorna 404 con body null
            }

            return ResponseEntity.ok(resena);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(404).body(null);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Error interno del servidor");
        }
    }
}
