/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Imagenes.Entities.Imagen;
import com.wevently.wevently.Imagenes.Services.ImagenService;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.Services.CantidadUsuariosActivosService;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoLogin;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoNuevoUsuario;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoPerfil;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoRespuesta;
import com.wevently.wevently.UsuariosySeguridad.Entities.*;
import com.wevently.wevently.UsuariosySeguridad.Repository.DatosBancariosRepository;
import com.wevently.wevently.UsuariosySeguridad.Repository.GeneroRepository;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRolRepository;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.JwtUtil;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;
import com.wevently.wevently.UsuariosySeguridad.Services.Listeners.LoginAttempService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.FileNotFoundException;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class UsuariosService extends BaseService<Usuario, Long, UsuarioRepository> {
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private GeneroService generoService;
    @Autowired
    private RolService rolService;
    @Autowired
    private JwtUtil jwtUtil;
    @Autowired
    private UsuarioDetailsService usuarioDetailsService;
    @Autowired
    private ImagenService imagenService;
    @Autowired
    private CantidadUsuariosActivosService cantidadUsuariosActivosService;

    @Autowired
    private LoginAttempService loginAttemptService;

    public UsuariosService(UsuarioRepository repository) {
        super(repository);
    }

    public Usuario findByEmail(String email) {
        if (repository.existsByEmail(email)) {
            return repository.findByEmail(email).get();
        }
        return null;
    }

    public DtoRespuesta registrar(DtoNuevoUsuario dto) throws Exception {

        String alias = dto.getAlias();
        if (alias == null || alias.length() < 6 || alias.length() > 20 ||
                !alias.matches("^[a-zA-Z0-9._-]+$")) {
            throw new IllegalArgumentException("Alias inválido. Debe tener entre 6 y 20 caracteres y solo puede contener letras, números, puntos, guiones o guiones bajos.");
        }

        String contrasena = dto.getContrasena();
        if (contrasena == null || contrasena.isBlank()) {
            throw new IllegalArgumentException("La contraseña no puede estar vacía.");
        }

        if (contrasena.length() < 8 || contrasena.length() > 15) {
            throw new IllegalArgumentException("La contraseña debe tener entre 8 y 15 caracteres.");
        }

        if (!contrasena.matches(".*[A-Z].*")) {
            throw new IllegalArgumentException("La contraseña debe contener al menos una letra mayúscula.");
        }

        if (!contrasena.matches(".*[a-z].*")) {
            throw new IllegalArgumentException("La contraseña debe contener al menos una letra minúscula.");
        }

        if (!contrasena.matches(".*\\d.*")) {
            throw new IllegalArgumentException("La contraseña debe contener al menos un número.");
        }

        if (!contrasena.matches(".*[!@#$%^&*()_+\\-={}:;<>.,?~].*")) {
            throw new IllegalArgumentException("La contraseña debe contener al menos un carácter especial (por ejemplo, !@#$%).");
        }

        Usuario user = new Usuario();
        user.setNombre(dto.getNombre());
        user.setApellido(dto.getApellido());
        user.setEmail(dto.getEmail());
        user.setGenero(generoService.findByNombre(dto.getGenero()));
        user.setContrasena(passwordEncoder.encode(dto.getContrasena()));
        user.setFechaNacimiento(dto.getFechaNacimiento());
        user.setTelefono((dto.getTelefono()));
        user.setFechaHoraAlta(LocalDateTime.now());
        user.setDNI(dto.getDni());

        UsuarioRol usuarioRol = new UsuarioRol();
        usuarioRol.setFechaHoraAlta(LocalDateTime.now());
        usuarioRol.setRol(rolService.findByNombre(dto.getRol()));
        user.setUsuarioRoles(new ArrayList<>());
        user.getUsuarioRoles().add(usuarioRol);

        DatosBancarios datosBancarios = new DatosBancarios();
        datosBancarios.setAlias(passwordEncoder.encode(dto.getAlias()));
        datosBancarios.setCBUCVU(passwordEncoder.encode(dto.getCbu()));
        datosBancarios.setAlias(dto.getAlias());
        datosBancarios.setCBUCVU(dto.getCbu());
        datosBancarios.setFechaHoraAlta(LocalDateTime.now());
        datosBancarios.setUsuario(user);
        user.setDatosBancarios(datosBancarios);

        save(user);
        Rol currentRol = getCurrentRol(user);

        cantidadUsuariosActivosService.registrarIngresoUsuario(user);
        return new DtoRespuesta(jwtUtil.generateToken(user.getEmail(), currentRol.getNombre()),
                currentRol.getPantallaInicio());

    }

    public DtoRespuesta iniciarSesion(DtoLogin dtoLogin) throws Exception {

        String email = dtoLogin.getEmail();

        if (loginAttemptService.estaBloqueado(email)) {
            throw new ErrorDeNegocio("Demasiados intentos fallidos. Espera 1 minuto antes de intentar nuevamente.");
        }

        Optional<Usuario> optionalUsuario = repository.findByEmail(email);
        if (optionalUsuario.isEmpty()) {
            throw new UsernameNotFoundException("Error: No existe un usuario registrado con este email");
        }

        Usuario usuario = optionalUsuario.get();

        if (!passwordEncoder.matches(dtoLogin.getContrasena(), usuario.getContrasena())) {
            loginAttemptService.loginFallido(email);
            throw new BadCredentialsException("Error: Contraseña incorrecta");
        }

        // Si llegó hasta acá, la autenticación fue correcta
        loginAttemptService.loginExitoso(email);

        Rol currentRol = getCurrentRol(usuario);
        cantidadUsuariosActivosService.registrarIngresoUsuario(usuario);

        if (!currentRol.isActivo()) {
            throw new ErrorDeNegocio("El rol se encuentra temporalmente inactivo");
        }

        return new DtoRespuesta(
                jwtUtil.generateToken(usuario.getEmail(), currentRol.getNombre()),
                currentRol.getPantallaInicio()
        );
    }

    public Rol getCurrentRol(Usuario usuario) throws Exception {
        for (UsuarioRol usuarioRol : usuario.getUsuarioRoles()) {
            if (usuarioRol.getFechaHoraBaja() == null) {
                return usuarioRol.getRol();

            }
        }
        throw new Exception("Error: El usuario " + usuario.getNombre() + " " + usuario.getApellido()
                + " no tiene ningun rol activo asignado");

    }

    public void actualizarContrasena(String email, String nuevaContrasena) throws Exception {
        Usuario usuario = repository.findByEmail(email)
                .orElseThrow(() -> new Exception("Usuario no encontrado"));
        usuario.setContrasena(passwordEncoder.encode(nuevaContrasena));
        repository.save(usuario);
    }

    public void actualizarPerfil(DtoPerfil dtoPerfil) throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();

        if (dtoPerfil.getNombre() != usuario.getNombre()) {
            usuario.setNombre(dtoPerfil.nombre);
        }

        if (dtoPerfil.apellido != usuario.getApellido()) {
            usuario.setApellido(dtoPerfil.apellido);
        }

        if (dtoPerfil.dia != usuario.getFechaNacimiento().getDate()) {
            Date fecha = usuario.getFechaNacimiento();
            fecha.setDate(dtoPerfil.dia);
            usuario.setFechaNacimiento(fecha);
        }

        if (dtoPerfil.mes != usuario.getFechaNacimiento().getMonth()) {
            Date fecha = usuario.getFechaNacimiento();
            fecha.setMonth(dtoPerfil.mes);
            usuario.setFechaNacimiento(fecha);
        }

        if (dtoPerfil.año != usuario.getFechaNacimiento().getYear()) {
            Date fecha = usuario.getFechaNacimiento();
            fecha.setYear(dtoPerfil.año);
            usuario.setFechaNacimiento(fecha);
        }

        if (dtoPerfil.genero != usuario.getGenero().getNombre()) {

            Genero genero = generoService.findByNombre(dtoPerfil.genero);
            if (genero != null) {
                usuario.setGenero(genero);

            }

        }

        if (dtoPerfil.email != usuario.getEmail()) {
            usuario.setEmail(dtoPerfil.email);
        }

        if (dtoPerfil.profileImage != null) {
            String path = imagenService.guardar(dtoPerfil.profileImage, Math.toIntExact(usuario.getId()));
            Imagen imagen = new Imagen(path);
            usuario.setImagen(imagen);
        }

        if (dtoPerfil.contraseñaActual != null && dtoPerfil.contraseñaActual != "") {
            if (passwordEncoder.matches(dtoPerfil.contraseñaActual, usuario.getContrasena())) {
                if (!passwordEncoder.matches(dtoPerfil.contraseñaNueva, usuario.getContrasena())) {
                    usuario.setContrasena(passwordEncoder.encode(dtoPerfil.contraseñaNueva));
                }
            } else {
                throw new ErrorDeNegocio("La contraseña no coincide con la actual");
            }
        }

        if (dtoPerfil.alias != "") {
                if (dtoPerfil.cbu == "" || dtoPerfil.cbu.matches("\\d+")) {
                    if (dtoPerfil.cbu == "" ||  dtoPerfil.cbu.length() == 22) {
                        if (usuario.getDatosBancarios() == null) {
                            usuario.setDatosBancarios(
                                    new DatosBancarios(dtoPerfil.cbu, dtoPerfil.alias, LocalDateTime.now(), null, usuario));
                        } else {
                            usuario.getDatosBancarios().setAlias(dtoPerfil.alias);
                            usuario.getDatosBancarios().setCBUCVU(dtoPerfil.cbu);
                        }
                    } else {
                        throw new ErrorDeNegocio("El CBU debe contener 22 digitos");
                    }
                } else {
                    throw new ErrorDeNegocio("El CBU solo debe contener digitos numericos");
                }

        } else {
            throw new ErrorDeNegocio("El alias no puede quedar vacio");
        }

        repository.save(usuario);

    }

    public DtoPerfil verPerfil() throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();
        String imagen = "";

        if (usuario.getImagen() != null && usuario.getImagen().getFilePath() != null
                && usuario.getImagen().getFilePath() != "") {
            imagen = imagenService.buscar(usuario.getImagen().getFilePath());
        }

        return DtoPerfil.builder()
                .id(Math.toIntExact(usuario.getId()))
                .nombre(usuario.getNombre())
                .apellido(usuario.getApellido())
                .dia(usuario.getFechaNacimiento().getDate())
                .mes(usuario.getFechaNacimiento().getMonth())
                .año(usuario.getFechaNacimiento().getYear())
                .email(usuario.getEmail())
                .genero(usuario.getGenero().getNombre())
                .profileImage(imagen)
                .alias(usuario.getDatosBancarios() != null ? usuario.getDatosBancarios().getAlias() : "")
                .cbu(usuario.getDatosBancarios() != null ? usuario.getDatosBancarios().getCBUCVU() : "")
                .build();

    }

    public String verFoto() throws Exception {
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();
            String imagen64 = "";
            if (usuario.getImagen() != null) {
                imagen64 = imagenService.buscar(usuario.getImagen().getFilePath());
                return imagen64;
            }
            throw new ErrorDeNegocio("No tiene una imagen de perfil guardada");
        }

        catch(FileNotFoundException e){
            throw new ErrorDeNegocio("No se ha encontrado la imagen de perfil");
        }

        catch(EntityNotFoundException e ){
            throw new ErrorDeNegocio("No se ha encontrado el usuario");
        }


    }
}