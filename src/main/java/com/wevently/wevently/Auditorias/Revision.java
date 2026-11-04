package com.wevently.wevently.Auditorias;

import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.RevisionEntity;

import java.time.LocalDateTime;

@Entity
@RevisionEntity
@EqualsAndHashCode(callSuper = true)
@Getter
@Setter
@NoArgsConstructor
@EntityListeners(CustomRevisionListener.class)
public class Revision extends DefaultRevisionEntity {
    private Long usuario_id;
    private String email;
    private LocalDateTime fechaHora;
}