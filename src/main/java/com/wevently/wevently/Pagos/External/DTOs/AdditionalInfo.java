package com.wevently.wevently.Pagos.External.DTOs;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AdditionalInfo {
    @JsonProperty("ip_address")
    private String ipAddress;

    @JsonProperty("authentication_code")
    private String authenticationCode;
}
