/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Genero;
import com.wevently.wevently.UsuariosySeguridad.Entities.Rol;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RolRepository extends BaseRepository<Rol,Long> {
    Optional<Rol> findByNombre(String nombre);
    
    Page<Rol> findByActivoAndNombreContainingIgnoreCase(Boolean activo, String nombre, Pageable pageable);

    Page<Rol> findByActivo(Boolean activo, Pageable pageable);

    Page<Rol> findByNombreContainingIgnoreCase(String nombre, Pageable pageable);
}
