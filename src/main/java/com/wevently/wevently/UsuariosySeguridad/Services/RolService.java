package com.wevently.wevently.UsuariosySeguridad.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.UsuariosySeguridad.Entities.Rol;
import com.wevently.wevently.UsuariosySeguridad.Entities.Grupo;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Entities.UsuarioRol;
import com.wevently.wevently.UsuariosySeguridad.Entities.Permiso;
import com.wevently.wevently.UsuariosySeguridad.Enum.TipoPermiso;
import com.wevently.wevently.UsuariosySeguridad.Repository.RolRepository;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;
import com.wevently.wevently.UsuariosySeguridad.Repository.GrupoRepository;
import com.wevently.wevently.UsuariosySeguridad.DTO.DtoRol;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.*;
import java.time.LocalDateTime;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Page;

@Service
public class RolService extends BaseService<Rol, Long, RolRepository> {

    @Autowired
    private UsuarioRepository usuarioRepository;

    public RolService(RolRepository repository) {
        super(repository);
    }

    public Page<DtoRol> obtenerRolesPaginados(int page, int size, Boolean estado, String busqueda) {
        Pageable pageable = PageRequest.of(page, size);

        // Si tienes ambos filtros
        if (estado != null && busqueda != null && !busqueda.isBlank()) {
            return repository.findByActivoAndNombreContainingIgnoreCase(
                    estado, busqueda, pageable).map(DtoRol::fromEntity);
        }
        // Solo filtro por estado
        if (estado != null) {
            return repository.findByActivo(
                    estado, pageable).map(DtoRol::fromEntity);
        }
        // Solo filtro por búsqueda
        if (busqueda != null && !busqueda.isBlank()) {
            return repository.findByNombreContainingIgnoreCase(
                    busqueda, pageable).map(DtoRol::fromEntity);
        }
        // Sin filtros
        Page<Rol> rolesPage = repository.findAll(pageable);
        return rolesPage.map(DtoRol::fromEntity);
    }

    public Rol findByNombre(String nombre) throws Exception {
        try {
            Rol rol = this.repository.findByNombre(nombre).get();
            return rol;
        } catch (NoSuchElementException e) {
            throw new Exception("Error: El rol " + nombre + " no existe");
        }
    }

    public Rol crearRol(DtoRol dto, GrupoRepository grupoRepository) throws Exception {
        if (dto.getNombre() == null || dto.getNombre().trim().isEmpty()) {
            throw new Exception("El nombre del rol no puede estar vacío");
        }
        if (repository.findByNombre(dto.getNombre()).isPresent()) {
            throw new Exception("Ya existe un rol con ese nombre");
        }

        Rol rol = new Rol();
        rol.setNombre(dto.getNombre());
        rol.setDescripcion(dto.getDescripcion());
        rol.setActivo(dto.isActivo());
        rol.setTienePrivilegios(dto.isTienePrivilegios());
        rol.setPantallaInicio(dto.getPantallaInicio());
        rol.setFechaHoraAlta(LocalDateTime.now());
        rol.setFechaHoraBaja(dto.isActivo() ? null : LocalDateTime.now());

        // Asociar grupos y validar pantallaInicio
        List<Grupo> grupos = new ArrayList<>();
        Set<String> rutasPermisos = new HashSet<>();
        if (dto.getGruposIds() != null) {
            for (Long id : dto.getGruposIds()) {
                Grupo grupo = grupoRepository.findById(id)
                        .orElseThrow(() -> new Exception("Grupo no encontrado: " + id));
                grupos.add(grupo);

                // Recolectar rutas de permisos
                if (grupo.getPermisos() != null) {
                    for (Permiso permiso : grupo.getPermisos()) {
                        rutasPermisos.add(permiso.getRuta());
                    }
                }
            }
        }
        if (!rutasPermisos.contains(dto.getPantallaInicio())) {
            throw new Exception("La pantalla de inicio debe ser una ruta de los permisos de los grupos seleccionados");
        }
        rol.setGrupos(grupos);

        return repository.save(rol);
    }

    public Rol actualizarRol(Long id, DtoRol dto, GrupoRepository grupoRepository) throws Exception {
        Rol rol = repository.findById(id)
                .orElseThrow(() -> new Exception("Rol no encontrado"));

        rol.setNombre(dto.getNombre());
        rol.setDescripcion(dto.getDescripcion() != null ? dto.getDescripcion() : "");
        rol.setActivo(dto.isActivo());
        rol.setTienePrivilegios(dto.isTienePrivilegios());
        rol.setPantallaInicio(dto.getPantallaInicio());
        rol.setFechaHoraBaja(dto.isActivo() ? null : LocalDateTime.now());

        // Asociar nuevos grupos y validar pantallaInicio
        List<Grupo> grupos = new ArrayList<>();
        Set<String> rutasPermisos = new HashSet<>();
        if (dto.getGruposIds() != null) {
            for (Long gid : dto.getGruposIds()) {
                Grupo grupo = grupoRepository.findById(gid)
                        .orElseThrow(() -> new Exception("Grupo no encontrado: " + gid));
                grupos.add(grupo);

                // Recolectar rutas de permisos
                if (grupo.getPermisos() != null) {
                    for (Permiso permiso : grupo.getPermisos()) {
                        rutasPermisos.add(permiso.getRuta());
                    }
                }
            }
        }
        if (!rutasPermisos.contains(dto.getPantallaInicio())) {
            throw new Exception("La pantalla de inicio debe ser una ruta de los permisos de los grupos seleccionados");
        }
        rol.setGrupos(grupos);

        return repository.save(rol);
    }

    // Cambiar el estado del rol, y hacer la baja logica si se desactiva
    public Rol cambiarEstadoRol(Long id, boolean activo) throws Exception {
        Rol rol = repository.findById(id)
                .orElseThrow(() -> new Exception("Rol no encontrado"));

        if (!activo) {
            // Validar usuarios antes de desactivar
            List<Usuario> usuarios = usuarioRepository.findUsuariosActivosByRolId(id);
            for (Usuario usuario : usuarios) {
                long rolesActivos = usuario.getUsuarioRoles().stream()
                        .filter(r -> r.getFechaHoraBaja() == null)
                        .count();
                if (rolesActivos == 1) {
                    throw new Exception(
                            "No se puede desactivar el rol porque hay usuarios que solo tienen este rol asignado.");
                }
            }
            rol.setFechaHoraBaja(LocalDateTime.now());
        } else {
            rol.setFechaHoraBaja(null);
        }
        rol.setActivo(activo);
        return repository.save(rol);
    }

    // Baja física
    public void eliminarRol(Long id) throws Exception {
        Rol rol = repository.findById(id)
                .orElseThrow(() -> new Exception("Rol no encontrado"));

        // Validar usuarios antes de eliminar (misma lógica que para desactivar)
        List<Usuario> usuarios = usuarioRepository.findUsuariosActivosByRolId(id);
        for (Usuario usuario : usuarios) {
            long rolesActivos = usuario.getUsuarioRoles().stream()
                    .filter(r -> r.getFechaHoraBaja() == null)
                    .count();
            if (rolesActivos == 1) {
                throw new Exception(
                        "No se puede eliminar el rol porque hay usuarios que solo tienen este rol asignado.");
            }
        }

        // Eliminar físicamente el rol
        repository.delete(rol);
    }
    //Roles sin permisos para cuando hay un registro nuevo de usuario
    public List<DtoRol> obtenerRolesSinPrivilegios() {
        Iterable<Rol> rolesIterable = repository.findAll();
        return StreamSupport.stream(rolesIterable.spliterator(), false)
                .filter(r -> !r.isTienePrivilegios() && r
                        .isActivo())
                .map(DtoRol::fromEntity) // <-- convierte cada Rol en DtoRol
                .collect(Collectors.toList());
    }
    //Mostrar las posibles pantallas de inicio según los grupos de permisos seleccionados
    public List<String> obtenerPantallasInicioPosibles(String rolNombre)
            throws Exception {
        List<String> pantallas = new ArrayList<>();
        Optional<Rol> rol = repository.findByNombre(rolNombre);
        if(rol.isPresent()){
            for(Grupo grupo : rol.get().getGrupos()){
                for(Permiso permiso : grupo.getPermisos()){
                    if(permiso.getTipoPermiso().equals(TipoPermiso.PANTALLA)){
                        pantallas.add(permiso.getRuta());
                    }
                }
            }
            return pantallas;
        }
        throw new ErrorDeNegocio("No se ha encontrado una insancia de Rol con el nombre indicado");
    }

    public List<String> obtenerPantallasInicioPosibles(List<Long> gruposIds, GrupoRepository grupoRepository)
            throws Exception {
        Set<String> rutasPermisos = new HashSet<>();
        if (gruposIds != null) {
            for (Long id : gruposIds) {
                Grupo grupo = grupoRepository.findById(id)
                        .orElseThrow(() -> new Exception("Grupo no encontrado: " + id));
                if (grupo.getPermisos() != null) {
                    for (Permiso permiso : grupo.getPermisos()) {
                        rutasPermisos.add(permiso.getRuta());
                    }
                }
            }
        }
        return new ArrayList<>(rutasPermisos);
    }
}
