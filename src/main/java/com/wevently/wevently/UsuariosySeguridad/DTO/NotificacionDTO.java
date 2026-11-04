package com.wevently.wevently.UsuariosySeguridad.DTO;

import java.time.LocalDateTime;

import com.wevently.wevently.UsuariosySeguridad.Enum.TipoNotificacion;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class NotificacionDTO {
    private Long id;
    private TipoNotificacion tipoNotificacion;
    private String titulo;
    private String resumen;
    private LocalDateTime fechaHoraAlta;
    private Boolean leida;
    private String urlReferencia;
    private String datosAdicionales;
}
