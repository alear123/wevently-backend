package com.wevently.wevently.Eventos.DTO;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DtoReservaApagar {
    String nombre; // 'Empresa Catering Premium S.A.',
    Long idReserva; // 12,
    Long id; // 1,
    String descripcion; // 'Servicio completo de catering para evento corporativo',
    String nombreComprador;// 'Maria',
    String apellidoComprador;// 'Becerra',
    String telefonoComprador;// '2634789002',
    String emailComprador;// 'e@gmail.com',
    Date fechaReserva;// '16/09/2025',
    Double reseniaGeneral;// '4,7',
    Integer cantidadResenia;// '25 reseñas',
    String CUIT;// '20-475676345-4',
    String tipoFactura;// 'A'
    double monto;
}
