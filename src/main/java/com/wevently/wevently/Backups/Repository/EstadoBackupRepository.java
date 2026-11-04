package com.wevently.wevently.Backups.Repository;

import java.util.Optional;

import org.springframework.stereotype.Repository;
import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Backups.Entities.EstadoBackup;

@Repository
public interface EstadoBackupRepository extends BaseRepository<EstadoBackup, Long> {

    Optional<EstadoBackup> findByNombre(String nombre);

    Optional <EstadoBackup> findById(Long id);
}
