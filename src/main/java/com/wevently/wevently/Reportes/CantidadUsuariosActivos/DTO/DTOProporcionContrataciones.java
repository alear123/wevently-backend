package com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTOProporcionContrataciones {
    private String tipo; // "LUGAR" o "SERVICIO"
    private int cantidad; // cantidad absoluta
    private double porcentaje; // 0..100
}
