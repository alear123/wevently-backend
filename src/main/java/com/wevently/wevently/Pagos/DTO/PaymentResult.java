package com.wevently.wevently.Pagos.DTO;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.wevently.wevently.Pagos.Entities.PaymentStatus;

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
public class PaymentResult {
    private String id;
    private PaymentStatus status;
    private String externalReference;
    private String approvalUrl;
    private String errorMessage;

    @JsonProperty("transaction_amount")
    private BigDecimal transactionAmount;

    @JsonProperty("payment_method_id")
    private String paymentMethodId;

    @JsonProperty("currency_id")
    private String currencyId;

    @JsonProperty("date_created")
    private String dateCreated;

    @JsonProperty("date_approved")
    private String dateApproved;

    @JsonProperty("status_detail")
    private String statusDetail;

    private String description;

    private Integer installments;

    @JsonProperty("net_received_amount")
    private BigDecimal netReceivedAmount;

    @JsonProperty("fee_amount")
    private BigDecimal feeAmount; // comision del 4.1% explicado en el front, componente "Pagar.jsx"

    @JsonProperty("payer_email")
    private String payerEmail;

    @JsonProperty("payer_name")
    private String payerName;

    public static PaymentResult exito(String id, String approvalUrl) {
        PaymentResult resultado = new PaymentResult();
        resultado.id = id;
        resultado.status = PaymentStatus.PENDING;
        resultado.approvalUrl = approvalUrl;
        return resultado;
    }

    public static PaymentResult error(String message) {
        PaymentResult result = new PaymentResult();
        result.status = PaymentStatus.ERROR;
        result.errorMessage = message;
        return result;
    }

    public static PaymentResult exitoCompleto(String id, PaymentStatus status, BigDecimal amount,
            String paymentMethod, String dateCreated, String payerEmail) {
        return PaymentResult.builder()
                .id(id)
                .status(status)
                .transactionAmount(amount)
                .paymentMethodId(paymentMethod)
                .dateCreated(dateCreated)
                .payerEmail(payerEmail)
                .build();
    }
}
