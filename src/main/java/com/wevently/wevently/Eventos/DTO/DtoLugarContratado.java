package com.wevently.wevently.Eventos.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoLugarContratado {
    List<String> imagenes;
    String nombre;
    String direccion;
    String descripcion;
    double rating;
    Integer cantReviews;
    List<String> caracteristicas;
    String telefono;
    String email;
    Integer capacidad;
    float precio;
    String tipo;
    private Long id;
}