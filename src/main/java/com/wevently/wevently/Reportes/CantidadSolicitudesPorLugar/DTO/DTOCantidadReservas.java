package com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class DTOCantidadReservas {
    private Long cantidadReservas;
    private String estadoReserva;
}
