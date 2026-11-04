package com.wevently.wevently.Reportes.CantidadVistasPorServicio.DTO;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTORangoFechas {
    private Date desde;
    private Date hasta;
}
