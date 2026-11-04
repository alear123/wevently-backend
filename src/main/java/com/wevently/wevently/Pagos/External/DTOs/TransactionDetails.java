package com.wevently.wevently.Pagos.External.DTOs;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TransactionDetails {
    @JsonProperty("net_received_amount")
    private BigDecimal netReceivedAmount;

    @JsonProperty("total_paid_amount")
    private BigDecimal totalPaidAmount;

    @JsonProperty("installment_amount")
    private BigDecimal installmentAmount;
}