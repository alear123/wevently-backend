package com.wevently.wevently.UsuariosySeguridad.DTO;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class DtoNuevoUsuario {
    @NotBlank
    private String nombre;
    @NotBlank
    private String apellido;
    private String telefono;
    @NotBlank
    private String email;
    @NotBlank
    private String contrasena;
    private Date fechaNacimiento;
    @NotBlank
    private String genero;
    @NotBlank
    private String dni;
    @NotBlank
    private String rol;
    @NotBlank
    private String alias;
    private String cbu;

}
