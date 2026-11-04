package com.wevently.wevently.UsuariosySeguridad.Controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OAuth2Controller {

    @GetMapping("/oauth2/callback")
    public String callback(@RequestParam("code") String code) {
        // Muestra el código recibido en el navegador
        return "Código recibido: " + code;
    }
}