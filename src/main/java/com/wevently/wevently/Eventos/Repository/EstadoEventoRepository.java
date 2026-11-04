/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Eventos.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Eventos.Entities.EstadoEvento;
import org.springframework.stereotype.Repository;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@Repository
public interface EstadoEventoRepository extends BaseRepository<EstadoEvento, Long> {
    List<EstadoEvento> findByFechaHoraBajaIsNull();

    Page<EstadoEvento> findByFechaHoraBajaIsNull(Pageable pageable);

    EstadoEvento findByNombre(String nombre);
}