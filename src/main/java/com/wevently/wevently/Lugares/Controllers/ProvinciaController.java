package com.wevently.wevently.Lugares.Controllers;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import com.wevently.wevently.Lugares.DTO.DTOProvincia2;
import com.wevently.wevently.Lugares.Entities.Provincia;
import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Lugares.Services.ProvinciaService;
import org.springframework.http.ResponseEntity;

import java.util.Map;

@RestController
@RequestMapping("api/provincias")
public class ProvinciaController extends BaseController<Provincia, Long, ProvinciaService> {

    public ProvinciaController(ProvinciaService service) {
        super(service);
    }

    @GetMapping("/TODAS")
    public ResponseEntity<?> obtenerTODAS() {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(service.findAll());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("{\"error\":\"Error, por favor intente más tarde.\"}");
        }
    }

    @PutMapping("{idProvincia}/localidad/{idLocalidad}")
    public ResponseEntity<Provincia> setearLocalidad(@PathVariable Long idProvincia, @PathVariable Long idLocalidad) {
        Provincia provinciaActualizada = service.setearLocalidad(idProvincia, idLocalidad);

        return ResponseEntity.ok(provinciaActualizada);
    }

    @CrossOrigin(origins = "http://localhost:5173")
    @GetMapping("/obtenerDtosProvincia")
    public ResponseEntity<?> getDtosProvincia() {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(service.getDtosProvincia());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("{\"error\":\"Error, por favor intente más tarde.\"}");
        }
    }

    @DeleteMapping("/dardebaja/{id}")
    public ResponseEntity<Map<String, Object>> darDeBaja(@PathVariable Long id) {
        try {
            Map<String, Object> resultado = service.verificarYDarDeBaja(id);

            boolean exitoso = (boolean) resultado.get("exitoso");

            if (exitoso) {
                return ResponseEntity.status(HttpStatus.OK).body(resultado);
            } else {
                return ResponseEntity.status(HttpStatus.CONFLICT).body(resultado);
            }
        } catch (Exception e) {
            Map<String, Object> error = Map.of(
                    "exitoso", false,
                    "mensaje", "Error al procesar la solicitud: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(error);
        }
    }

    @PutMapping("darDeAltaAgain/{idProvincia}")
    public ResponseEntity<?> darDeAltaAgain(@PathVariable Long idProvincia) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(service.darDeAltaAgain(idProvincia));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("{\"error\":\"Error, por favor intente más tarde.\"}");
        }
    }

    @PutMapping("actualizar/{idProvincia}")
    public ResponseEntity<?> actualizarProvincia(@PathVariable Long idProvincia, @RequestBody DTOProvincia2 provincia) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(service.actualizarProvincia(idProvincia, provincia));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("{\"error\":\"Error, por favor intente más tarde.\"}");
        }
    }
}
