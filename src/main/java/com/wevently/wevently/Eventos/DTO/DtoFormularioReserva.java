package com.wevently.wevently.Eventos.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DtoFormularioReserva {
    String tipo; // lugar || servicio
    String descripcion; // lugar: ubicacion || servicio:descripcion
    String nombre; // de lugar o servicio
    Double rating;
    Integer cantReviews;
    DtoProvinciaReserva provincia;
}
