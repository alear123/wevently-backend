package com.wevently.wevently.Pagos.DTO;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class DTOTransferenciaPendiente {
    private Long idAuditoriaTransaccion;
    private LocalDateTime fechaOperacion;

    private String nombreOrganizador;
    private String nombrePrestador;

    private String alias;
    private String CBUCVU;

    private BigDecimal montoAtransferir;

    private LocalDateTime fechaHoraModificacion;

}
