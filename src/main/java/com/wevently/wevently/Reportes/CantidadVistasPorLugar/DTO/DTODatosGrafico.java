package com.wevently.wevently.Reportes.CantidadVistasPorLugar.DTO;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class DTODatosGrafico {
    private Date fecha;
    private Long cantidad;
}
