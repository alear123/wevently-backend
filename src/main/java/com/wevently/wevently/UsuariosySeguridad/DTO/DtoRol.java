package com.wevently.wevently.UsuariosySeguridad.DTO;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

import com.wevently.wevently.UsuariosySeguridad.Entities.Grupo;
import com.wevently.wevently.UsuariosySeguridad.Entities.Rol;

@Getter
@Setter
public class DtoRol {
    private Long id;
    private String nombre;
    private String descripcion;
    private boolean activo;
    private boolean tienePrivilegios;
    private String pantallaInicio;
    private List<Long> gruposIds;
    private int cantidadUsuarios;
    private LocalDateTime fechaHoraAlta;

    public static DtoRol fromEntity(Rol rol) {
        DtoRol dto = new DtoRol();
        dto.setId(rol.getId());
        dto.setNombre(rol.getNombre());
        dto.setDescripcion(rol.getDescripcion());
        dto.setPantallaInicio(rol.getPantallaInicio());
        dto.setActivo(rol.isActivo());
        dto.setTienePrivilegios(rol.isTienePrivilegios());
        dto.setFechaHoraAlta(rol.getFechaHoraAlta());
        if (rol.getGrupos() != null) {
            dto.setGruposIds(rol.getGrupos().stream().map(Grupo::getId).toList());
        }
        // Si tienes una relación con usuarios:
        if (rol.getUsuarioRoles() != null) {
            dto.setCantidadUsuarios((int) rol.getUsuarioRoles().stream()
                    .filter(ur -> ur.getFechaHoraBaja() == null)
                    .count());
        } else {
            dto.setCantidadUsuarios(0);
        }
        return dto;
    }
}