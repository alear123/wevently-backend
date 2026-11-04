package com.wevently.wevently.Pagos.Entities;

import jakarta.persistence.Embeddable;
import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

@Audited
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Embeddable
public class RangoMontos {
    private BigDecimal minimo;
    private BigDecimal maximo;
}
