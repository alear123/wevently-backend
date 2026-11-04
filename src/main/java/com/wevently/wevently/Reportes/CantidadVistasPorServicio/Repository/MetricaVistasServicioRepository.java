/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Reportes.CantidadVistasPorServicio.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.Entities.MetricaVistasServicio;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Repository;

@Repository
public interface MetricaVistasServicioRepository extends BaseRepository<MetricaVistasServicio, Long> {

    Optional<MetricaVistasServicio> findByServicioAndFechaVistaBetween(Servicio servicio, Date inicio, Date fin);

    List<MetricaVistasServicio> findByFechaVistaBetween(Date fechaDesde, Date fechaHasta);
}
