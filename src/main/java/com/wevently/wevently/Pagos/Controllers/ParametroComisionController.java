package com.wevently.wevently.Pagos.Controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Pagos.Entities.ParametroComision;
import com.wevently.wevently.Pagos.Services.ParametroComisionService;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("api/parametro-comision")
public class ParametroComisionController extends BaseController<ParametroComision, Long, ParametroComisionService> {

    public ParametroComisionController(ParametroComisionService service) {
        super(service);
    }

    @GetMapping("/vigente")
    public ResponseEntity<ParametroComision> obtenerComisionVigente() throws ErrorDeNegocio {
        return ResponseEntity.ok().body(service.obtenerParametroComisionVigente());
    }

}
