package com.wevently.wevently.Pagos.External.DTOs;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CreatePaymentRequest {

    @JsonProperty("token")
    private String token;

    @JsonProperty("transaction_amount")
    private BigDecimal transactionAmount;

    @JsonProperty("description")
    private String description;

    @JsonProperty("payment_method_id")
    private String paymentMethodId;

    @JsonProperty("installments")
    private Integer installments;
    private Payer payer;

    @JsonProperty("external_reference")
    private String externalReference;

    @JsonProperty("issuer_id")
    private String issuerId;

    @JsonProperty("notification_url")
    private String notificationUrl;
}
