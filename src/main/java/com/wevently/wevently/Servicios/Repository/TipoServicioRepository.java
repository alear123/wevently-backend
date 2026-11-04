/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Servicios.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Servicios.Entities.TipoServicio;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

@Repository
public interface TipoServicioRepository extends BaseRepository<TipoServicio,Long> {
    List<TipoServicio> findByFechaHoraBajaIsNull();
    Page<TipoServicio> findByFechaHoraBajaIsNull(Pageable pageable);
    Optional<TipoServicio> findByIdAndFechaHoraBajaIsNull(Long id);
}
