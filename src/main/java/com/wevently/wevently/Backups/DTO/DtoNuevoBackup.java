package com.wevently.wevently.Backups.DTO;

import java.time.LocalDateTime;

import com.wevently.wevently.Backups.Enums.FrecuenciaBackup;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoNuevoBackup {
    String nombre;
    Integer retencion;
    LocalDateTime fechaProgramada;
    private FrecuenciaBackup frecuencia;
}
