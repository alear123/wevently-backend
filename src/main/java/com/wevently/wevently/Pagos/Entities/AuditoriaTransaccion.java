package com.wevently.wevently.Pagos.Entities;

import com.wevently.wevently.Base.BaseEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Audited
@Entity
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "auditoria_transacciones")
public class AuditoriaTransaccion extends BaseEntity {

    private Long reservaId;
    private Long organizadorId;
    private Long prestadorId;
    private BigDecimal montoTotal;
    private BigDecimal comisionMercadoPago;
    private BigDecimal comisionNosotros;
    private BigDecimal montoAtransferir;
    private String idPago;
    private LocalDateTime fechaPago;
    private LocalDateTime fechaCreacionPago;
    private String metodoPago;
    private String transferenciaId;
    private LocalDateTime fechaHoraTransaccion; // cdo se hace la transferencia manual
    private LocalDateTime fechaHoraModificacion;
    private LocalDateTime fechaHoraCreacionAuditoria;
    private String observaciones;
}
