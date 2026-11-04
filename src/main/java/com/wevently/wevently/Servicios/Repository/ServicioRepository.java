/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Servicios.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.Lugar;
import com.wevently.wevently.Lugares.Entities.TipoLugar;
import com.wevently.wevently.Servicios.Entities.Servicio;

import java.util.List;
import java.util.Optional;

import com.wevently.wevently.Servicios.Entities.TipoServicio;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ServicioRepository extends BaseRepository<Servicio, Long> {
        public Optional<Servicio> findById(Long id);

        long countByAreaCoberturaContainsAndFechaHoraBajaIsNull(Localidad localidad);

        List<Servicio> findByfechaHoraBajaIsNull();

        List<Servicio> findByPrestadorAndFechaHoraBajaIsNull(Usuario prestador);

        List<Servicio> findByPrestador(Usuario prestador);

        public Optional<Servicio> findByIdAndFechaHoraBajaIsNull(Long id);

        @Query("SELECT s FROM Servicio s JOIN s.areaCobertura l " +
                        "WHERE s.nombre = :nombre AND s.tipoServicio = :tipoServicio " +
                        "AND :localidad MEMBER OF s.areaCobertura AND s.fechaHoraBaja IS NULL")
        Optional<Servicio> findByNombreTipoServicioYLocalidad(@Param("nombre") String nombre,
                        @Param("tipoServicio") TipoServicio tipoServicio,
                        @Param("localidad") Localidad localidad);

}
