package com.wevently.wevently.Eventos.DTO;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;

import com.wevently.wevently.Eventos.Entities.Evento;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import com.wevently.wevently.Imagenes.Services.ImagenService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoEvento {
    Long id;
    String nombre;
    String estado;
    String fecha;
    String horaInicio;
    String horaFin;
    String descripcion;
    String tipo;
    String personas;
    String imagen; // aquí guardamos Base64 ya procesada
    Integer max;

    public DtoEvento(Evento evento, String imagenBase64) {
        this.id = evento.getId();
        this.nombre = evento.getNombre();
        this.estado = evento.getEstadoEvento().getNombre();
        this.fecha = evento.getFecha().toString();
        this.horaInicio = evento.getHoraInicio().toString();
        this.horaFin = evento.getHoraFin().toString();
        this.descripcion = evento.getDescripcion();
        this.tipo = evento.getTipoEvento().getNombre();
        this.personas = evento.getPersonas().toString();
        this.imagen = imagenBase64; // Base64 ya calculada
        Reserva reserva = evento.getReservas().stream()
                .filter(r -> r.getLugar() != null)
                .filter(r -> r.getEstadoReserva().equals(EstadoReserva.COMPLETO))
                .findFirst()
                .orElse(null);

        this.max = (reserva != null) ? reserva.getLugar().getCapacidadPersonas() : 1000;
    }
}