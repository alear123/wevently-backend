package com.wevently.wevently.Servicios.DTO;

import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.Servicios.Entities.TipoServicio;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DtoServicio {
    Long id;
    String nombre;
    TipoServicio tipoServicio;
    double rating;
    String descripcion;
    String imagen;
    List<Localidad> areaCobertura;
    LocalDateTime fechaHoraBaja;

    public DtoServicio(Servicio servicio, String imagenBase64, double estrellas ) {
        this.id = servicio.getId();
        this.nombre = servicio.getNombre();
        this.rating = estrellas;
        this.descripcion = servicio.getDescripcion();
        this.setTipoServicio(servicio.getTipoServicio());
        this.imagen = imagenBase64;
        this.setAreaCobertura(servicio.getAreaCobertura());
        this.fechaHoraBaja = servicio.getFechaHoraBaja();
    }
}
