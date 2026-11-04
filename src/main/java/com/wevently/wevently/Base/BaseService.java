/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Base;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;

/**
 *
 * @author marci
 */
public abstract class BaseService<E extends BaseEntity, ID extends Serializable, R extends BaseRepository<E, ID>> {
    
     protected R repository;

    @Autowired
    public BaseService(R repository) {
        this.repository = repository;
    }

    public E delete(ID id) throws Exception {
        Optional<E> toRemove = this.repository.findById(id);
        if (!toRemove.isPresent()) {
            throw new Exception();
        }
        this.repository.deleteById(id);

        return toRemove.get();
    }

    public void bajaLogica(ID id) throws Exception {
    E entity = findById(id);
    // Usar reflexión para setear fechaHoraBaja si existe
        try {
            var field = entity.getClass().getDeclaredField("fechaHoraBaja");
            field.setAccessible(true);
            if (field.get(entity) != null) {
                throw new ErrorDeNegocio("El registro ya fue dado de baja");
            }
            field.set(entity, LocalDateTime.now());
            repository.save(entity);
        } catch (NoSuchFieldException e) {
            throw new ErrorDeNegocio("La entidad no soporta baja lógica");
        }
    }

    public E findById(ID id) throws Exception {

        E a = this.repository.findById(id).get();
        System.out.println(a.getId());
        return a;
    }

    public Page<E> findAll(Pageable pageable) throws Exception {
        return this.repository.findAll(pageable);
    }

    
    public List<E> findAll() throws Exception {
        return (List<E>) this.repository.findAll();
    }

    
    public E save(E entity) throws Exception {
        return this.repository.save(entity);
    }

    
    public E update(ID id, E entity) throws Exception {
        Optional<E> opt = this.repository.findById(id);
        if (!opt.isPresent()) {
            throw new Exception();
        }
        E oldValue = opt.get();
        entity.setId(oldValue.getId());

        E saved = this.repository.save(entity);

        return saved;
    }
}
