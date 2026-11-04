package com.wevently.wevently.Servicios.Entities;

import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.Eventos.Entities.Evento;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.time.LocalDateTime;
import java.util.List;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "chats")
public class Chat extends BaseEntity {
    @NotNull
    private LocalDateTime fechaHoraInicio;
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(nullable = false)
    private Usuario organizador;
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(nullable = false)
    private Usuario prestador;
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "chat_id")
    private List<Mensaje> mensajes;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "chat_id")
    private List<Propuesta> propuestas;
    @ManyToOne(cascade = CascadeType.ALL)
    private Evento evento;
    @ManyToOne(cascade = CascadeType.ALL)
    private Servicio servicio;
    @OneToOne(cascade = CascadeType.PERSIST)
    private Reserva reserva;

}
