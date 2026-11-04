package com.wevently.wevently.UsuariosySeguridad.Controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.UsuariosySeguridad.Entities.DatosBancarios;
import com.wevently.wevently.UsuariosySeguridad.Services.DatosBancariosService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("api/datos-bancarios")
@Slf4j
public class DatosBancariosController extends BaseController<DatosBancarios, Long, DatosBancariosService> {

    public DatosBancariosController(DatosBancariosService service) {
        super(service);
    }
}
