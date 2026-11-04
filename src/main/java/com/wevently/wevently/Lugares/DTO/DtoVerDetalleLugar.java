package com.wevently.wevently.Lugares.DTO;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.ISBN;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class DtoVerDetalleLugar {
    Long id;
    public String nombre;
    public String direccion;
    public String tipoLugar;
    public String precioLugar;
    public Integer countReviews;
    public Double rating;
    public String descripcion;
    public String propietario;
    public String capacidad;
    public List<String> imagenes;
    public List<String> tiposEventosSoportados;
    public List<String> tiposServiciosSoportados;
    public List<String> caracteristicas;
    public List<Date> reservas;
    public List<String> serviciosAdicionales;
    public List<DtoReseña> reseñas;
    public String Localidad;
    public String provincia;
}
