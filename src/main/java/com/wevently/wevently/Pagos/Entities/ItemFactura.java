package com.wevently.wevently.Pagos.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.math.BigDecimal;
import com.wevently.wevently.Base.BaseEntity;
import org.hibernate.envers.Audited;

@Audited
@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "item_factura")
public class ItemFactura extends BaseEntity {
    private String codigoProducto;
    private String detalleProducto;
    private Integer cantidad;
    private String unidadMedida;
    private BigDecimal precioUnitarioNeto;
    private BigDecimal bonificacion;
    private BigDecimal subtotal;
    private BigDecimal alicuotaIVA;
    private BigDecimal importeIVA;
}