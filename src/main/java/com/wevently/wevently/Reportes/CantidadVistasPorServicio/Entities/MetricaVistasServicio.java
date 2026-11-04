package com.wevently.wevently.Reportes.CantidadVistasPorServicio.Entities;

import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.Servicios.Entities.Servicio;
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
@Table(name = "metricas_vistas_servicio")
public class MetricaVistasServicio extends BaseEntity {
    private Date fechaVista;
    private Integer cantidadVistas;
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Servicio servicio;
}
