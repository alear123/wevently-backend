package com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO;

import java.math.BigDecimal;
import java.time.LocalDate;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTODatosGraficoPlata {
    private LocalDate fecha;
    private BigDecimal cantidad;
}
