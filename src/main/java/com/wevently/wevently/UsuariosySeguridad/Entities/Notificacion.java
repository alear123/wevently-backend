package com.wevently.wevently.UsuariosySeguridad.Entities;

import java.time.LocalDateTime;

import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.UsuariosySeguridad.Enum.TipoNotificacion;
import com.wevently.wevently.UsuariosySeguridad.Services.Listeners.NotificationEntityListener;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import jakarta.persistence.FetchType;
import jakarta.persistence.Index;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "notificaciones", indexes = {
        @Index(name = "idx_usuario_fecha", columnList = "usuario_id, fechaHoraAlta DESC"),
        @Index(name = "idx_usuario_leida", columnList = "usuario_id, leida")
})
@EntityListeners(NotificationEntityListener.class)
public class Notificacion extends BaseEntity {

    @Enumerated(EnumType.STRING)
    private TipoNotificacion tipoNotificacion;

    @Column(nullable = false)
    private String titulo;

    @Column(length = 500)
    private String resumen;

    @Column(nullable = false)
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;

    @Column(nullable = false)
    private Boolean leida;

    private String url_referencia;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    @PrePersist
    public void prePersist() {
        if (fechaHoraAlta == null) {
            fechaHoraAlta = LocalDateTime.now();
        }
    }

    public boolean isEliminada() {
        return fechaHoraBaja != null;
    }
}
