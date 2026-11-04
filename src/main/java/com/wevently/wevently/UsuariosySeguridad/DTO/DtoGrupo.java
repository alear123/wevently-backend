package com.wevently.wevently.UsuariosySeguridad.DTO;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class DtoGrupo {
    public String nombre;
    public String descripcion;
    public List<Long> permisos;
}
