package com.wevently.wevently.Pagos.External.DTOs;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PaymentResponse {

    private Long id;

    private String status;

    @JsonProperty("status_detail")
    private String statusDetail;

    @JsonProperty("payment_type_id")
    private String paymentTypeId;

    @JsonProperty("payment_method_id")
    private String paymentMethodId;

    @JsonProperty("transaction_amount")
    private BigDecimal transactionAmount;

    @JsonProperty("currency_id")
    private String currencyId;

    @JsonProperty("date_created")
    private String dateCreated; // mercadoPago envia como String ISO la fecha

    @JsonProperty("date_approved")
    private String dateApproved;

    @JsonProperty("external_reference")
    private String externalReference;

    private String description;

    @JsonProperty("installments")
    private Integer installments;

    @JsonProperty("issuer_id")
    private String issuerId;

    // para los pagos con redirect (no aplica para tarjetas)
    @JsonProperty("init_point")
    private String initPoint;

    // info del q pone la tarasca
    private PayerResponse payer;

    @JsonProperty("transaction_details")
    private TransactionDetails transactionDetails;

    // comisiones ☠️
    @JsonProperty("fee_details")
    private List<FeeDetail> feeDetails;

    @JsonProperty("additional_info")
    private AdditionalInfo additionalInfo;
}
