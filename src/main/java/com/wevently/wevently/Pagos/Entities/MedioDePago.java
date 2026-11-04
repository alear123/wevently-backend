package com.wevently.wevently.Pagos.Entities;

import com.wevently.wevently.Base.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import org.hibernate.envers.Audited;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "medios_de_pago")
public class MedioDePago extends BaseEntity {
    @NotBlank
    @Column(unique = true)
    private String nombre;
    @NotNull
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
    private LocalDateTime fechaHoraModificacion;
    @NotNull
    private Boolean esVisible;

    // sujeto a revision
    private String codigo;

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo")
    private TipoMedioPago tipo;

    @Enumerated(EnumType.STRING)
    @Column(name = "estado")
    private EstadoMedioPago estado;

    private RangoMontos rangoMontos;
    private Integer tiempoAcreditacion;
}
