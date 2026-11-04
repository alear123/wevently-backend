/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Lugares.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.Provincia;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProvinciaRepository extends BaseRepository<Provincia, Long> {
    List<Provincia> findByfechaHoraBajaIsNull();

    @Query("SELECT p FROM Provincia p JOIN p.localidades l WHERE l.id = :localidadId")
    Provincia findByLocalidad(@Param("localidadId") Long localidadId);
}
