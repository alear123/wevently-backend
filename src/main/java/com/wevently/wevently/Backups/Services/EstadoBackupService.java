package com.wevently.wevently.Backups.Services;

import com.wevently.wevently.Backups.DTO.DtoBajaEstadoBackup;
import com.wevently.wevently.Backups.Entities.BackupEstadoBackup;
import com.wevently.wevently.Backups.Repository.BackupEstadoBackupRepository;
import com.wevently.wevently.Eventos.Entities.EstadoEvento;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import com.wevently.wevently.Servicios.DTO.DtoNuevoServicio;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wevently.wevently.Backups.Entities.EstadoBackup;
import com.wevently.wevently.Backups.Repository.EstadoBackupRepository;
import com.wevently.wevently.Base.BaseService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class EstadoBackupService extends BaseService<EstadoBackup, Long, EstadoBackupRepository> {

    @Autowired
    UsuarioRepository repoUsuario;

    @Autowired
    EstadoBackupRepository repoEstadoBackup;

    @Autowired
    BackupEstadoBackupRepository repobeb;

    public EstadoBackupService(EstadoBackupRepository repository) {
        super(repository);
    }

    @Override
    public List<EstadoBackup> findAll() throws Exception {
        return (List<EstadoBackup>) repository.findAll();
    }

    @Transactional
        public DtoBajaEstadoBackup darBajaEstadoBackup(Long estadoId, String email) throws Exception {
        // Buscar usuario
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado"));

        // Buscar estado
        EstadoBackup estado = repoEstadoBackup.findById(estadoId)
                .orElseThrow(() -> new EntityNotFoundException("Estado no encontrado"));

        // Validar si el estado está asociado a alguna BackupConfiguracion
        boolean estaAsociado = repobeb.existsByEstadoBackupId(estadoId);
        if (estaAsociado) {
            throw new IllegalStateException("No se puede borrar el estado porque está asociado a un backup");
        }

        // Realizar la baja lógica
        estado.setFechaHoraBaja(LocalDateTime.now());
        repoEstadoBackup.save(estado);

        // Armar y retornar DTO de respuesta
        DtoBajaEstadoBackup dto = new DtoBajaEstadoBackup();
        dto.setId(estado.getId());
        dto.setNombre(estado.getNombre());
        dto.setFechaHoraBaja(estado.getFechaHoraBaja());
        dto.setUsuarioResponsable(usuario.getEmail());
        dto.setMensaje("Estado dado de baja correctamente");

        return dto;
    }

    @Transactional
    public DtoBajaEstadoBackup rehabilitarEstadoBackup(Long estadoId, String email) throws Exception {
        // Buscar usuario
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado"));

        // Buscar estado
        EstadoBackup estado = repoEstadoBackup.findById(estadoId)
                .orElseThrow(() -> new EntityNotFoundException("Estado no encontrado"));

        // Validar que esté dado de baja
        if (estado.getFechaHoraBaja() == null) {
            throw new IllegalStateException("El estado ya se encuentra habilitado");
        }

        // Rehabilitar el estado
        estado.setFechaHoraBaja(null);
        repoEstadoBackup.save(estado);

        // Crear DTO de respuesta
        DtoBajaEstadoBackup dto = new DtoBajaEstadoBackup();
        dto.setId(estado.getId());
        dto.setNombre(estado.getNombre());
        dto.setFechaHoraBaja(null);
        dto.setUsuarioResponsable(usuario.getEmail());
        dto.setMensaje("Estado habilitado nuevamente correctamente");

        return dto;
    }

}
