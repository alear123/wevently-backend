package com.wevently.wevently.UsuariosySeguridad.Entities;

import com.wevently.wevently.Base.BaseEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.time.LocalDateTime;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "recuperaciones_password")
public class RecuperacionPassword extends BaseEntity {

    @ManyToOne
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    private String codigo;
    private LocalDateTime expiracion;
    private Boolean usado = false;
    private Integer intentos = 0;
    private LocalDateTime ultimoIntento;

    
}