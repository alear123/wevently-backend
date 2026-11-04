/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Eventos.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Eventos.Entities.EstadoEvento;
import com.wevently.wevently.Eventos.Entities.Evento;
import com.wevently.wevently.Eventos.Entities.Reserva;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface EventoRepository extends BaseRepository<Evento, Long> {

    public List<Evento> findAll();

    Optional<Evento> findByReservasContains(Reserva reserva);

    @Query("SELECT DISTINCT e FROM Evento e " +
            "LEFT JOIN FETCH e.reservas r " +
            "LEFT JOIN FETCH r.lugar " +
            "LEFT JOIN FETCH r.servicio " +
            "LEFT JOIN FETCH e.estadoEvento " +
            "LEFT JOIN FETCH e.tipoEvento " +
            "WHERE e.id IN :eventosIds " +
            "AND e.fecha BETWEEN :fechaDesde AND :fechaHasta " +
            "AND e.fechaHoraBaja IS NULL")
    List<Evento> findEventosConReservasByUsuarioYFechas(
            @Param("eventosIds") List<Long> eventosIds,
            @Param("fechaDesde") LocalDate fechaDesde,
            @Param("fechaHasta") LocalDate fechaHasta);

    @Query("SELECT DISTINCT e FROM Evento e " +
            "LEFT JOIN FETCH e.reservas r " +
            "LEFT JOIN FETCH r.organizador " +
            "LEFT JOIN FETCH r.lugar " +
            "LEFT JOIN FETCH r.servicio " +
            "LEFT JOIN FETCH e.estadoEvento " +
            "LEFT JOIN FETCH e.tipoEvento " +
            "WHERE r.organizador.id = :usuarioId " +
            "AND e.fecha BETWEEN :fechaDesde AND :fechaHasta " +
            "AND e.fechaHoraBaja IS NULL " +
            "AND r.fechaHoraBaja IS NULL")
    List<Evento> findEventosByUsuarioIdYFechas(
            @Param("usuarioId") Long usuarioId,
            @Param("fechaDesde") LocalDate fechaDesde,
            @Param("fechaHasta") LocalDate fechaHasta);

    boolean existsByEstadoEvento(EstadoEvento estadoEvento);
}
