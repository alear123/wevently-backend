package com.wevently.wevently.Backups.DTO;

import com.wevently.wevently.Backups.Enums.FrecuenciaBackup;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoModificacionBackup {
    String nombre;
    Integer retencion;
}
