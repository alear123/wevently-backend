package com.wevently.wevently.Eventos.Controllers;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.Entities.EstadoEvento;
import com.wevently.wevently.Eventos.Repository.EstadoEventoRepository;
import com.wevently.wevently.Eventos.Services.EstadoEventoService;

import java.util.List;
import java.util.Map;

import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/estado-del-evento")
public class EstadoEventoController extends BaseController<EstadoEvento, Long, EstadoEventoService> {

    public EstadoEventoController(EstadoEventoService service) {
        super(service);
    }
    @PreAuthorize("isAuthenticated()")
    @Override
    @GetMapping
    public List<EstadoEvento> getAll() throws Exception {
        return super.getAll();
    }


    @Override
    @PostMapping
    public ResponseEntity<?> create(@RequestBody EstadoEvento entity) {
        return super.create(entity);
    }


    @Override
    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody EstadoEvento entity) throws Exception {
        return super.update(id, entity);
    }


    @Override
    @PutMapping("/baja/{id}")
    public ResponseEntity<?> bajaLogica(@PathVariable Long id) {
        return super.bajaLogica(id);
    }

    @PreAuthorize("isAuthenticated()")
    @PutMapping("/baja-estadoevento/{id}")
    public ResponseEntity<?> darDeBaja(@PathVariable Long id) {
        try {
            EstadoEvento dadoDeBaja = service.darDeBaja(id);
            return ResponseEntity.ok(dadoDeBaja);
        } catch (ErrorDeNegocio e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(Map.of("error", "Error al dar de baja el estado del evento"));
        }
    }

    @PreAuthorize("isAuthenticated()")
    @PutMapping("/habilitar-estadoevento/{id}")
    public ResponseEntity<?> habilitar(@PathVariable Long id) {
        try {
            EstadoEvento habilitado = service.habilitar(id);
            return ResponseEntity.ok(habilitado);
        } catch (ErrorDeNegocio e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(Map.of("error", "Error al habilitar el estado del evento"));
        }
    }
}