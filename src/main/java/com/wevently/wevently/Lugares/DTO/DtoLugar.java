package com.wevently.wevently.Lugares.DTO;

import com.wevently.wevently.Eventos.Entities.EventoSoportado;
import com.wevently.wevently.Eventos.Entities.TipoEvento;
import com.wevently.wevently.Lugares.Entities.Caracteristica;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.Lugar;
import com.wevently.wevently.Lugares.Entities.TipoLugar;
import com.wevently.wevently.Servicios.Entities.ServicioSoportado;
import com.wevently.wevently.Servicios.Entities.TipoServicio;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class DtoLugar {
    Long id;
    String nombre;
    String direccion;
    TipoLugar tipoLugar;
    Localidad localidad;
    float precioLugar;
    double rating;
    String descripcion;
    Integer capacidad;
    String imagen;
    List<TipoServicio> servicioSoportados;
    List<Caracteristica> caracteristicas;
    List<TipoEvento> eventoSoportados;
    LocalDateTime fechaHoraBaja;


    public DtoLugar(Lugar lugar, String imagenBase64, float precio, double estrellas ) {
        this.id = lugar.getId();
        this.nombre = lugar.getNombre();
        this.direccion = lugar.getDireccion();
        this.tipoLugar = lugar.getTipoLugar();
        this.localidad = lugar.getLocalidad();
        this.precioLugar = precio;
        this.rating = estrellas;
        this.descripcion = lugar.getDescripcion();
        this.capacidad = lugar.getCapacidadPersonas();
        this.imagen = imagenBase64;
        this.fechaHoraBaja = lugar.getFechaHoraBaja();
    }
}
