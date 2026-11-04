package com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class TipoServicioCantidad {
    private String nombreTipoServicio;
    private Long cantidad;
}
