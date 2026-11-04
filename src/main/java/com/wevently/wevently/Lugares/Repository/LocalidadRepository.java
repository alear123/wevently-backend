/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Lugares.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Lugares.Entities.Localidad;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LocalidadRepository extends BaseRepository<Localidad, Long> {
    List<Localidad> findByFechaHoraBajaIsNull();

    Optional<Localidad> findByIdAndFechaHoraBajaIsNull(Long id);

    Localidad findByNombre(String nombre);

    @Query("SELECT l FROM com.wevently.wevently.Lugares.Entities.Provincia p JOIN p.localidades l WHERE p.id = :provinciaId")
    List<Localidad> findByProvinciaId(@Param("provinciaId") Long provinciaId);
}
