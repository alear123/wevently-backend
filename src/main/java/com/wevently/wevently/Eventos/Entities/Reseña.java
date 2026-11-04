/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Eventos.Entities;

import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
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
public class Reseña extends BaseEntity {
    private String descripcion;
    @NotNull
    private int estrellas;
    @NotNull
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
    private LocalDateTime fechaHoraModificacion;
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Usuario usuario;
}
