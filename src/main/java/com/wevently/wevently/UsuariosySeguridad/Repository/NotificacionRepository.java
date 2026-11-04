package com.wevently.wevently.UsuariosySeguridad.Repository;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Pageable;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Notificacion;

@Repository
public interface NotificacionRepository extends BaseRepository<Notificacion, Long> {

    @Query("SELECT n FROM Notificacion n WHERE n.usuario.id = :usuarioId " +
            "AND n.fechaHoraBaja IS NULL ORDER BY n.fechaHoraAlta DESC")
    Page<Notificacion> findByUsuarioIdNotDeleted(
            @Param("usuarioId") Long usuarioId,
            Pageable pageable);

    @Query("SELECT n FROM Notificacion n WHERE n.usuario.id = :usuarioId " +
            "AND n.leida = false AND n.fechaHoraBaja IS NULL ORDER BY n.fechaHoraAlta DESC")
    Page<Notificacion> findUnreadByUsuarioId(
            @Param("usuarioId") Long usuarioId,
            Pageable pageable);

    @Query("SELECT COUNT(n) FROM Notificacion n WHERE n.usuario.id = :usuarioId " +
            "AND n.leida = false AND n.fechaHoraBaja IS NULL")
    Long countUnreadByUsuarioId(@Param("usuarioId") Long usuarioId);

    @Modifying
    @Query("UPDATE Notificacion n SET n.leida = true WHERE n.usuario.id = :usuarioId " +
            "AND n.leida = false AND n.fechaHoraBaja IS NULL")
    void markAllAsReadByUsuarioId(@Param("usuarioId") Long usuarioId);

}
