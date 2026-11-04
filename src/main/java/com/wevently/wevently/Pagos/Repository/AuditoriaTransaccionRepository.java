package com.wevently.wevently.Pagos.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Pagos.Entities.AuditoriaTransaccion;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface AuditoriaTransaccionRepository extends BaseRepository<AuditoriaTransaccion, Long> {

        List<AuditoriaTransaccion> findByFechaHoraTransaccionBetween(
                        LocalDateTime fechaDesde, LocalDateTime fechaHasta);

        List<AuditoriaTransaccion> findByReservaIdOrderByFechaHoraTransaccionDesc(Long reservaId);

        @Query("SELECT a FROM AuditoriaTransaccion a WHERE " +
                        "a.fechaHoraTransaccion BETWEEN :fechaInicio AND :fechaFin " +
                        "ORDER BY a.fechaHoraTransaccion DESC")
        List<AuditoriaTransaccion> findByRangoFechas(@Param("fechaInicio") LocalDateTime fechaInicio,
                        @Param("fechaFin") LocalDateTime fechaFin);

        List<AuditoriaTransaccion> findByFechaHoraTransaccion(LocalDateTime fechaHoraTransaccion);

        @Query("SELECT a FROM AuditoriaTransaccion a WHERE " +
                        "a.fechaCreacionPago <= :fechaLimite AND a.fechaHoraTransaccion IS NULL " +
                        "ORDER BY a.fechaCreacionPago ASC")
        List<AuditoriaTransaccion> findTransferenciasPendientes(@Param("fechaLimite") LocalDateTime fechaLimite);

}