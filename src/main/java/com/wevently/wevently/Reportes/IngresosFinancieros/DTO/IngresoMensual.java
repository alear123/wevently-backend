package com.wevently.wevently.Reportes.IngresosFinancieros.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class IngresoMensual {

    public int año;
    public int mes;
    public double ingresos;
}
