package com.wevently.wevently.Servicios.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoReseña {
    Long id;
    String comentario;
    Integer rating;
    String usuario;
}
