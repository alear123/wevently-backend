package com.wevently.wevently.Lugares.DTO;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter

public class DtoIniciarReserva {
    private Long idEvento;
    private Long idLugar;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate fechaReserva;

}
