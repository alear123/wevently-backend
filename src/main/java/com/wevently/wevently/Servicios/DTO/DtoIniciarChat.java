package com.wevently.wevently.Servicios.DTO;

import java.time.LocalDate;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class DtoIniciarChat {
    Long idServicio;
    LocalDate fechaReserva;
    Long idEvento;
}
