package com.wevently.wevently.Lugares.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class DtoProvincia {
    Long id;
    String nombre;
    List<DtoLocalidad> dtosLocalidad;
}
