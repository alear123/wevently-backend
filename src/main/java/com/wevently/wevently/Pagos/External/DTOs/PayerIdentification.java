package com.wevently.wevently.Pagos.External.DTOs;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PayerIdentification {
    @NotNull
    private String type;

    @NotNull
    private String number;

}
