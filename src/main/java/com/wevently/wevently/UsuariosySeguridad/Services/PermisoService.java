/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.UsuariosySeguridad.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.UsuariosySeguridad.Entities.Grupo;
import com.wevently.wevently.UsuariosySeguridad.Entities.Permiso;
import com.wevently.wevently.UsuariosySeguridad.Entities.Rol;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Enum.MetodoHttp;
import com.wevently.wevently.UsuariosySeguridad.Enum.TipoPermiso;
import com.wevently.wevently.UsuariosySeguridad.Repository.PermisoRepository;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PermisoService extends BaseService<Permiso,Long,PermisoRepository>{

    @Autowired
    private RequestMappingHandlerMapping handlerMapping;
    @Autowired
    private UsuariosService usuariosService;
    @Autowired
    private UsuarioDetailsService usuarioDetailsService;

    public PermisoService(PermisoRepository repository) {
        super(repository);
    }

    public void registrarEndpoints() {
        handlerMapping.getHandlerMethods().forEach((mapping, method) -> {

            // Obtener rutas (pueden venir de PatternsCondition o PathPatternsCondition)
            var patternsCondition = mapping.getPatternsCondition();
            var pathPatternsCondition = mapping.getPathPatternsCondition();

            if ((patternsCondition == null || patternsCondition.getPatterns().isEmpty()) &&
                    (pathPatternsCondition == null || pathPatternsCondition.getPatternValues().isEmpty())) {
                // No hay rutas válidas, ignorar
                return;
            }

            // Usar patternsCondition si existe, sino pathPatternsCondition
            var rutas = (patternsCondition != null && !patternsCondition.getPatterns().isEmpty())
                    ? patternsCondition.getPatterns()
                    : pathPatternsCondition.getPatternValues();

            rutas.forEach(url -> {
                mapping.getMethodsCondition().getMethods().forEach(httpMethod -> {
                    MetodoHttp metodoEnum = MetodoHttp.valueOf(httpMethod.name());

                    if (!repository.existsByRutaAndMetodoHttp(url, metodoEnum)) {
                        repository.save(new Permiso(
                                url,
                                metodoEnum,
                                "",
                                LocalDateTime.now(),
                                null,
                                TipoPermiso.API
                        ));
                    }
                });
            });
        });

    }

    @Override
    public Permiso update(Long id, Permiso entity) throws Exception {
        if(entity.getRuta().isEmpty()){
            throw new ErrorDeNegocio("El nombre de la ruta no puede ser vacio ");
        }
        if(!entity.getRuta().startsWith("/")){
            throw new ErrorDeNegocio("El nombre de la ruta debe comenzar con: '/' ");

        }
        if(!entity.getMetodoHttp().equals(MetodoHttp.GET)
                && !entity.getMetodoHttp().equals(MetodoHttp.POST)
                && !entity.getMetodoHttp().equals(MetodoHttp.DELETE)
                && !entity.getMetodoHttp().equals(MetodoHttp.PUT))
        {
            throw new ErrorDeNegocio("Metodo HTTP incorrecto");
        }
        if(!repository.existsByRutaAndMetodoHttp(entity.getRuta(),entity.getMetodoHttp())){
            throw new ErrorDeNegocio("No existe un permiso con la ruta y metodo especificados");

        }
        Optional<Permiso> opt = this.repository.findById(id);
        if (!opt.isPresent()) {
            throw new Exception();
        }
        Permiso oldValue = opt.get();
        entity.setId(oldValue.getId());

        Permiso saved = this.repository.save(entity);

        return saved;
    }

    public Permiso findByRutaAndMetodoHttp(String ruta, MetodoHttp metodo){
        try{
            if(repository.existsByRutaAndMetodoHttp(ruta, metodo)) {
                return repository.findByRutaAndMetodoHttp(ruta, metodo).get();
            }
            throw new ErrorDeNegocio("No se encontro una instancia de Permiso con la ruta y el metodo HTTP especificado");
        }
        catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }

    }

    public List<String> obtenerPantallasPermitidas() throws Exception {
        Usuario usuario = usuarioDetailsService.getCurrentUser();
        Rol rol = usuariosService.getCurrentRol(usuario);
        List<String> pantallas = new ArrayList<>();
        for(Grupo grupo : rol.getGrupos()){
            for(Permiso permiso : grupo.getPermisos()){
                if(permiso.getTipoPermiso().equals(TipoPermiso.PANTALLA)){
                    pantallas.add(permiso.getRuta());
                }
            }
        }
        return pantallas;
    }
}
