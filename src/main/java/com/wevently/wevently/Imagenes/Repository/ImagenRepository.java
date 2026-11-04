/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Imagenes.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Imagenes.Entities.Imagen;
import com.wevently.wevently.Lugares.Entities.Localidad;
import org.springframework.stereotype.Repository;

@Repository
public interface ImagenRepository extends BaseRepository<Imagen,Long> {
    
}
