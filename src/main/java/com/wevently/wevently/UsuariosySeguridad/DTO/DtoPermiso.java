package com.wevently.wevently.UsuariosySeguridad.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class DtoPermiso {
    public String ruta;
    public String metodoHttp;
    public String descripcion;
}
