/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Servicios.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Servicios.Entities.EstadoServicio;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface EstadoServicioRepository extends BaseRepository<EstadoServicio, Long> {

    List<EstadoServicio> findByFechaHoraBajaIsNull();
    Optional<EstadoServicio> findByNombreAndFechaHoraBajaIsNull(String nombre);
}
