package com.wevently.wevently.Pagos.External.DTOs;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PaymentMethodResponse {

    @JsonProperty("id")
    private String id;

    @JsonProperty("name")
    private String name;

    @JsonProperty("payment_type_id")
    private String paymentTypeId;

    @JsonProperty("status")
    private String status;

    @JsonProperty("thumbnail")
    private String thumbnail;

    @JsonProperty("min_allowed_amount")
    private Integer MinAllowedAmount;

    @JsonProperty("max_allowed_amount")
    private Integer MaxAllowedAmount;

    @JsonProperty("accreditation_time")
    private Integer accreditationTime;

}
