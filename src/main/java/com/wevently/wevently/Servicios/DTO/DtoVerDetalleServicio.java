package com.wevently.wevently.Servicios.DTO;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DtoVerDetalleServicio {
    Long id;
    String nombre;
    List<String> imagenes;
    String TipoServicio;
    Integer countReviews;
    double rating;
    String descripcion;
    String prestador;
    List<Date> fechasReservadas;
    List<DtoReseña> reseñas;
    String provincia;
    List<String> localidades;

}
