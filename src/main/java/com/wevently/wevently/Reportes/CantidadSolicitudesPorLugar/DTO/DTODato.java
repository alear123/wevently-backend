package com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class DTODato {
    private List<DTODatosLugar> lugares;
    private DTORangoFechas fechas;
}
