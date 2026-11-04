package com.wevently.wevently.Pagos.Repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Pagos.Entities.ParametroComision;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface ParametroComisionRepository extends BaseRepository<ParametroComision, Long> {

        Optional<ParametroComision> findByFechaHoraBajaIsNull();

        @Query("SELECT p FROM ParametroComision p WHERE p.fechaDesde <= :fechaActual AND p.fechaHasta >= :fechaActual AND p.fechaHoraBaja is null")
        List<ParametroComision> findParametroComisionActivo(@Param("fechaActual") LocalDateTime fechaActual);

        @Query("SELECT p FROM ParametroComision p WHERE " +
                        "p.fechaDesde <= :fecha AND " +
                        "(p.fechaHasta IS NULL OR p.fechaHasta >= :fecha) AND " +
                        "p.fechaHoraBaja IS NULL " +
                        "ORDER BY p.fechaDesde DESC")
        Optional<ParametroComision> findVigentePorFecha(@Param("fecha") LocalDateTime fecha);

        @Query("SELECT p FROM ParametroComision p WHERE " +
                        "p.fechaHoraBaja IS NULL " +
                        "ORDER BY p.fechaDesde DESC")
        Optional<ParametroComision> findActivo();
}
