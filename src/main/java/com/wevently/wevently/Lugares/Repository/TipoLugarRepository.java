/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Lugares.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Lugares.Entities.Lugar;
import com.wevently.wevently.Lugares.Entities.TipoLugar;
import org.springframework.stereotype.Repository;


import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
@Repository
public interface TipoLugarRepository extends BaseRepository<TipoLugar,Long> {
    List<TipoLugar> findByFechaHoraBajaIsNull();
    Page<TipoLugar> findByFechaHoraBajaIsNull(Pageable pageable);

    Optional<TipoLugar> findByIdAndFechaHoraBajaIsNull(Long tipoLugarId);
}
