package com.wevently.wevently.UsuariosySeguridad.Services.Listeners;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;

import com.wevently.wevently.UsuariosySeguridad.Entities.Notificacion;
import com.wevently.wevently.UsuariosySeguridad.Services.Events.NotificacionActualizadaEvent;
import com.wevently.wevently.UsuariosySeguridad.Services.Events.NotificacionCreadaEvent;

import jakarta.persistence.PostPersist;
import jakarta.persistence.PostUpdate;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class NotificationEntityListener {

    private static ApplicationEventPublisher eventPublisher;

    @Autowired
    public void setEventPublisher(ApplicationEventPublisher eventPublisher) {
        NotificationEntityListener.eventPublisher = eventPublisher;
    }

    @PostPersist
    public void onNotificationCreated(Notificacion notificacion) {
        log.info("Se creo una noti nueva: {}", notificacion.getId());
        if (eventPublisher != null) {
            eventPublisher.publishEvent(new NotificacionCreadaEvent(notificacion));
        }
    }

    @PostUpdate
    public void onNotificationUpdated(Notificacion notificacion) {
        log.info("notificacion modificada: {}", notificacion.getId());
        if (eventPublisher != null) {
            eventPublisher.publishEvent(new NotificacionActualizadaEvent(notificacion));
        }
    }
}
