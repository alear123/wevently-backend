package com.wevently.wevently.Pagos.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.math.BigDecimal;

@Audited
@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "factura_b")
public class FacturaB extends BaseFacturaEntity {
    // la emiten los Responsables Inscriptos, pero cuando el cliente es un
    // Consumidor Final, Monotributista o Exento.
    private BigDecimal alicuotaIVA;
    private BigDecimal importeIVAContenido;
    private String leyendaTransparenciaFiscal;
    private String marcaInterna;
}
