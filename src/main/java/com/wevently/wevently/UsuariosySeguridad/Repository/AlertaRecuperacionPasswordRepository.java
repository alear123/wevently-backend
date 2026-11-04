package com.wevently.wevently.UsuariosySeguridad.Repository;

import java.time.LocalDateTime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.wevently.wevently.UsuariosySeguridad.Entities.AlertaRecuperacionPassword;
import com.wevently.wevently.UsuariosySeguridad.Entities.RecuperacionPassword;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;

@Repository
public interface AlertaRecuperacionPasswordRepository extends JpaRepository<AlertaRecuperacionPassword, Long> {
    boolean existsByRecuperacionPasswordAndFechaHoraAfter(RecuperacionPassword recuperacionPassword, LocalDateTime fechaHora);

}