/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.UsuarioRol;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioRolRepository extends BaseRepository<UsuarioRol,Long> {
    
}
