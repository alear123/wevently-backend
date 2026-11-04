/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Controllers;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoGrupo;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoPermiso;
import com.wevently.wevently.UsuariosySeguridad.Entities.Grupo;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.UsuariosySeguridad.Services.GrupoService;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import com.wevently.wevently.UsuariosySeguridad.Services.PermisoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/seguridad/grupos")
public class GrupoController extends BaseController<Grupo, Long, GrupoService> {


    public GrupoController(GrupoService service) {
        super(service);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping("/nuevo")
    public ResponseEntity<?> nuevoGrupo(@RequestBody DtoGrupo dto) {
        try {
            this.service.save(dto);
            return new ResponseEntity<>("El grupo se ha añadido con exito", HttpStatus.CREATED);

        }
        catch(ErrorDeNegocio e){
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        catch (Exception e) {
            return new ResponseEntity<>("Se ha producido un error inesperado, intente mas tarde", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/baja")
    public ResponseEntity<?> darBaja(@RequestParam Long id) {
        try {
            this.service.darBaja(id);
            return new ResponseEntity<>("El grupo se ha dado de baja con exito", HttpStatus.OK);

        }
        catch(ErrorDeNegocio e){
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        catch (Exception e) {
            return new ResponseEntity<>("Se ha producido un error inesperado, intente mas tarde", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/permiso/quitar")
    public ResponseEntity<?> quitarPermiso(@RequestParam Long grupo, @RequestParam Long permiso) {
        try {
            this.service.quitarPermiso(grupo,permiso);
            return new ResponseEntity<>("El permiso ha sido quitado con exito", HttpStatus.OK);

        }
        catch(ErrorDeNegocio e){
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        catch (Exception e) {
            return new ResponseEntity<>("Se ha producido un error inesperado, intente mas tarde", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PreAuthorize("isAuthenticated()")
    @PutMapping("/permisos/quitar-multiple")
    public ResponseEntity<?> quitarPermisosMultiple(@RequestParam Long grupo, @RequestBody List<Long> permisosIds) {
        try {
            for (Long permisoId : permisosIds) {
                this.service.quitarPermiso(grupo, permisoId);
            }
            return new ResponseEntity<>("Los permisos han sido quitados con éxito", HttpStatus.OK);
        } catch (ErrorDeNegocio e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            return new ResponseEntity<>("Se ha producido un error inesperado, intente mas tarde",
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/permisos/agregar")
    public ResponseEntity<?> agregarPermisos(@RequestParam Long grupo, @RequestBody List<Long> permisosIds) {
        try {
            this.service.agregarPermisos(grupo,permisosIds);
            return new ResponseEntity<>("Los permisos han sido añadidos con exito", HttpStatus.OK);

        }
        catch(ErrorDeNegocio e){
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        catch (Exception e) {
            return new ResponseEntity<>("Se ha producido un error inesperado, intente mas tarde", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping("/permiso/agregar")
    public ResponseEntity<?> nuevoPermiso(@RequestBody DtoPermiso dto, @RequestParam Long grupo) {
        try{
            service.nuevoPermiso(dto,grupo);
            return new ResponseEntity<>("El permisos ha sido añadido con exito", HttpStatus.OK);
        }
        catch(ErrorDeNegocio e){
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        catch (Exception e) {
            return new ResponseEntity<>("Se ha producido un error inesperado, intente mas tarde", HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    
}
