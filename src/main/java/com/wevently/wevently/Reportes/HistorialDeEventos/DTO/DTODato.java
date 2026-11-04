package com.wevently.wevently.Reportes.HistorialDeEventos.DTO;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTODato {
    private DTORangoFechas fechas;
    private List<DTOResumenPeriodo> resumen;
    private List<DTOResumenEvento> eventos;
}
