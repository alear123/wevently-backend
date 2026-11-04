package com.wevently.wevently.Servicios.Services;

import org.springframework.stereotype.Service;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Servicios.DTO.DTOEstadoServicio;
import com.wevently.wevently.Servicios.Entities.EstadoServicio;
import com.wevently.wevently.Servicios.Repository.EstadoServicioRepository;

import jakarta.persistence.EntityNotFoundException;

import java.util.List;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;

@Service
public class EstadoServicioService extends BaseService<EstadoServicio, Long, EstadoServicioRepository> {

    public EstadoServicioService(EstadoServicioRepository repository) {
        super(repository);
    }

    public List<DTOEstadoServicio> ObtenerTodos() {
        try {
            List<EstadoServicio> estadosDisponibles = repository.findByFechaHoraBajaIsNull();

            List<DTOEstadoServicio> estados = new ArrayList<>();
            for (EstadoServicio estado : estadosDisponibles) {
                estados.add(DTOEstadoServicio.builder()
                        .idEstadoServicio(estado.getId())
                        .nombreEstado(estado.getNombre())
                        .fechaHoraAlta(estado.getFechaHoraAlta())
                        .fechaHoraBaja(estado.getFechaHoraBaja())
                        .build());
            }
            return estados;
        } catch (Exception e) {
            throw new RuntimeException("Error al obtener estados de servicio", e);
        }
    }

    public EstadoServicio obtenerUno(Long id) {
        try {
            return repository.findById(id)
                    .orElseThrow(() -> new EntityNotFoundException("No se encontró el estado con id: " + id));
        } catch (Exception e) {
            throw new RuntimeException("Error al buscar el EstadoServicio", e);
        }
    }

    public DTOEstadoServicio hacerDTO(Long id) {
        EstadoServicio est = obtenerUno(id);
        return DTOEstadoServicio.builder()
                .nombreEstado(est.getNombre())
                .idEstadoServicio(est.getId())
                .fechaHoraAlta(est.getFechaHoraAlta())
                .fechaHoraBaja(est.getFechaHoraBaja())
                .build();
    }

    public EstadoServicio actualizarUno(Long id) {
        try {
            EstadoServicio est = obtenerUno(id);

            return super.update(id, est);
        } catch (Exception e) {
            throw new RuntimeException("Error al modificar el EstadoServicio", e);
        }
    }

    public EstadoServicio eliminarUno(Long id) {
        try {
            EstadoServicio est = obtenerUno(id);
            est.setFechaHoraBaja(LocalDateTime.now(ZoneId.of("America/Argentina/Buenos_Aires")));
            return repository.save(est);
        } catch (Exception e) {
            throw new RuntimeException("Error al eliminar el EstadoServicio", e);
        }
    }
}
