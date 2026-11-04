package com.wevently.wevently.Backups.Repository;

import com.wevently.wevently.Backups.Entities.BackupEstadoBackup;
import com.wevently.wevently.Backups.Entities.BackupFisico;
import com.wevently.wevently.Base.BaseRepository;

public interface BackupEstadoBackupRepository extends BaseRepository<BackupEstadoBackup, Long> {
    boolean existsByEstadoBackupId(Long estadoBackupId);
}
