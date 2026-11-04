package com.wevently.wevently.UsuariosySeguridad.Controllers;

import com.wevently.wevently.UsuariosySeguridad.Entities.RecuperacionPassword;
import com.wevently.wevently.UsuariosySeguridad.Services.ZohoMailService;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/mail")
public class ZohoMailTestController {

    private final ZohoMailService zohoMailService;

    public ZohoMailTestController(ZohoMailService zohoMailService) {
        this.zohoMailService = zohoMailService;
    }

    @PostMapping("/test")
    public String enviarTest(@RequestParam String destinatario) {
        if (!destinatario.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
            return "Error: Email inválido";
        }
        try {
            zohoMailService.enviarEmail(destinatario, "Prueba Zoho Mail", "Este es un correo de prueba desde Wevently.");
            return "Correo enviado correctamente a " + destinatario;
        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }

}
