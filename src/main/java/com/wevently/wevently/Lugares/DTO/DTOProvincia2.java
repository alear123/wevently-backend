package com.wevently.wevently.Lugares.DTO;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTOProvincia2 {
    private Long id;
    private String nombre;
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;

}
