/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Eventos.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Eventos.Entities.Reserva;

import java.util.Date;
import java.util.List;

import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.Lugar;
import com.wevently.wevently.Lugares.Entities.Provincia;
import com.wevently.wevently.Servicios.Entities.Servicio;

import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import jakarta.persistence.LockModeType;

import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Pageable;

@Repository
public interface ReservaRepository extends BaseRepository<Reserva, Long> {
  List<Reserva> findByServicioIsNull();

  long countByLocalidadAndFechaHoraBajaIsNull(Localidad localidad);

  List<Reserva> findByFechaReservaBetweenAndPrestadorId(Date desde, Date hasta, Long PrestadorId);

  List<Reserva> findByLugar(Lugar lugar);

  List<Reserva> findByLugarIsNull();

  List<Reserva> findByServicio(Servicio servicio);

  @Lock(LockModeType.PESSIMISTIC_WRITE)
  @Query("select r from Reserva r where r.id = :id")
  Reserva findByIdForUpdate(@Param("id") Long id);

  @Query("SELECT r FROM Reserva r " +
      "WHERE r.lugar = :lugar " +
      "AND r.fechaReserva > :fechaReserva " +
      "AND r.estadoReserva IN (:estados) " +
      "AND r.fechaHoraBaja IS NULL")
  List<Reserva> findReservasActivasPorLugar(
      @Param("lugar") Lugar lugar,
      @Param("fechaReserva") Date fechaReserva,
      @Param("estados") List<EstadoReserva> estados);

  @Query("SELECT r FROM Reserva r " +
      "WHERE r.servicio = :servicio " +
      "AND r.fechaReserva > :fechaReserva " +
      "AND r.estadoReserva IN (:estados) " +
      "AND r.fechaHoraBaja IS NULL")
  List<Reserva> findReservasActivasPorServicio(
      @Param("servicio") Servicio servicio,
      @Param("fechaReserva") Date fechaReserva,
      @Param("estados") List<EstadoReserva> estados);

  @Query("""
              SELECT new com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.TipoServicioCantidad(ts.nombre, COUNT(r.id))
              FROM Reserva r
              JOIN r.servicio s
              JOIN s.tipoServicio ts
              WHERE (:desde IS NULL OR r.fechaReserva >= :desde)
                AND (:hasta IS NULL OR r.fechaReserva <= :hasta)
                AND (:localidadId IS NULL OR r.localidad.id = :localidadId)
                AND (
                      :provinciaId IS NULL OR EXISTS (
                              SELECT 1
                              FROM com.wevently.wevently.Lugares.Entities.Provincia p2
                                   JOIN p2.localidades loc
                              WHERE p2.id = :provinciaId AND loc = r.localidad
                      )
                )
                AND r.estadoReserva = com.wevently.wevently.Eventos.Enum.EstadoReserva.COMPLETO
                AND r.fechaHoraBaja IS NULL
              GROUP BY ts.nombre
              ORDER BY COUNT(r.id) DESC
      """)
  List<com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.TipoServicioCantidad> topTiposByUbicacionYFechas(
      @Param("provinciaId") Long provinciaId,
      @Param("localidadId") Long localidadId,
      @Param("desde") Date desde,
      @Param("hasta") Date hasta);

  List<Reserva> findAllByEstadoReservaAndPrestadorAndFechaReservaBetweenOrderByFechaReservaAsc(
      EstadoReserva estado,
      Usuario prestador,
      Date desde,
      Date hasta);

  @Query("SELECT r FROM Reserva r " +
      "LEFT JOIN FETCH r.lugar " +
      "LEFT JOIN FETCH r.servicio " +
      "WHERE r.evento.id = :eventoId " +
      "AND r.estadoReserva IN :estados " +
      "AND r.fechaHoraBaja IS NULL")
  List<Reserva> findReservasByEventoIdAndEstado(
      @Param("eventoId") Long eventoId,
      @Param("estados") List<EstadoReserva> estados);

  @Query("SELECT r FROM Reserva r " +
      "WHERE r.organizador.id = :usuarioId " +
      "AND r.evento.id IN :eventosIds " +
      "AND r.estadoReserva IN :estados " +
      "AND r.fechaHoraBaja IS NULL")
  List<Reserva> findReservasByUsuarioYEventos(
      @Param("usuarioId") Long usuarioId,
      @Param("eventosIds") List<Long> eventosIds,
      @Param("estados") List<EstadoReserva> estados);

  @Query("""
      SELECT new com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.ProvinciaCantidadDTO(p.nombre, COUNT(r.id))
      FROM Provincia p
      JOIN p.localidades l
      JOIN Reserva r ON r.localidad = l
      WHERE r.estadoReserva = com.wevently.wevently.Eventos.Enum.EstadoReserva.COMPLETO
        AND r.fechaHoraBaja IS NULL
      GROUP BY p.nombre
      ORDER BY COUNT(r.id) DESC
      """)
  List<com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.ProvinciaCantidadDTO> findTopProvinciasGlobal(
      Pageable pageable);

  @Query("""
      SELECT new com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.ServicioGlobalDTO(ts.nombre, COUNT(r.id))
      FROM Reserva r
      JOIN r.servicio s
      JOIN s.tipoServicio ts
      WHERE r.estadoReserva = com.wevently.wevently.Eventos.Enum.EstadoReserva.COMPLETO
        AND r.fechaHoraBaja IS NULL
      GROUP BY ts.nombre
      ORDER BY COUNT(r.id) DESC
      """)
  List<com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.ServicioGlobalDTO> findTopServiciosGlobal(
      Pageable pageable);

    @Query("""
       SELECT r.fechaReserva, SUM(r.precioReserva)
       FROM Reserva r
       WHERE r.fechaReserva Between :desde AND :hasta
       AND r.prestador = :prestador
       GROUP BY r.fechaReserva
       ORDER BY r.fechaReserva
       """)
    List<Object[]> obtenerTotalPorFecha(Date desde, Date hasta, Usuario prestador);

}
