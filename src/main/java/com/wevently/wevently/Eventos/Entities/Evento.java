package com.wevently.wevently.Eventos.Entities;

import com.wevently.wevently.Base.BaseEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "eventos")
public class Evento extends BaseEntity {
    @NotBlank
    private String nombre;
    private String descripcion;
    @NotNull
    private LocalDate fecha;
    @NotNull
    private LocalTime horaInicio;
    @NotNull
    private LocalTime horaFin;
    @NotNull
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    TipoEvento tipoEvento;
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    EstadoEvento estadoEvento;
    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinColumn(name = "evento_id")
    private List<Reserva> reservas;
    @NotNull
    private Integer personas;

}
