package com.wevently.wevently.UsuariosySeguridad.Services;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class EndpointInitializer implements CommandLineRunner {

    private final PermisoService permisoService;

    public EndpointInitializer(PermisoService permisoService) {
        this.permisoService = permisoService;
    }

    @Override
    public void run(String... args) throws Exception {
        permisoService.registrarEndpoints();
    }
}
