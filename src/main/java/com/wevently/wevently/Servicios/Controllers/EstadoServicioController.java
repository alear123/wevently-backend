package com.wevently.wevently.Servicios.Controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Servicios.Entities.EstadoServicio;
import com.wevently.wevently.Servicios.Services.EstadoServicioService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;
import com.wevently.wevently.Servicios.DTO.DTOEstadoServicio;

@RestController
@RequestMapping("api/estados-servicio")
public class EstadoServicioController extends BaseController<EstadoServicio, Long, EstadoServicioService> {

    public EstadoServicioController(EstadoServicioService service) {
        super(service);
    }

    // @isAuthorize() -> despues ver como restringir los endpoints del base
    @GetMapping("/todos")
    public ResponseEntity<List<DTOEstadoServicio>> traerTodos() {
        return ResponseEntity.ok(this.service.ObtenerTodos());
    }

}
