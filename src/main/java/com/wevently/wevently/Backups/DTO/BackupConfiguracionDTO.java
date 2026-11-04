package com.wevently.wevently.Backups.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.repository.cdi.Eager;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BackupConfiguracionDTO {
    Long id;
    String nombre;
    Integer diasRetencion;
}
