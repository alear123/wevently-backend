package com.wevently.wevently.UsuariosySeguridad.Repository;

import org.springframework.stereotype.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.DatosBancarios;
import java.util.Optional;

@Repository
public interface DatosBancariosRepository extends BaseRepository<DatosBancarios, Long> {
    Optional<DatosBancarios> findByUsuarioId(Long usuarioId);
    boolean existsByUsuarioId(Long usuarioId);
}
