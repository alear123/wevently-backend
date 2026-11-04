/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Reportes.CantidadVistasPorLugar.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Lugares.Entities.Lugar;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.Entities.MetricaVistasLugar;

import java.util.Optional;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface MetricaVistasLugarRepository extends BaseRepository<MetricaVistasLugar, Long> {

    Optional<MetricaVistasLugar> findByLugarAndFechaVistaBetween(Lugar lugar, Date inicio, Date fin);

    List<MetricaVistasLugar> findByFechaVistaBetween(Date fechaDesde, Date fechaHasta);
}
