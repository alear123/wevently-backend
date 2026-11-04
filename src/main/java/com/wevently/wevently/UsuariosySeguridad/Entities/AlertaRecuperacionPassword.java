package com.wevently.wevently.UsuariosySeguridad.Entities;

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
@Table(name = "Alerta_Recuperacion_Password")
public class AlertaRecuperacionPassword {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "recuperacion_password_id", nullable = false)
    private RecuperacionPassword recuperacionPassword;

    @Column(nullable = false)
    private LocalDateTime fechaHora;
}