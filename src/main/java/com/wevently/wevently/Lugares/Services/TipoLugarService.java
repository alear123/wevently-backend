/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Lugares.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Lugares.DTO.DtoTipoLugar;
import com.wevently.wevently.Lugares.Entities.TipoLugar;
import com.wevently.wevently.Lugares.Repository.TipoLugarRepository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TipoLugarService extends BaseService<TipoLugar,Long, TipoLugarRepository>{

    public TipoLugarService(TipoLugarRepository repository) {
        super(repository);
    }
        @Override
    public List<TipoLugar> findAll() throws Exception {
        return repository.findByFechaHoraBajaIsNull();
    }

    @Override
    public Page<TipoLugar> findAll(Pageable pageable) throws Exception {
        return repository.findByFechaHoraBajaIsNull(pageable);
    }

    @Override
    public TipoLugar save(TipoLugar entity) throws Exception {
        List<TipoLugar> existentes = repository.findByFechaHoraBajaIsNull()
            .stream()
            .filter(tl -> tl.getNombre().equalsIgnoreCase(entity.getNombre()))
            .toList();
        if (!existentes.isEmpty()) {
            throw new ErrorDeNegocio("Ya existe un TipoLugar activo con ese nombre");
        }
        return super.save(entity);
    }

    @Override
    public TipoLugar update(Long id, TipoLugar entity) throws Exception {
        TipoLugar existente = this.findById(id);
        if (existente.getFechaHoraBaja() != null) {
            throw new ErrorDeNegocio("No se puede modificar un TipoLugar dado de baja");
        }
        entity.setId(id);
        return repository.save(entity);
    }

    public List<DtoTipoLugar> obtenerDtosTipoLugar(){
        List<TipoLugar> tiposLugar = repository.findByFechaHoraBajaIsNull();

        return tiposLugar.stream().map( tipoLugar -> {
            DtoTipoLugar dto= new DtoTipoLugar();
            dto.setId(tipoLugar.getId());
            dto.setNombre(tipoLugar.getNombre());

            return dto;
        }).toList();

    }


}
