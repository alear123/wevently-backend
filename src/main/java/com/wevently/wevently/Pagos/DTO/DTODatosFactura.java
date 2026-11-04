package com.wevently.wevently.Pagos.DTO;

import java.math.BigDecimal;
import java.time.ZonedDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DTODatosFactura {
    private Long idReserva;
    private String externalReference;
    private String approvalUrl;
    private String idPago;

    private String paymentMethodId;
    private BigDecimal transactionAmount;
    private BigDecimal netReceivedAmount;
    private BigDecimal feeAmount;
    private ZonedDateTime dateCreated;
    private ZonedDateTime dateApproved;

    private String nombreComprador;
    private String apellidoComprador;
    private String telefonoComprador;
    private String mailComprador;
    private String cuitComprador;
    private String tipoFactura;

}
