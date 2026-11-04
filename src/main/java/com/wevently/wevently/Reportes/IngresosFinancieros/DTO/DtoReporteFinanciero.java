package com.wevently.wevently.Reportes.IngresosFinancieros.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class DtoReporteFinanciero {
    Double total;
    List<IngresoMensual> ingresosMensuales;
    List<DistribucionPorTipoEvento> distribucionTipoEvento = new ArrayList<>();
    List<DistribucionPorFecha> distribucionPorFecha = new ArrayList<>();

    @AllArgsConstructor
    @NoArgsConstructor
    @Setter
    @Getter
    public static class DistribucionPorTipoEvento{
        String tipo;
        Double cantidad;
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Setter
    @Getter
    public static class DistribucionPorFecha{
        String fecha;
        Double cantidad;
    }

}


