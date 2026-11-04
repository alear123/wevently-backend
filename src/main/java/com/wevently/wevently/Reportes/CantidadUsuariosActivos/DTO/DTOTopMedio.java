package com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTOTopMedio {
    private String nombreMedio;
    private int cantidadVeces;
}
