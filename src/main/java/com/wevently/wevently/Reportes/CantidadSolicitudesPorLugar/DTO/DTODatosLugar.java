package com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTODatosLugar {
    private Long idLugar;
    private String nombreLugar;
    private List<DTOResumenPeriodo> resumen;
    private List<DTOCantidadReservas> cantidadReservas;
    private List<DTOTendenciaReseñas> tendenciaReseñas; // Datos para gráfico temporal
}
