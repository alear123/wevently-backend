package com.wevently.wevently.UsuariosySeguridad.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
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
@Table(name = "grupos")
public class Grupo extends BaseEntity {

    @Column(nullable = false, unique = true)
    private String nombre;

    private String descripcion;

    @NotNull
    private LocalDateTime fechaHoraAlta;

    private LocalDateTime fechaHoraBaja;

    // Relación con permisos
    @ManyToMany
    @JoinTable(name = "grupo_permiso", joinColumns = @JoinColumn(name = "grupo_id"), inverseJoinColumns = @JoinColumn(name = "permiso_id"))
    @JsonManagedReference
    private List<Permiso> permisos;

}