package com.wevently.wevently.Servicios.DTO;


import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Setter
@Getter
public class DtoPropuesta {
    private Long numero;
    private String cliente;
    private String evento;
    private String fecha;
    private String servicio;
    private String descripcion;
    private String aclaraciones;
    private Float seña;
    private Float total;
    private Boolean mostrar;
    private Float comision;
}
