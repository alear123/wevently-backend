/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Lugares.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.Lugar;

import java.util.List;
import java.util.Optional;

import com.wevently.wevently.Lugares.Entities.TipoLugar;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import org.springframework.stereotype.Repository;

@Repository
public interface LugarRepository extends BaseRepository<Lugar, Long> {

    List<Lugar> findByTipoLugarAndFechaHoraBajaIsNull(TipoLugar tipoLugar);

    Optional<Lugar> findById(Long id);

    boolean existsById(Long id);

    long countByLocalidadAndFechaHoraBajaIsNull(Localidad localidad);

    List<Lugar> findByfechaHoraBajaIsNull();

    List<Lugar> findByPropietario(Usuario propietario);

    Optional<Lugar> findByNombreAndTipoLugarAndLocalidadAndFechaHoraBajaIsNull(
            String nombre,
            TipoLugar tipoLugar,
            Localidad localidad);

    Optional<Lugar> findByIdAndFechaHoraBajaIsNull(Long id);

    List<Lugar> findByPropietarioAndFechaHoraBajaIsNull(Usuario usuario);
}
