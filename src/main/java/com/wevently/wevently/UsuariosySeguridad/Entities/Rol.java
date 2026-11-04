package com.wevently.wevently.UsuariosySeguridad.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.wevently.wevently.Base.BaseEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.time.LocalDateTime;
import java.util.List;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "roles")
public class Rol extends BaseEntity {
    @Column(nullable = false, unique = true)
    private String nombre;

    private String descripcion;

    @NotBlank
    private String pantallaInicio;

    @NotNull
    private LocalDateTime fechaHoraAlta;

    private LocalDateTime fechaHoraBaja;

    private boolean activo;

    private boolean tienePrivilegios;

    @ManyToMany(cascade = CascadeType.PERSIST)
    @JoinTable(name = "rol_grupo", joinColumns = @JoinColumn(name = "rol_id"), inverseJoinColumns = @JoinColumn(name = "grupo_id"))
    @JsonManagedReference
    private List<Grupo> grupos;

    @JsonIgnore
    @OneToMany(mappedBy = "rol")
    private List<UsuarioRol> usuarioRoles;
}