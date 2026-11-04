package com.wevently.wevently.Backups.DTO;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.wevently.wevently.Backups.Entities.BackupConfiguracion;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoBackup {
    Long idBackup;
    String nombre;
    LocalDateTime fechaProgramada;
    String estado;
    Integer retencion;
    List<DtoBackupFisico> backupsfisicos;
    String frecuencia;


    public DtoBackup(BackupConfiguracion config) {
        this.idBackup = config.getId();
        this.nombre = config.getNombre();
        this.fechaProgramada = config.getFechaProgramada();
        this.retencion = config.getDiasRetencion();
        this.frecuencia = (config.getFrecuencia() != null) ? config.getFrecuencia().name() : null;

        // Estado actual de la configuración
        this.estado = config.getBackupEstadoBackups().stream()
                .filter(eb -> eb.getFechaHasta() == null)
                .map(eb -> eb.getEstadoBackup().getNombre())
                .findFirst()
                .orElse(null);

        // Convertir los backups físicos asociados a DtoBackupFisico
        if (config.getBackupsFisicos() != null) {
            this.backupsfisicos = config.getBackupsFisicos().stream()
                    .map(DtoBackupFisico::new)
                    .collect(Collectors.toList());
        } else {
            this.backupsfisicos = new ArrayList<>();
        }
    }
}