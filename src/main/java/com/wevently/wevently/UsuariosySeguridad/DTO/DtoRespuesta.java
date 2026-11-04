package com.wevently.wevently.UsuariosySeguridad.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class DtoRespuesta {
    private String token;
    private String pantallaInicio;
}
