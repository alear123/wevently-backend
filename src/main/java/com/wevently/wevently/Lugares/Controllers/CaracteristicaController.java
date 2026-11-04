package com.wevently.wevently.Lugares.Controllers;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Lugares.Entities.Caracteristica;
import com.wevently.wevently.Lugares.Services.CaracteristicaService;

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
@RequestMapping("/api/caracteristicas-de-lugar")
public class CaracteristicaController extends BaseController<Caracteristica, Long, CaracteristicaService> {
    public CaracteristicaController(CaracteristicaService service) {
        super(service);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @Override
    @GetMapping
    public List<Caracteristica> getAll() throws Exception {
        return super.getAll();
    }
}