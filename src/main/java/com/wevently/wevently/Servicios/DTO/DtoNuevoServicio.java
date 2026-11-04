package com.wevently.wevently.Servicios.DTO;

import com.wevently.wevently.Imagenes.Entities.Imagen;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Servicios.Entities.TipoServicio;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DtoNuevoServicio {
    private Long id;
    private String nombre;
    private String descripcion;
    private Long tipoServicioId;
    private List<Long> areaCoberturaIds;
    private List<String> imagenesBase64;
}
