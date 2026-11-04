package com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTODatoGrafico {
    private Date fechaIngreso;
    private Long cantidadIngresos;
}
