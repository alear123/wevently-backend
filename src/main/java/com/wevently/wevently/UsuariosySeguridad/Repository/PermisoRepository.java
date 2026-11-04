/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Permiso;
import com.wevently.wevently.UsuariosySeguridad.Enum.MetodoHttp;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PermisoRepository extends BaseRepository<Permiso,Long> {

    boolean existsByRutaAndMetodoHttp(String ruta, MetodoHttp metodoHttp);
    Optional<Permiso> findByRutaAndMetodoHttp(String ruta, MetodoHttp metodoHttp);
}
