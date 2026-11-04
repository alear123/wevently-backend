package com.wevently.wevently.UsuariosySeguridad.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.RecuperacionPassword;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.Optional;

@Repository
public interface RecuperacionPasswordRepository extends BaseRepository<RecuperacionPassword, Long> {
    Optional<RecuperacionPassword> findTopByUsuarioOrderByIdDesc(Usuario usuario);

    long countByUsuarioAndUltimoIntentoAfter(Usuario usuario, LocalDateTime desde);
}