package com.wevently.wevently.Reportes.CantidadVistasPorLugar.DTO;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTODatos {
    private Long idLugar;
    private String nombreLugar;
    private String provincia;
    private String localidad;

    private DTORangoFechas rangoFechas;

    private List<DTODatosGrafico> datos;
    private DTOCantidadContrataciones cantidadContrataciones;
}
