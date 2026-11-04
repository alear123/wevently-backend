package com.wevently.wevently.UsuariosySeguridad.DTO;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
public class DtoPerfil {
    public int id;
    @NotBlank
    public String nombre;
    @NotBlank
    public String apellido;
    @NotNull
    @Min(1)
    @Max(31)
    public Integer dia;
    @NotNull
    @Min(1)
    @Max(12)
    public Integer mes;
    @NotBlank
    public Integer año;
    @NotBlank
    public String genero;
    @NotBlank
    public String email;
    public String username;
    public String contraseñaActual;
    public String contraseñaNueva;
    @NotBlank
    public String profileImage;
    public String alias;
    public String cbu;
}
