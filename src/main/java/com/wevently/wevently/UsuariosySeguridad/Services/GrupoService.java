/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoGrupo;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoPermiso;
import com.wevently.wevently.UsuariosySeguridad.Entities.Grupo;
import com.wevently.wevently.UsuariosySeguridad.Entities.Permiso;
import com.wevently.wevently.UsuariosySeguridad.Enum.MetodoHttp;
import com.wevently.wevently.UsuariosySeguridad.Enum.TipoPermiso;
import com.wevently.wevently.UsuariosySeguridad.Repository.GrupoRepository;
import com.wevently.wevently.UsuariosySeguridad.Repository.PermisoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

@Service
public class GrupoService extends BaseService<Grupo, Long, GrupoRepository> {
    @Autowired
    public PermisoService permisoService;
    @Autowired
    private PermisoRepository permisoRepository;

    public GrupoService(GrupoRepository repository) {
        super(repository);
    }

    @Override
    public Page<Grupo> findAll(Pageable pageable) throws Exception {
        Page<Grupo> grupos = this.repository.findByFechaHoraBajaIsNull(PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), Sort.by("nombre").ascending())
        );
        return grupos;

    }

    public Grupo save(DtoGrupo dto) throws Exception {
        List<Permiso> permisos = new ArrayList<>();
        Long ID = 0L;

        try {
            if (dto.nombre == null || dto.nombre.isEmpty()) {
                throw new ErrorDeNegocio("El nombre no puede ser vacio");
            }
            if (Character.isDigit(dto.nombre.charAt(0))) {
                throw new ErrorDeNegocio("El nombre no puede comenzar con digitos numericos");
            }
            if (dto.descripcion == null || dto.descripcion.isEmpty()) {
                throw new ErrorDeNegocio("La descripcion no puede estar vacia");
            }
            if (repository.existsByNombre(dto.nombre)) {
                throw new ErrorDeNegocio("Ya existe un grupo con el nombre ingresado");
            }
            if (dto.permisos.isEmpty()) {
                throw new ErrorDeNegocio("Debe seleccionar por lo menos un permiso");
            }
            if (dto.nombre.length() > 25) {
                throw new ErrorDeNegocio("El nombre no puede exceder los 25 caracteres");
            }
            if (dto.nombre.contains(" ")) {
                throw new ErrorDeNegocio("El nombre no puede contener espacios en blanco");
            }
            if (dto.descripcion.length() > 50) {
                throw new ErrorDeNegocio("La descripcion no puede exceder los 50 caracteres");
            }

            for (Long id : dto.permisos) {
                ID = id;
                permisos.add(permisoService.findById(id));
            }
            Grupo grupo = new Grupo(dto.nombre, dto.descripcion, LocalDateTime.now(), null, permisos);
            return repository.save(grupo);
        } catch (NoSuchElementException e) {
            throw new ErrorDeNegocio("No existe permiso con ID: " + ID);
        }

    }

    public void darBaja(Long id) throws Exception {
        try {
            Grupo grupo = this.findById(id);
            if (grupo != null) {
                if(grupo.getFechaHoraBaja() != null) {
                    throw new ErrorDeNegocio("El grupo ya ha sido dado de baja");
                }
                grupo.setFechaHoraBaja(LocalDateTime.now());
                this.save(grupo);
            }
        } catch (NoSuchElementException e) {
            throw new ErrorDeNegocio("No existe grupo con ID: " + id);

        }
    }

    public void quitarPermiso(Long grupoId, Long permisoId) throws Exception {
        try {
            Grupo grupo = this.findById(grupoId);
            if (grupo != null) {
                if(grupo.getFechaHoraBaja() != null) {
                    throw new ErrorDeNegocio("El grupo ya ha sido dado de baja");
                }
                try {
                    grupo.getPermisos().remove(permisoService.findById(permisoId));
                }
                catch(NoSuchElementException e) {
                    throw new ErrorDeNegocio("No existe permiso con ID: " + grupoId);
                }
                this.save(grupo);
            }
        } catch (NoSuchElementException e) {
            throw new ErrorDeNegocio("No existe grupo con ID: " + grupoId);

        }
    }

    public void agregarPermisos(Long idGrupo,List<Long> Ids) throws Exception {
        try {
            Grupo grupo = this.findById(idGrupo);
            if (grupo != null) {
                if (grupo.getFechaHoraBaja() != null) {
                    throw new ErrorDeNegocio("El grupo ya ha sido dado de baja");
                }
            }
            else{
                throw new ErrorDeNegocio("No existe grupo con ID: " + idGrupo);
            }
            for(Long id : Ids) {
                Permiso permiso = this.permisoService.findById(id);
                if (permiso == null) {
                    throw new ErrorDeNegocio("El permiso con ID: "+id+" no existe");
                }
                if(grupo.getPermisos().contains(permiso)){

                    throw new ErrorDeNegocio("El grupo ya contiene el permiso");
                }
               grupo.getPermisos().add(permiso);
            }
           this.save(grupo);

        } catch (NoSuchElementException e) {
            throw new ErrorDeNegocio("No existe grupo con ID: " + idGrupo);

        }
    }

    public void nuevoPermiso(DtoPermiso dto, Long grupoId) throws Exception {
        try {
            Grupo grupo = this.findById(grupoId);
            if (grupo != null) {
                if(grupo.getFechaHoraBaja() != null) {
                    throw new ErrorDeNegocio("El grupo ya ha sido dado de baja");
                }
                if(dto.ruta.isEmpty()){
                    throw new ErrorDeNegocio("El nombre de la ruta no puede ser vacio ");
                }
                if(!dto.ruta.startsWith("/")){
                    throw new ErrorDeNegocio("El nombre de la ruta debe comenzar con: '/' ");

                }
                if(!dto.metodoHttp.equals(MetodoHttp.GET.name())
                && !dto.metodoHttp.equals(MetodoHttp.POST.name())
                && !dto.metodoHttp.equals(MetodoHttp.DELETE.name())
                && !dto.metodoHttp.equals(MetodoHttp.PUT.name()))
                {
                    throw new ErrorDeNegocio("Metodo HTTP incorrecto");
                }
               if(permisoRepository.existsByRutaAndMetodoHttp(dto.ruta,MetodoHttp.valueOf(dto.metodoHttp))){
                    throw new ErrorDeNegocio("Ya existe un permiso con la ruta y metodo especificados");

               }
               Permiso permiso = permisoRepository.save(new Permiso (
                       dto.ruta,
                       MetodoHttp.valueOf(dto.metodoHttp),
                       dto.descripcion,
                       LocalDateTime.now(),
                       null,
                       TipoPermiso.PANTALLA));

                grupo.getPermisos().add(permiso);

                this.save(grupo);
            }
            else{
                throw new NoSuchElementException("No existe grupo con ID: " + grupoId);
            }

        } catch (NoSuchElementException e) {
            throw new ErrorDeNegocio(e.getMessage());

        }
    }
}
