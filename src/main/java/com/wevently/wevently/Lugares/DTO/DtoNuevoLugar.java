package com.wevently.wevently.Lugares.DTO;

import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.TipoLugar;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DtoNuevoLugar {
    Long id;
    String nombre;
    String direccion;
    Long tipoLugarId;
    Long localidadId;
    Float precioLugar;
    String descripcion;
    Integer capacidad;
    List<String> imagenesBase64;
    List<Long> serviciosSoportadosIds;
    List<Long> eventosSoportadosIds;
    List<Long> caracteristicasId;
}
