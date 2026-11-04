/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Grupo;
import com.wevently.wevently.UsuariosySeguridad.Entities.Permiso;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GrupoRepository extends BaseRepository<Grupo,Long> {

    boolean existsByNombre(String nombre);
    Page<Grupo> findByFechaHoraBajaIsNull(Pageable pageable);

}
