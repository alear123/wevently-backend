package com.wevently.wevently.Eventos.Controllers;

import com.wevently.wevently.Eventos.DTO.*;
import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.Services.ReservaService;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;

import lombok.extern.slf4j.Slf4j;

import com.wevently.wevently.Eventos.Entities.Reserva;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("api/reservas")
@Slf4j
public class ReservaController extends BaseController<Reserva, Long, ReservaService> {

    // @Autowired
    // private PagosService pagosService;

    @Autowired
    private UsuarioDetailsService usuarioDetailsService;

    public ReservaController(ReservaService service) {
        super(service);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/confirmar-reserva")
    public ResponseEntity<Void> confirmarReserva(@RequestBody ConfirmarReservaDTO entity) {
        log.info("estoy por entrar a setear el external reference y terminar la reserva");
        try {
            service.terminarReserva(entity);
            return ResponseEntity.ok().build();
        } catch (ErrorDeNegocio ex) {
            log.error("Error de negocio al confirmar reserva: {}", ex.getMessage());
            return ResponseEntity.badRequest().build();
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/datosFormularioReserva/{idReserva}")
    public ResponseEntity<DtoFormularioReserva> datosFormularioReserva(@PathVariable Long idReserva) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            return ResponseEntity.ok(service.datosFormularioReserva(idReserva, usuario));
        } catch (Exception e) {
            e.printStackTrace(); // Esto imprimirá la causa real en consola
            return ResponseEntity.status(500).body(null);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/reservaAPagar")
    public ResponseEntity<DtoReservaApagar> reservaAPagar(@RequestBody DtoFormularioLlenoReserva dto) {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            return ResponseEntity.ok(service.reservaAPagar(dto, usuario));
        } catch (Exception e) {
            e.printStackTrace(); // Esto imprimirá la causa real en consola
            return ResponseEntity.status(500).body(null);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/mis-reservas-lugar")
    public ResponseEntity<?> getMisReservasLugar() {
        try {
            // Obtener el usuario autenticado a partir del token
            Usuario usuario = usuarioDetailsService.getCurrentUser();

            // Buscar reservas según el email del usuario autenticado
            List<DtoReservaLugar> reservas = service.getMisReservasLugares(usuario.getEmail());

            return ResponseEntity.ok(reservas);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", e.getMessage()));
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/estados-reserva")
    public List<String> getEstadosReserva() {
        // Devuelve los nombres de los valores del enum
        return Arrays.stream(EstadoReserva.values())
                .map(Enum::name)
                .toList();
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/mis-reservas-servicio")
    public ResponseEntity<?> getMisReservasServicio() {
        try {
            // Obtener el usuario autenticado a partir del token
            Usuario usuario = usuarioDetailsService.getCurrentUser();

            // Buscar reservas según el email del usuario autenticado
            List<DtoReservaServicio> reservas = service.getMisReservasServicios(usuario.getEmail());

            return ResponseEntity.ok(reservas);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", e.getMessage()));
        }
    }
}
