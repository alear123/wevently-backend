package com.wevently.wevently.Servicios.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Servicios.DTO.DtoTipoServicio;
import com.wevently.wevently.Servicios.Entities.TipoServicio;
import com.wevently.wevently.Servicios.Repository.TipoServicioRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TipoServicioService extends BaseService<TipoServicio,Long, TipoServicioRepository> {

    public TipoServicioService(TipoServicioRepository repository) {
        super(repository);
    }

    @Override
    public List<TipoServicio> findAll() throws Exception {
        return repository.findByFechaHoraBajaIsNull();
    }

    @Override
    public Page<TipoServicio> findAll(Pageable pageable) throws Exception {
        return repository.findByFechaHoraBajaIsNull(pageable);
    }

    @Override
    public TipoServicio save(TipoServicio entity) throws Exception {
        List<TipoServicio> existentes = repository.findByFechaHoraBajaIsNull()
            .stream()
            .filter(ts -> ts.getNombre().equalsIgnoreCase(entity.getNombre()))
            .toList();
        if (!existentes.isEmpty()) {
            throw new ErrorDeNegocio("Ya existe un TipoServicio activo con ese nombre");
        }
        return super.save(entity);
    }

    @Override
    public TipoServicio update(Long id, TipoServicio entity) throws Exception {
        TipoServicio existente = this.findById(id);
        if (existente.getFechaHoraBaja() != null) {
            throw new ErrorDeNegocio("No se puede modificar un TipoServicio dado de baja");
        }
        entity.setId(id);
        return repository.save(entity);
    }

    public List<DtoTipoServicio> getDtosTipoServicio (){
        List<TipoServicio> tiposServicio = repository.findByFechaHoraBajaIsNull();
        return tiposServicio.stream().map(tipoServicio -> {
            DtoTipoServicio dto = new DtoTipoServicio();
            dto.setId(tipoServicio.getId());
            dto.setNombre(tipoServicio.getNombre());
            return dto;
        }).toList();
    }
}

