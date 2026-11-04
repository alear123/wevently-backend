package com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class DTORangoFechas {
    private Date desde;
    private Date hasta;
}
