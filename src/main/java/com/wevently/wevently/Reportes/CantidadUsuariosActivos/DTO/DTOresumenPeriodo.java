package com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class DTOresumenPeriodo {
    private String periodo;
    private Long valor;
    private String icono;
    private String descripcion;

}
