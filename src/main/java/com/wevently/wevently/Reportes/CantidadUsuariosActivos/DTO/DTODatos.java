package com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTODatos {
    private List<DTOresumenPeriodo> resumenPeriodo;
    private List<DTODatoGrafico> datosGrafico;
    private DTORangoFechas rangoFechas;
    private DTOCantidadContrataciones contratacionesLugares;
    private DTOCantidadContrataciones contratacionesServicios;
    private List<DTOProporcionContrataciones> proporcionContrataciones;
    private List<DTOTopMedio> topMedios;
}
