    /*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
     */
    package com.wevently.wevently.Backups.Entities;

    import com.wevently.wevently.Backups.Enums.FrecuenciaBackup;
    import com.wevently.wevently.Base.BaseEntity;
    import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
    import jakarta.persistence.*;

    import java.time.LocalDateTime;
    import java.util.ArrayList;
    import java.util.List;

    import jakarta.validation.constraints.NotBlank;
    import jakarta.validation.constraints.NotNull;
    import lombok.AllArgsConstructor;
    import lombok.Getter;
    import lombok.NoArgsConstructor;
    import lombok.Setter;
    import org.hibernate.envers.Audited;

    @Audited
    @Entity
    @Setter
    @Getter
    @AllArgsConstructor
    @NoArgsConstructor
    @Table(name = "backups_configuraciones")
    public class BackupConfiguracion extends BaseEntity {
        @NotBlank
        private String nombre;
        @NotNull
        private LocalDateTime fechaHora;
        @NotNull
        private Integer diasRetencion;
        private LocalDateTime fechaProgramada;
        @NotNull
        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "usuario_id", nullable = false)
        private Usuario usuario;
        @NotNull
        @OneToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE}, fetch = FetchType.LAZY)
        @JoinColumn(name = "backup_id")
        private List<BackupEstadoBackup> backupEstadoBackups;
        @Enumerated(EnumType.STRING)
        private FrecuenciaBackup frecuencia;
        @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        @JoinColumn(name = "configuracion_id") // la columna en backups_fisicos que referencia a esta configuración
        private List<BackupFisico> backupsFisicos = new ArrayList<>();
    }
