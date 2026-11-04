package com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO;

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

    /*
     * tasa de ocupación (porcentaje de días con al menos una reserva confirmada,
     * calculado como (días con fechaReserva en rango y estado CONFIRMADA) / días
     * totales en rango) y ingresos dentro del rango de fechas elegido (suma de
     * precioReserva por reservas
     * confirmadas).
     */
}
