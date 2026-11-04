package com.wevently.wevently.Eventos.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor

public class DtoReservaServicio {

    Long id;
    String nombreEvento;
    String nombreServicio;
    String nombreTipoEvento;
    String nombreTipoServicio;
    String estadoReserva;
    Double precioReserva;
    Date fechaReserva;
    String imagen;
    Long idChat;
}
