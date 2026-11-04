package com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO;

import java.math.BigDecimal;
import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTOCantidadContrataciones {
    private int cantidadContrataciones;
    private BigDecimal dineroGanado;
    private List<DTODatosGraficoPlata> comisionesDiarias;
}
