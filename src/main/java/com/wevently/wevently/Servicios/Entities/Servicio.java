/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Servicios.Entities;

import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.Eventos.Entities.Reseña;
import com.wevently.wevently.Imagenes.Entities.Imagen;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
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
@Table(name = "Servicios")
public class Servicio extends BaseEntity {

    @NotBlank
    private String nombre;
    @ManyToMany
    @JoinTable(
            name = "servicios_localidades",
            joinColumns = @JoinColumn(name = "servicio_id"),
            inverseJoinColumns = @JoinColumn(name = "localidad_id")
    )
    private List<Localidad> areaCobertura;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "servicio_id")
    private List<Imagen> imagenes;
    private String descripcion;
    @NotNull
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
    @ManyToOne(cascade = CascadeType.PERSIST)
    @NotNull
    private TipoServicio tipoServicio;
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    private EstadoServicio estadoServicio;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "servicio_id")
    private List<Reseña> reseñas;
    @ManyToOne(cascade = CascadeType.PERSIST)
    @NotNull
    private Usuario prestador;

}
