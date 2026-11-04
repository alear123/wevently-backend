package com.wevently.wevently.Backups.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DtoBajaEstadoBackup {
    private Long id;
    private String nombre;
    private LocalDateTime fechaHoraBaja;
    private String usuarioResponsable;
    private String mensaje;
}