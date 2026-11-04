package com.wevently.wevently.Eventos.Controllers;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Eventos.Entities.TipoEvento;
import com.wevently.wevently.Eventos.Services.TipoEventoService;

import java.util.List;

import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
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
@RequestMapping("/api/tipo-de-evento")
public class TipoEventoController extends BaseController<TipoEvento, Long, TipoEventoService> {
    public TipoEventoController(TipoEventoService service) {
        super(service);
    }


    @TienePermisos
    @GetMapping("")
    public List<TipoEvento> getAll() throws Exception {
        return super.getAll();
    }


    // @TienePermisos
    @Override
    @PostMapping
    public ResponseEntity<?> create(@RequestBody TipoEvento entity) {
        return super.create(entity);
    }


    // @TienePermisos
    @Override
    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody TipoEvento entity) throws Exception {
        return super.update(id, entity);
    }


    // @TienePermisos
    @Override
    @PutMapping("/baja/{id}")
    public ResponseEntity<?> bajaLogica(@PathVariable Long id) {
        return super.bajaLogica(id);
    }
}