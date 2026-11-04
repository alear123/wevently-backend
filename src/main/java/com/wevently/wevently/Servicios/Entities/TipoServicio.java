/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Servicios.Entities;

import com.wevently.wevently.Base.BaseEntity;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tipos_de_servicios")
public class TipoServicio extends BaseEntity {
    @NotBlank
    private String nombre;
    @NotNull
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
    
}
