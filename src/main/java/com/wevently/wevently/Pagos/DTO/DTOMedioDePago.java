package com.wevently.wevently.Pagos.DTO;

import lombok.Builder;
import lombok.Getter;
import java.math.BigDecimal;

@Getter
@Builder
public class DTOMedioDePago {
    private Long id;
    private String nombre;
    private Boolean esVisible;

    private String codigo;

    private String tipo;
    private String estado;

    private BigDecimal montoMax;
    private BigDecimal montoMin;

    private Integer tiempoAcreditacion;

}
