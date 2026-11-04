package com.wevently.wevently.Pagos.DTO;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PaymentRequest {
    @NotNull
    @JsonProperty("payment_method_id")
    private String medioPagoId;

    @NotNull
    @JsonProperty("token")
    private String token;

    @NotNull
    @Positive
    @JsonProperty("transaction_amount")
    private BigDecimal monto;

    @NotNull
    @JsonProperty("installments")
    private Integer cuotas;

    @JsonProperty("description")
    private String descripcion;

    @NotNull
    @JsonProperty("payer")
    private Comprador comprador;

    @JsonProperty("issuer_id")
    private String issuer_id;

    private String externalReference;

}
