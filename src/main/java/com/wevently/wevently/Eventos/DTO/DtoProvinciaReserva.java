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
public class DtoProvinciaReserva {
    Long idProvincia;
    String nombre;
    List<DtoLocalidadReserva> localidades;

}
