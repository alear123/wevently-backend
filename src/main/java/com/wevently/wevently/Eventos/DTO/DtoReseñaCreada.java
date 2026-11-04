package com.wevently.wevently.Eventos.DTO;

import java.time.LocalDateTime;

import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;

import jakarta.persistence.CascadeType;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DtoReseñaCreada {
    Integer estrellas;
    String descripcion;
    String tipo;
    Long id;
    Long idEvento;
}
