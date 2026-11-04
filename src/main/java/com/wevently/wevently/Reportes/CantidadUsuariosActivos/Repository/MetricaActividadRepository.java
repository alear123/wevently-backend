/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Reportes.CantidadUsuariosActivos.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.Entities.MetricaActividad;

import java.util.List;
import java.util.Date;
import java.util.Optional;

import org.springframework.stereotype.Repository;

@Repository
public interface MetricaActividadRepository extends BaseRepository<MetricaActividad, Long> {
    Optional<MetricaActividad> findByUsuarioIdAndFechaIngresoBetween(Long usuarioId, Date inicio, Date fin);

    List<MetricaActividad> findByFechaIngresoBetween(Date fechaInicio, Date fechaHasta);
}
