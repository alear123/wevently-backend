package com.wevently.wevently.Reportes.CantidadUsuariosActivos.Entities;

import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.util.Date;

@Audited
@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "metricas_actividad")
public class MetricaActividad extends BaseEntity {
    private Date fechaIngreso;
    private Integer cantidadIngresos;
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Usuario usuario;
}
