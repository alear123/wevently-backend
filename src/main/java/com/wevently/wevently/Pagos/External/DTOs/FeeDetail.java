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
public class FeeDetail {
    private String type;
    private BigDecimal amount;

    @JsonProperty("fee_payer")
    private String feePayer;
}