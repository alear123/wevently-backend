/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Controllers;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoLogin;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoNuevoUsuario;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoPerfil;
import com.wevently.wevently.UsuariosySeguridad.Entities.RecuperacionPassword;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.JwtUtil;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;
import com.wevently.wevently.UsuariosySeguridad.Services.RecuperacionPasswordService;
import com.wevently.wevently.UsuariosySeguridad.Services.UsuariosService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/seguridad/usuarios")
public class UsuariosController extends BaseController<Usuario, Long, UsuariosService> {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UsuarioDetailsService userDetailsService;

    @Autowired
    private JwtUtil jwtUtil;
    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private UsuariosService usuariosService;

    public UsuariosController(UsuariosService service) {
        super(service);
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody DtoLogin dtoLogin) {
        try {
            return ResponseEntity.ok(service.iniciarSesion(dtoLogin));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        }

    }

    // @PreAuthorize("isAuthenticated()") @tienePermisos
    @PostMapping("/registrarse")
    public ResponseEntity<?> registerUser(@RequestBody @Valid DtoNuevoUsuario dtoNuevoUsuario, BindingResult result) {
        try {
            if (usuarioRepository.existsByEmail(dtoNuevoUsuario.getEmail())) {
                return ResponseEntity
                        .badRequest()
                        .body("Error: Email ya está en uso!");
            }

            return ResponseEntity.ok(usuariosService.registrar(dtoNuevoUsuario));
        } catch (Exception e) {
            e.printStackTrace(); // Esto te dará más detalles del error
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @Autowired
    private RecuperacionPasswordService recuperacionPasswordService;
    @Autowired
    private com.wevently.wevently.UsuariosySeguridad.Services.ZohoMailService zohoMailService;

    // Solicitar código de recuperación
    // Solicitar código de recuperación
    @PostMapping("/recuperar")
    public ResponseEntity<?> solicitarRecuperacion(@RequestParam String email) {
        try {
            RecuperacionPassword rec = recuperacionPasswordService.generarCodigo(email);
            String mensajeHtml = """
                    <html>
                    <body>
                    <p>Hola,</p>
                    <p>Tu código de recuperación es: <b>%s</b></p>
                    <p>Si no solicitaste este código, ignora este mensaje.</p>
                    <p><b>Equipo Wevently</b></p>
                    </body>
                    </html>
                    """.formatted(rec.getCodigo());
            zohoMailService.enviarEmail(email, "Recuperación de contraseña", mensajeHtml);
            return ResponseEntity.ok("Si el email está registrado, se envió el código.");
        } catch (Exception e) {
            return ResponseEntity.ok("Si el email está registrado, se envió el código.");
        }
    }

    // Validar código de recuperación
    @PostMapping("/validar-codigo")
    public ResponseEntity<?> validarCodigo(@RequestParam String email, @RequestParam String codigo) {
        try {
            boolean valido = recuperacionPasswordService.validarCodigo(email, codigo);
            if (valido) {
                return ResponseEntity.ok("Código válido");
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Código inválido o expirado");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Error: " + e.getMessage());
        }
    }

    // Cambiar contraseña
    @PostMapping("/cambiar-contrasena")
    public ResponseEntity<?> cambiarContrasena(@RequestParam String email, @RequestParam String codigo,
            @RequestParam String nuevaContrasena) {
        try {
            boolean valido = recuperacionPasswordService.validarCodigo(email, codigo);
            if (!valido) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Código inválido o expirado");
            }
            usuariosService.actualizarContrasena(email, nuevaContrasena);
            recuperacionPasswordService.marcarUsado(email);
            return ResponseEntity.ok("Contraseña actualizada correctamente");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Error: " + e.getMessage());
        }
    }

    // Reenviar código
    @PostMapping("/reenviar-codigo")
    public ResponseEntity<?> reenviarCodigo(@RequestParam String email) {
        try {
            RecuperacionPassword rec = recuperacionPasswordService.generarCodigo(email);
            String mensajeHtml = """
                    <html>
                    <body>
                    <p>Hola,</p>
                    <p>Tu código de recuperación es: <b>%s</b></p>
                    <p>Si no solicitaste este código, ignora este mensaje.</p>
                    <p><b>Equipo Wevently</b></p>
                    </body>
                    </html>
                    """.formatted(rec.getCodigo());
            zohoMailService.enviarEmail(email, "Recuperación de contraseña", mensajeHtml);
            return ResponseEntity.ok("Si el email está registrado, se envió el código.");
        } catch (Exception e) {
            return ResponseEntity.ok("Si el email está registrado, se envió el código.");
        }
    }

    // Validar código de recuperación
    @PostMapping("/perfil")
    public ResponseEntity<?> actualizarPerfil(@RequestBody DtoPerfil dtoPerfil) {
        try {
            service.actualizarPerfil(dtoPerfil);
            return ResponseEntity.status(HttpStatus.OK).body("El perfil se ha actualizado correctamente");
        } catch (ErrorDeNegocio e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
        catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("No se ha podido actualizar el perfil");
        }
    }

    //@PreAuthorize("isAuthenticated()")
    //@TienePermisos
    @GetMapping("/perfil")
    public ResponseEntity<?> consultarPerfil() {
        try {
            return ResponseEntity.status(HttpStatus.OK).body( service.verPerfil());
        } catch (ErrorDeNegocio e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
        catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("No se ha podido consutar el perfil");
        }
    }

    //@PreAuthorize("isAuthenticated()")
    //@TienePermisos
    @GetMapping("/foto")
    public ResponseEntity<?> verFoto() {
        try {
            return ResponseEntity.status(HttpStatus.OK).body( service.verFoto());
        } catch (ErrorDeNegocio e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
        catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("No se ha obtener la foto de perfil");
        }
    }
}