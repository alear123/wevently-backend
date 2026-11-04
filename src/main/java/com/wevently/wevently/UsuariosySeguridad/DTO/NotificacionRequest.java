package com.wevently.wevently.UsuariosySeguridad.DTO;

import com.wevently.wevently.UsuariosySeguridad.Enum.TipoNotificacion;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class NotificacionRequest {
    private Long usuarioId;
    private TipoNotificacion tipoNotificacion;
    private String titulo;
    private String resumen;
    private String urlReferencia;
    private String datosAdicionales;
}
