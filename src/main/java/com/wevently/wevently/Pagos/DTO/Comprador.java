package com.wevently.wevently.Pagos.DTO;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Comprador {
    @Email
    @JsonProperty("email")
    private String mail;

    @JsonProperty("first_name")
    private String nombre;

    @JsonProperty("last_name")
    private String apellido;

    @JsonProperty("identification")
    private IdentificacionData identificacion;
}
