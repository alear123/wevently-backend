/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Controllers;

import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoGrupo;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoPermiso;
import com.wevently.wevently.UsuariosySeguridad.Entities.Permiso;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.UsuariosySeguridad.Enum.MetodoHttp;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import com.wevently.wevently.UsuariosySeguridad.Services.PermisoService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/seguridad/permisos")
public class PermisosController extends BaseController<Permiso, Long, PermisoService> {

    public PermisosController(PermisoService service) {
        super(service);
    }

    @GetMapping("/pantallas")
    public List<String> pantallasPermitidas (){
        try{
            return service.obtenerPantallasPermitidas();
        }
        catch(Exception e){
            List<String> respuesta = new ArrayList<String>();
            respuesta.add(e.getMessage());
            return (respuesta);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/actualizar/{id}")
    public ResponseEntity<?> actualizar(@PathVariable Long id, @RequestBody DtoPermiso dtoPermiso) throws Exception {
        try {
            Permiso permiso = service.findById(id);
            permiso.setRuta(dtoPermiso.getRuta());
            permiso.setDescripcion(dtoPermiso.getDescripcion());
            permiso.setMetodoHttp(MetodoHttp.valueOf(dtoPermiso.getMetodoHttp()));

            return new ResponseEntity<>(service.update(id, permiso), HttpStatus.OK);
        } catch (ErrorDeNegocio e) {
            return new ResponseEntity<>(Map.of("error", e.getMessage()), HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            return new ResponseEntity<>(Map.of("error", "Se ha producido un error inesperado, intente mas tarde"),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
