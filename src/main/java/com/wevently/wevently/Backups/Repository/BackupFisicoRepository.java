package com.wevently.wevently.Backups.Repository;

import com.wevently.wevently.Backups.Entities.BackupConfiguracion;
import com.wevently.wevently.Backups.Entities.BackupFisico;
import com.wevently.wevently.Backups.Enums.EstadoBackupFisico;
import com.wevently.wevently.Base.BaseRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import java.util.Optional;

@Repository
public interface BackupFisicoRepository extends BaseRepository<BackupFisico, Long> {



    @Query("SELECT bf FROM BackupFisico bf WHERE bf.configuracion.id = :configuracionId AND bf.estadoBackupFisico = :estado")
    Optional<BackupFisico> findByConfiguracionAndEstado(@Param("configuracionId") Long id, @Param("estado") EstadoBackupFisico estado);

    public Optional<BackupFisico> findById(Long id);
}
