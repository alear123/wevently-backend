package com.wevently.wevently.Lugares.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class DtoReseña {
    Long id;
    public String comentario;
    public Integer rating;
    public String usuario;
}
