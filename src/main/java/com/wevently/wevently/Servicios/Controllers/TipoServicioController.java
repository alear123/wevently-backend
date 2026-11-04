package com.wevently.wevently.Servicios.Controllers;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Servicios.Entities.TipoServicio;
import com.wevently.wevently.Servicios.Services.TipoServicioService;

import java.util.List;

import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/tipo-de-servicio")
public class TipoServicioController extends BaseController<TipoServicio, Long, TipoServicioService> {
    public TipoServicioController(TipoServicioService service) {
        super(service);
    }

    @Override
    @GetMapping
    public List<TipoServicio> getAll() throws Exception {
        return super.getAll();
    }

    @Override
    @PostMapping
    public ResponseEntity<?> create(@RequestBody TipoServicio entity) {
        return super.create(entity);
    }


    @Override
    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody TipoServicio entity) throws Exception {
        return super.update(id, entity);
    }


    @Override
    @PutMapping("/baja/{id}")
    public ResponseEntity<?> bajaLogica(@PathVariable Long id) {
        return super.bajaLogica(id);
    }

    @CrossOrigin(origins = "http://localhost:5173")
    @GetMapping("/obtenerDtosTipoServicio")
    public ResponseEntity<?> getDtosTipoServicio(){
        try {
            return ResponseEntity.status(HttpStatus.OK).body(service.getDtosTipoServicio());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"error\":\"Error, por favor intente más tarde.\"}");
        }
    }

}

