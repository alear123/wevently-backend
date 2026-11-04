package com.wevently.wevently.UsuariosySeguridad.Services.Events;

import org.springframework.context.ApplicationEvent;

import com.wevently.wevently.UsuariosySeguridad.Entities.Notificacion;

import lombok.Getter;

@Getter
public class NotificacionActualizadaEvent extends ApplicationEvent {
    private final Notificacion notificacion;

    public NotificacionActualizadaEvent(Notificacion notificacion) {
        super(notificacion);
        this.notificacion = notificacion;
    }
}
