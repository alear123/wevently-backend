package com.wevently.wevently.Servicios.Entities;

import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.Eventos.Entities.Evento;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
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
@Table(name = "propuestas")
public class Propuesta extends BaseEntity {
    @NotNull
    private Float presupuestoTotal;
    @NotNull
    private Float seña;
    @NotBlank
    private String descripcion;
    @NotNull
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
}
