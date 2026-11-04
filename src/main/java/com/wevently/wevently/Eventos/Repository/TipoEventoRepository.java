/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Eventos.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Eventos.Entities.TipoEvento;
import com.wevently.wevently.UsuariosySeguridad.Entities.Grupo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

@Repository
public interface TipoEventoRepository extends BaseRepository<TipoEvento, Long> {
        List<TipoEvento> findByFechaHoraBajaIsNull();

        Page<TipoEvento> findByFechaHoraBajaIsNull(Pageable pageable);

        Optional<TipoEvento> findByIdAndFechaHoraBajaIsNull(Long id);

        Optional<TipoEvento> findByNombreAndFechaHoraBajaIsNull(String nombre);
}
