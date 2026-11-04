/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Eventos.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.Entities.EstadoEvento;
import com.wevently.wevently.Eventos.Repository.EstadoEventoRepository;

import com.wevently.wevently.Eventos.Repository.EventoRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class EstadoEventoService extends BaseService<EstadoEvento,Long, EstadoEventoRepository>{

    @Autowired
    private EventoRepository eventoRepository;

    public EstadoEventoService(EstadoEventoRepository repository) {
        super(repository);
    }

    @Override
    public List<EstadoEvento> findAll() throws Exception {
        return (List<EstadoEvento>) repository.findAll();
    }

    @Override
    public Page<EstadoEvento> findAll(Pageable pageable) throws Exception {
        return repository.findAll(pageable);
    }

    @Override
    public EstadoEvento save(EstadoEvento entity) throws Exception {
        List<EstadoEvento> existentes = repository.findByFechaHoraBajaIsNull()
            .stream()
            .filter(ee -> ee.getNombre().equalsIgnoreCase(entity.getNombre()))
            .toList();
        if (!existentes.isEmpty()) {
            throw new ErrorDeNegocio("Ya existe un EstadoEvento activo con ese nombre");
        }
        return super.save(entity);
    }

    @Override
    public EstadoEvento update(Long id, EstadoEvento entity) throws Exception {
        EstadoEvento existente = this.findById(id);
        if (existente.getFechaHoraBaja() != null) {
            throw new ErrorDeNegocio("No se puede modificar un EstadoEvento dado de baja");
        }
        entity.setId(id);
        return repository.save(entity);
    }

    public EstadoEvento darDeBaja(Long id) throws Exception {
        EstadoEvento estado = this.findById(id);

        if (estado.getFechaHoraBaja() != null) {
            throw new ErrorDeNegocio("El EstadoEvento ya está dado de baja");
        }

        // Verificar si hay eventos asociados a este estado
        boolean tieneEventos = eventoRepository.existsByEstadoEvento(estado);
        if (tieneEventos) {
            throw new ErrorDeNegocio("No se puede dar de baja el estado porque está asociado a uno o más eventos");
        }

        estado.setFechaHoraBaja(LocalDateTime.now());
        return repository.save(estado);
    }

    @Transactional
    public EstadoEvento habilitar(Long id) throws Exception {
        EstadoEvento estado = repository.findById(id)
                .orElseThrow(() -> new ErrorDeNegocio("El estado no existe"));

        if (estado.getFechaHoraBaja() == null) {
            throw new ErrorDeNegocio("El estado ya está habilitado");
        }

        estado.setFechaHoraBaja(null); // Reactivamos el estado
        return repository.save(estado);
    }
}
