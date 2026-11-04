/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Entities;

import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.Entities.Evento;
import com.wevently.wevently.Imagenes.Entities.Imagen;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.Date;
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
@Table(name = "usuarios")
public class Usuario extends BaseEntity {

    @NotBlank
    private String nombre;
    @NotBlank
    private String apellido;
    private String DNI;
    private String telefono;
    @Column(unique = true)
    private String email;
    @NotBlank
    private String contrasena;
    @OneToOne(cascade = CascadeType.ALL)
    private Imagen imagen;
    @NotNull
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
    private Date fechaNacimiento;
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Genero genero;
    @NotNull
    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id")
    private List<UsuarioRol> usuarioRoles;
    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id")
    private List<Evento> eventos;
    @OneToOne(mappedBy = "usuario", cascade = CascadeType.ALL)
    private DatosBancarios datosBancarios;

    public Rol  verRolActual() throws ErrorDeNegocio{
        Rol rol = null;
        for(UsuarioRol usuarioRol : this.usuarioRoles){
            if(usuarioRol.getFechaHoraBaja() == null){
                rol = usuarioRol.getRol();
                break;
            }
        }
        if(rol != null){
            return rol;
        }
        throw new ErrorDeNegocio("El usuario no tiene un rol activo asignado");
    }

}
