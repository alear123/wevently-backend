package com.wevently.wevently.Auditorias;

import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import jakarta.persistence.PrePersist;
import org.hibernate.envers.RevisionListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class CustomRevisionListener implements RevisionListener {

    @Override
    @PrePersist
    public void newRevision(Object revisionEntity) {
        Revision rev = (Revision) revisionEntity;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();

            // Verificar si el principal es un Usuario (UserDetails personalizado)
            if (principal instanceof Usuario) {
                Usuario usuario = (Usuario) principal;
                rev.setUsuario_id(usuario.getId());
                rev.setEmail(usuario.getEmail());
            }
            // Si es un String (username/email), es un usuario no completamente autenticado
            else if (principal instanceof String) {
                String username = (String) principal;
                // Durante el registro, guardamos solo el email si está disponible
                if (!"anonymousUser".equals(username)) {
                    rev.setEmail(username);
                }
            }
        }

        rev.setFechaHora(LocalDateTime.now());
    }
}