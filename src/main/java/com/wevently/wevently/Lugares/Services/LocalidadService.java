/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Lugares.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Repository.LocalidadRepository;
import com.wevently.wevently.Lugares.Repository.LugarRepository;
import com.wevently.wevently.Servicios.Repository.ServicioRepository;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocalidadService extends BaseService<Localidad, Long, LocalidadRepository> {

    @Autowired
    private LugarRepository lugarRepository;
    @Autowired
    private ServicioRepository servicioRepository;
    @Autowired
    private ReservaRepository reservaRepository;

    public LocalidadService(LocalidadRepository repository) {
        super(repository);
    }

    public Map<String, Object> verificarYDarDeBaja(Long idLocalidad) {
        Localidad localidad = repository.findById(idLocalidad)
                .orElseThrow(() -> new RuntimeException("Localidad no encontrada"));

        long enLugares = lugarRepository.countByLocalidadAndFechaHoraBajaIsNull(localidad);
        long enServicios = servicioRepository.countByAreaCoberturaContainsAndFechaHoraBajaIsNull(localidad);
        long enReservas = reservaRepository.countByLocalidadAndFechaHoraBajaIsNull(localidad);

        Map<String, Object> resultado = new HashMap<>();

        if (enLugares > 0 || enServicios > 0 || enReservas > 0) {
            resultado.put("exitoso", false);
            resultado.put("mensaje", "No se puede dar de baja la localidad, está siendo utilizada por: "
                    + (enLugares > 0 ? enLugares + " Lugar(es). " : "")
                    + (enServicios > 0 ? enServicios + " Servicio(s). " : "")
                    + (enReservas > 0 ? enReservas + " Reserva(s)." : ""));
        } else {
            localidad.setFechaHoraBaja(LocalDateTime.now());
            repository.save(localidad);
            resultado.put("exitoso", true);
            resultado.put("mensaje", "Localidad dada de baja correctamente");
        }
        return resultado;
    }

    public Localidad darDeAltaAgain(Long idLocalidad) {
        Localidad localidad = repository.findById(idLocalidad)
                .orElseThrow(() -> new RuntimeException("Localidad no encontrada"));
        localidad.setFechaHoraBaja(null);
        return repository.save(localidad);
    }
}
