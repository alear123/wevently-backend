/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Base;

import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.DTO.DtoNuevoEvento;
import com.wevently.wevently.Eventos.Entities.Evento;

import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 *
 * @author marci
 */
public abstract class BaseController<E extends BaseEntity, ID extends java.io.Serializable, S extends BaseService<E, ID, ?>> {

    protected S service;

    @Autowired
    public BaseController(S service) {
        this.service = service;
    }

    @GetMapping
    public List<E> getAll() throws Exception {
        return service.findAll();
    }

    @GetMapping("/get")
    public Page<E> getAll(Pageable pageable) throws Exception {
        return service.findAll(pageable);
    }

    @GetMapping("/{id}")
    public E getById(@PathVariable ID id) throws Exception {
        return service.findById(id);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping
    public ResponseEntity<?> create(@RequestBody E entity) {
        try {
            return new ResponseEntity<>(service.save(entity), HttpStatus.CREATED);
        } catch (ErrorDeNegocio e) {
            return new ResponseEntity<>(Map.of("error", e.getMessage()), HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            return new ResponseEntity<>(Map.of("error", "Se ha producido un error inesperado, intente mas tarde"),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable ID id, @RequestBody E entity) throws Exception {
        try {
            return new ResponseEntity<>(service.update(id, entity), HttpStatus.OK);
        } catch (ErrorDeNegocio e) {
            return new ResponseEntity<>(Map.of("error", e.getMessage()), HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            return new ResponseEntity<>(Map.of("error", "Se ha producido un error inesperado, intente mas tarde"),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/baja/{id}")
    public ResponseEntity<?> bajaLogica(@PathVariable ID id) {
        try {
            service.bajaLogica(id);
            return ResponseEntity.ok(Map.of("mensaje", "El registro fue dado de baja correctamente"));
        } catch (ErrorDeNegocio e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", "Error inesperado"));
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @DeleteMapping("/{id}")
    public void delete(@PathVariable ID id) throws Exception {
        service.delete(id);
    }

}
