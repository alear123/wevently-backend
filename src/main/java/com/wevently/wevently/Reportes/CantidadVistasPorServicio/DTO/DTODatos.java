package com.wevently.wevently.Reportes.CantidadVistasPorServicio.DTO;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTODatos {
    private Long id;
    private String nombreServicio;
    private String provincia;
    private List<DTOLocalidad> localidad;

    private List<DTODatosGrafico> datos;
    private DTORangoFechas fechas;
    private DTOCantidadContrataciones cantidadContrataciones;

}
