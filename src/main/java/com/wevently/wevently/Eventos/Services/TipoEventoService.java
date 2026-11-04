/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Eventos.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.Entities.TipoEvento;
import com.wevently.wevently.Eventos.Repository.TipoEventoRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Grupo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class TipoEventoService extends BaseService<TipoEvento,Long, TipoEventoRepository>{

    public TipoEventoService(TipoEventoRepository repository) {
        super(repository);
    }

    @Override
    public List<TipoEvento> findAll() throws Exception {
        return repository.findByFechaHoraBajaIsNull();
    }

    @Override
    public Page<TipoEvento> findAll(Pageable pageable) throws Exception {
        return repository.findByFechaHoraBajaIsNull(pageable);
    }
    @Override
    public TipoEvento update(Long id, TipoEvento entity) throws Exception {
        TipoEvento existente = this.findById(id);
        if (existente.getFechaHoraBaja() != null) {
            throw new ErrorDeNegocio("No se puede modificar un TipoEvento dado de baja");
        }
        entity.setId(id);
        return repository.save(entity);
    }
    
    @Override
    public TipoEvento save(TipoEvento entity) throws Exception {
        // Buscar si ya existe un TipoEvento activo con el mismo nombre
        List<TipoEvento> existentes = repository.findByFechaHoraBajaIsNull()
            .stream()
            .filter(te -> te.getNombre().equalsIgnoreCase(entity.getNombre()))
            .toList();
        if (!existentes.isEmpty()) {
            throw new ErrorDeNegocio("Ya existe un TipoEvento activo con ese nombre");
        }
        return super.save(entity);
    }
}
