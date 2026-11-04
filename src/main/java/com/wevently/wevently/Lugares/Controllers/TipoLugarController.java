package com.wevently.wevently.Lugares.Controllers;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Lugares.Entities.TipoLugar;
import com.wevently.wevently.Lugares.Services.TipoLugarService;

import java.util.List;

import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/tipo-de-lugar")
public class TipoLugarController extends BaseController<TipoLugar, Long, TipoLugarService> {
    public TipoLugarController(TipoLugarService service) {
        super(service);
    }

    @Override
    @GetMapping
    public List<TipoLugar> getAll() throws Exception {
        return super.getAll();
    }


    @Override
    @PostMapping
    public ResponseEntity<?> create(@RequestBody TipoLugar entity) {
        return super.create(entity);
    }


    @Override
    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody TipoLugar entity) throws Exception {
        return super.update(id, entity);
    }


    @Override
    @PutMapping("/baja/{id}")
    public ResponseEntity<?> bajaLogica(@PathVariable Long id) {
        return super.bajaLogica(id);
    }

    @CrossOrigin(origins = "http://localhost:5173")
    @GetMapping("/obtenerDtosTipoLugar")
    public ResponseEntity<?> getDtosTipoLugar() {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(service.obtenerDtosTipoLugar());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"error\":\"Error, por favor intente más tarde.\"}");
        }
    }


}