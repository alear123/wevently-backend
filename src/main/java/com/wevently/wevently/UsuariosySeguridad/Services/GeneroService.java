/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.UsuariosySeguridad.Entities.Genero;
import com.wevently.wevently.UsuariosySeguridad.Entities.Grupo;
import com.wevently.wevently.UsuariosySeguridad.Entities.Rol;
import com.wevently.wevently.UsuariosySeguridad.Repository.GeneroRepository;
import com.wevently.wevently.UsuariosySeguridad.Repository.GrupoRepository;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;

@Service
public class GeneroService extends BaseService<Genero,Long,GeneroRepository>{

    public GeneroService(GeneroRepository repository) {
        super(repository);
    }

    public Genero findByNombre(String nombre) throws Exception {

        try {
            return this.repository.findByNombre(nombre).get();
        }
        catch(NoSuchElementException e){
            System.out.println("Error: El genero " + nombre + " no existe");
            throw new Exception("Error: El genero " + nombre + " no existe");
        }
    }
}
