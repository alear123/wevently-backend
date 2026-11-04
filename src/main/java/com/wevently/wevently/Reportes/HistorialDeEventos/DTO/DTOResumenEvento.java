package com.wevently.wevently.Reportes.HistorialDeEventos.DTO;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTOResumenEvento {
    private String nombreEvento;
    private Long idEvento;
    private String nombreLugar;
    private String descripcionEvento;
    private LocalDate fecha;
    private LocalTime horaInicio;
    private LocalTime horaFin;
    private Integer personas;
    private BigDecimal totalGastado;
    private String estadoEvento;
    private Integer cantidadLugares;
    private Integer cantidadServicios;

}
