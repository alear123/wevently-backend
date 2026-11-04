package com.wevently.wevently.Eventos.DTO;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoServicioContratado {
    Long id;
    String nombre;
    String descripcion;
    String estado;
    String tipo;
    double precio;
    Integer cantidadResenas;
    double puntuacion;
    LocalDate fechaContratacion;
    Integer duracion;
    String proveedor;
    Long idChat;
}