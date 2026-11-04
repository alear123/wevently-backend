package com.wevently.wevently.UsuariosySeguridad.Entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.UsuariosySeguridad.Enum.MetodoHttp;
import com.wevently.wevently.UsuariosySeguridad.Enum.TipoPermiso;
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
@Table(name = "permisos")
public class Permiso extends BaseEntity {
    @NotBlank(message = "La ruta no puede quedar en blanco")
    private String ruta;
    @NotNull
    private MetodoHttp metodoHttp;
    private String descripcion;
    @NotNull
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
    @Enumerated(EnumType.STRING)
    private TipoPermiso tipoPermiso;

    // Relación inversa con Grupo
    @ManyToMany(mappedBy = "permisos")
    @JsonBackReference
    private List<Grupo> grupos;

    public Permiso(String ruta, MetodoHttp metodoHttp, String descripcion, LocalDateTime fechaHoraAlta,
            LocalDateTime fechaHoraBaja, TipoPermiso tipoPermiso) {
        this.ruta = ruta;
        this.metodoHttp = metodoHttp;
        this.descripcion = descripcion;
        this.fechaHoraAlta = fechaHoraAlta;
        this.fechaHoraBaja = fechaHoraBaja;
        this.tipoPermiso = tipoPermiso;
    }
}