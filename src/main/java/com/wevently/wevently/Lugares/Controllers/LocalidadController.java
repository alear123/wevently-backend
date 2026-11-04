package com.wevently.wevently.Lugares.Controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Lugares.Services.LocalidadService;
import com.wevently.wevently.Lugares.Entities.Localidad;

import java.util.Map;

@RestController
@RequestMapping("api/localidades")
public class LocalidadController extends BaseController<Localidad, Long, LocalidadService> {

    public LocalidadController(LocalidadService service) {
        super(service);
    }

    @PutMapping("/dardebaja/{id}")
    public ResponseEntity<Map<String, Object>> darDeBaja(@PathVariable Long id) {
        try {
            Map<String, Object> resultado = service.verificarYDarDeBaja(id);

            if ((boolean) resultado.get("exitoso")) {
                return ResponseEntity.status(HttpStatus.OK).body(resultado);
            } else {
                return ResponseEntity.status(HttpStatus.CONFLICT).body(resultado);
            }
        } catch (Exception e) {
            Map<String, Object> error = Map.of(
                    "exitoso", false,
                    "mensaje", "Error al dar de baja la localidad: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(error);
        }
    }

    @PutMapping("/darDeAltaAgain/{idLocalidad}")
    public ResponseEntity<?> darDeAltaAgain(@PathVariable Long idLocalidad) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(service.darDeAltaAgain(idLocalidad));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("{\"error\":\"Error, por favor intente más tarde.\"}");
        }
    }
}
