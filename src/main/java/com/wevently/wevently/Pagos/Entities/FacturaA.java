package com.wevently.wevently.Pagos.Entities;

import java.math.BigDecimal;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

@Audited
@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "factura_a")
public class FacturaA extends BaseFacturaEntity {
    // Específicos de Factura A
    // La emiten los Responsables Inscriptos cuando le facturan a otro Responsable
    // Inscripto.
    private BigDecimal alicuotaIVA;
    private BigDecimal importeNetoGravado;
    private BigDecimal importeIVA;
    private String leyendaAutorizacionFiscal;
    private String caeCodigo;
    private String marcaInterna; // opcional
}
