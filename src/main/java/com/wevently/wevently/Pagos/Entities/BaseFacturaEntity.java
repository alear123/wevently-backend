package com.wevently.wevently.Pagos.Entities;

import java.math.BigDecimal;
import java.time.LocalDate;

import com.wevently.wevently.Base.BaseEntity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.OneToMany;

import lombok.*;
import org.hibernate.envers.Audited;

import java.util.List;

@Audited
@Getter
@Setter
@NoArgsConstructor
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class BaseFacturaEntity extends BaseEntity {
    private String tipo; // "A", "B"
    private String codigoComprobante;
    private String numeroComprobante;
    private LocalDate fechaEmision;
    private LocalDate fechaVencimientoPago;

    // Cliente (receptor)
    private String nombreReceptor;
    private String apellidoReceptor;
    private String cuitReceptor;
    private String condicionIVAReceptor;

    // Emisor (Wevently)
    private String nombreEmisor;
    private String razonSocialEmisor;
    private String cuitEmisor;
    private String domicilioEmisor;
    private String provinciaEmisor;
    private String ingresosBrutosEmisor;
    private String condicionIVAEmisor;

    private String condicionVenta;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<ItemFactura> items;

    private String importeEnLetras;
    private String observaciones;

    // Totales básicos compartidos
    private BigDecimal bonificacion;
    private BigDecimal subtotal;
    private BigDecimal otrosImpuestos;
    private BigDecimal importeTotal;
    private BigDecimal importeExento;
}
