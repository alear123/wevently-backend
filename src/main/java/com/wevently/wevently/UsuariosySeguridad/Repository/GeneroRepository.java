/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Genero;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface GeneroRepository extends BaseRepository<Genero,Long> {

    Optional<Genero> findByNombre(String nombre);
}
