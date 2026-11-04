/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Lugares.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Lugares.Entities.Caracteristica;
import com.wevently.wevently.Lugares.Repository.CaracteristicaRepository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CaracteristicaService extends BaseService<Caracteristica,Long, CaracteristicaRepository>{

    public CaracteristicaService(CaracteristicaRepository repository) {
        super(repository);
    }
        @Override
    public List<Caracteristica> findAll() throws Exception {
        return repository.findByFechaHoraBajaIsNull();
    }

    @Override
    public Page<Caracteristica> findAll(Pageable pageable) throws Exception {
        return repository.findByFechaHoraBajaIsNull(pageable);
    }

    @Override
    public Caracteristica save(Caracteristica entity) throws Exception {
        List<Caracteristica> existentes = repository.findByFechaHoraBajaIsNull()
            .stream()
            .filter(c -> c.getNombre().equalsIgnoreCase(entity.getNombre()))
            .toList();
        if (!existentes.isEmpty()) {
            throw new ErrorDeNegocio("Ya existe una Caracteristica activa con ese nombre");
        }
        return super.save(entity);
    }

    @Override
    public Caracteristica update(Long id, Caracteristica entity) throws Exception {
        Caracteristica existente = this.findById(id);
        if (existente.getFechaHoraBaja() != null) {
            throw new ErrorDeNegocio("No se puede modificar una Caracteristica dada de baja");
        }
        entity.setId(id);
        return repository.save(entity);
    }
}
