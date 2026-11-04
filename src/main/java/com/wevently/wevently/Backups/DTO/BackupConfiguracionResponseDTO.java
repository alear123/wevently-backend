package com.wevently.wevently.Backups.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BackupConfiguracionResponseDTO {
    private Long id;
    private String nombre;
    private Integer retencion;
}