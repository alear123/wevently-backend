package com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DTOTendenciaReseñas {
    private LocalDate fecha;
    private Double promedioEstrellas; // Promedio de estrellas en ese día/período
    private Integer cantidadReseñas; // Cantidad de reseñas en ese día/período
}
