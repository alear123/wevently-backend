package com.wevently.wevently.Servicios.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class DtoMensaje {
    private String texto;
    private LocalDateTime fechaHora;
    private Boolean esEntrante;
    private Long chatId;
}
