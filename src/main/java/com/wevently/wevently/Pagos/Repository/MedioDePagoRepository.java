/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Pagos.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Pagos.Entities.MedioDePago;
import com.wevently.wevently.Pagos.Entities.TipoMedioPago;
import com.wevently.wevently.Pagos.Entities.EstadoMedioPago;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface MedioDePagoRepository extends BaseRepository<MedioDePago, Long> {

    @Query("SELECT m FROM MedioDePago m WHERE m.estado = 'ACTIVO'")
    List<MedioDePago> findMediosActivos();

    List<MedioDePago> findByEsVisible(Boolean esVisible);

    List<MedioDePago> findByTipoAndEstado(TipoMedioPago tipo, EstadoMedioPago estado);

    Optional<MedioDePago> findByCodigo(String codigo);

    /*
     * @Query("SELECT m FROM medios_de_pago m WHERE m.esVisible = true AND m.estado = :estado"
     * ) // revisar de agregar el
     * // atributo estado a medio
     * // de pago
     * List<MedioDePago> findVisblesConEstado(EstadoMedioPago estado);
     */
}
