package com.wevently.wevently.Servicios.DTO;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DTOEstadoServicio {
    private Long idEstadoServicio;
    private String nombreEstado;
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
}
