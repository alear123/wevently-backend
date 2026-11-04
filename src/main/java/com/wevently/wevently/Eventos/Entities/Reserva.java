package com.wevently.wevently.Eventos.Entities;

import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import com.wevently.wevently.Eventos.Enum.TipoFactura;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.Lugar;
import com.wevently.wevently.Pagos.Entities.BaseFacturaEntity;
import com.wevently.wevently.Pagos.Entities.MedioDePago;
import com.wevently.wevently.Servicios.Entities.Propuesta;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.time.LocalDateTime;
import java.util.Date;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "reservas")
public class Reserva extends BaseEntity {
    private Date fechaReserva;
    private Double precioReserva;
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
    @Enumerated(EnumType.STRING)
    private TipoFactura tipoFactura;
    private LocalDateTime fechaHoraPago;
    private String nombre;
    private String apellido;
    private String telefono;
    private String email;
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Lugar lugar;
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Servicio servicio;
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Usuario organizador;
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Usuario prestador;
    @OneToOne(cascade = CascadeType.PERSIST)
    private Propuesta propuesta;
    @ManyToOne(cascade = CascadeType.PERSIST)
    private MedioDePago medioDePago;
    @NotNull
    @Enumerated(EnumType.STRING)
    private EstadoReserva estadoReserva;
    private String idPago;
    @OneToOne(cascade = CascadeType.PERSIST)
    private BaseFacturaEntity factura; // yo aca o seteo el tipo FacturaA o el tipo FacturaB
    // la navegabilidad seria de Reserva 1 ---> 0..1 Factura
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Localidad localidad;
    private String cuit;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "evento_id")
    private Evento evento;
}
