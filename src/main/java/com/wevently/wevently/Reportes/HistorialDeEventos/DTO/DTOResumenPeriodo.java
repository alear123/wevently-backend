package com.wevently.wevently.Reportes.HistorialDeEventos.DTO;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTOResumenPeriodo {
    private String periodo;
    private String valor;
    private String icono;
    private String descripcion;
}
