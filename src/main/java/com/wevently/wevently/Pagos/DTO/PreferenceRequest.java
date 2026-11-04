package com.wevently.wevently.Pagos.DTO;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PreferenceRequest {
    private BigDecimal amount;
    private String title;
    private String description;
    private String payerEmail;
    private String payerName;
    private String payerSurname;
    private String payerPhone;
    private String id; // este es el id del front (datosReserva) del servicio o el lugar
    private String fechaReserva;

    private String successUrl;
    private String failureUrl;
    private String pendingUrl;
}
