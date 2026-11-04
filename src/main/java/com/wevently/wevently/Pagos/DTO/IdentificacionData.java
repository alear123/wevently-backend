package com.wevently.wevently.Pagos.DTO;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class IdentificacionData {
    @JsonProperty("type")
    private String type; // esto viene de MercadoPago.js -> DNI, CI, etc.

    @JsonProperty("number")
    private String number;
}
