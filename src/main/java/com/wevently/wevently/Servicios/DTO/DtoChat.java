package com.wevently.wevently.Servicios.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class DtoChat {
    private Long idChat;
    private DtoUsuario destinatario;
    private List<DtoMensaje> mensajes;
    private DtoPropuesta dtoPropuesta;

}
