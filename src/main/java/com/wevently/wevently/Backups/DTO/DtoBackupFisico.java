package com.wevently.wevently.Backups.DTO;

import com.wevently.wevently.Backups.Entities.BackupFisico;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoBackupFisico {

    private Long idBF;
    private String nombreBF;
    private LocalDateTime fechaHoraBF;
    private String estadoBF;
    private Double tamañoBF;

    public DtoBackupFisico(BackupFisico bf) {
        this.idBF = bf.getId();
        this.nombreBF = bf.getNombre();
        this.fechaHoraBF = bf.getFechaHora();
        this.estadoBF = bf.getEstadoBackupFisico() != null ? bf.getEstadoBackupFisico().name() : null;
        this.tamañoBF = bf.getTamaño();
    }
}
