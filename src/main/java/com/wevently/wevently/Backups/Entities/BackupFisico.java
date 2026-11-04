package com.wevently.wevently.Backups.Entities;

import com.wevently.wevently.Backups.Enums.EstadoBackupFisico;
import com.wevently.wevently.Base.BaseEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.time.LocalDateTime;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "backups_fisicos")
public class BackupFisico extends BaseEntity {
    private String nombre;
    private LocalDateTime fechaHora;
    private String filePath;
    Double tamaño;
    //Hash único que representa el esquema de la base de datos en el momento del backup.Se usa para validar compatibilidad antes de restaurar.
    @Column(name = "esquema_db_hash", length = 64, nullable = true)
    private String esquemaDbHash;
    @NotNull
    private Integer diasRetencion;
    EstadoBackupFisico estadoBackupFisico;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "configuracion_id") // coincide con la columna de la BD
    private BackupConfiguracion configuracion;

}
