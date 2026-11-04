package com.wevently.wevently.Eventos.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoReservaLugar {

    Long id;
    String nombreEvento;
    String nombreLugar;
    String nombreTipoEvento;
    String nombreTipoLugar;
    String estadoReserva;
    Double precioReserva;
    Date fechaReserva;
    int capacidad;
    String imagen;

}
