package com.wevently.wevently.Eventos.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class DtoFormularioLlenoReserva {
    Long idReserva;
    Long id;
    String nombreComprador;
    String apellidoComprador;
    String emailComprador;
    String telefonoComprador;
    String tipoFactura;
    String provincia;
    String localidad;
    String cuit;

}
