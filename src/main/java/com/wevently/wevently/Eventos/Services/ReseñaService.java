/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Eventos.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.DTO.DtoObtenerReseña;
import com.wevently.wevently.Eventos.DTO.DtoReseñaCreada;
import com.wevently.wevently.Eventos.Entities.EstadoEvento;
import com.wevently.wevently.Eventos.Entities.Evento;
import com.wevently.wevently.Eventos.Entities.Reseña;
import com.wevently.wevently.Eventos.Repository.EstadoEventoRepository;
import com.wevently.wevently.Eventos.Repository.EventoRepository;
import com.wevently.wevently.Eventos.Repository.ReseñaRepository;
import com.wevently.wevently.Lugares.DTO.DtoReseña;
import com.wevently.wevently.Lugares.Entities.Lugar;
import com.wevently.wevently.Lugares.Repository.LugarRepository;
import com.wevently.wevently.Servicios.Entities.EstadoServicio;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.Servicios.Repository.EstadoServicioRepository;
import com.wevently.wevently.Servicios.Repository.ServicioRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;

import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReseñaService extends BaseService<Reseña, Long, ReseñaRepository> {

        public ReseñaService(ReseñaRepository repository) {
                super(repository);
        }

        @Autowired
        UsuarioRepository repoUsuario;

        @Autowired
        ServicioRepository repoServicio;

        @Autowired
        LugarRepository repoLugar;

        @Autowired
        EstadoServicioRepository repoEstadoServicio;

        @Autowired
        EventoRepository repoEvento;

        @Autowired
        EstadoEventoRepository repoEstadoEvento;

        @Transactional
        public DtoReseña create(DtoReseñaCreada dto, Usuario usuario) throws ErrorDeNegocio {
                Usuario usuarioEncontrado = repoUsuario.findByEmail(usuario.getEmail())
                                .orElseThrow(() -> new EntityNotFoundException(
                                                "Usuario no encontrado con email: " + usuario.getEmail()));
                Evento evento = repoEvento.findById(dto.getIdEvento())
                        .orElseThrow(() -> new EntityNotFoundException(
                                "Evento no encontrado con id: " + dto.getIdEvento()));

                EstadoEvento eerealizado = repoEstadoEvento.findByNombre("Realizado");

                if(!evento.getEstadoEvento().equals(eerealizado)){
                        throw new ErrorDeNegocio("Solo se puede hacer una reseña si el evento está en estado realizado");
                }
                Reseña reseña = new Reseña();
                reseña.setDescripcion(dto.getDescripcion());
                reseña.setEstrellas(dto.getEstrellas());
                reseña.setFechaHoraAlta(LocalDateTime.now());
                reseña.setUsuario(usuarioEncontrado);

                if ("Servicio".equals(dto.getTipo())) {
                        Servicio servicio = repoServicio.findById(dto.getId())
                                        .orElseThrow(() -> new RuntimeException("Servicio no encontrado"));

                        boolean existe = servicio.getReseñas().stream()
                                        .anyMatch(r -> r.getUsuario() != null
                                                        && r.getUsuario().getId().equals(usuarioEncontrado.getId())
                                                        && r.getFechaHoraBaja() == null);

                        if (existe)
                                throw new RuntimeException(
                                                "Un usuario no puede hacerle mas de una reseña a un servicio");

                        EstadoServicio estadoActivo = repoEstadoServicio.findByNombreAndFechaHoraBajaIsNull("Activo")
                                        .orElseThrow(() -> new EntityNotFoundException(
                                                        "Estado del servicio: 'Activo' no encontrado"));

                        if (servicio.getEstadoServicio() == estadoActivo && servicio.getFechaHoraBaja() == null) {
                                servicio.getReseñas().add(reseña);
                        }

                } else if ("Lugar".equals(dto.getTipo())) {
                        Lugar lugar = repoLugar.findById(dto.getId())
                                        .orElseThrow(() -> new RuntimeException("Lugar no encontrado"));

                        boolean existe = lugar.getReseñas().stream()
                                        .anyMatch(r -> r.getUsuario() != null
                                                        && r.getUsuario().getId().equals(usuarioEncontrado.getId())
                                                        && r.getFechaHoraBaja() == null);

                        if (existe)
                                throw new RuntimeException("Un usuario no puede hacerle mas de una reseña a un lugar");

                        if (lugar.getFechaHoraBaja() == null) {
                                lugar.getReseñas().add(reseña);
                        }
                }

                repository.save(reseña);

                DtoReseña dtoreseña = new DtoReseña();
                dtoreseña.setComentario(reseña.getDescripcion());
                dtoreseña.setRating(reseña.getEstrellas());
                dtoreseña.setId(reseña.getId());
                return dtoreseña;
        }

        @Transactional
        public DtoReseña update(DtoReseñaCreada dto, Usuario usuario, Long idReseña) {
                Usuario usuarioEncontrado = repoUsuario.findByEmail(usuario.getEmail())
                                .orElseThrow(
                                                () -> new EntityNotFoundException("Usuario no encontrado con email: "
                                                                + usuario.getEmail()));
                Reseña reseña = repository.findById(idReseña)
                                .orElseThrow(() -> new EntityNotFoundException(
                                                "Reseña no encontrada con el id" + idReseña));
                reseña.setDescripcion(dto.getDescripcion());
                reseña.setEstrellas(dto.getEstrellas());
                reseña.setFechaHoraModificacion(LocalDateTime.now());
                repository.save(reseña);
                DtoReseña dtoreseña = new DtoReseña();
                dtoreseña.setComentario(reseña.getDescripcion());
                dtoreseña.setRating(reseña.getEstrellas());
                dtoreseña.setId(reseña.getId());
                return dtoreseña;
        }

        @Transactional
        public DtoReseña delete(Usuario usuario, Long idReseña) {
                Usuario usuarioEncontrado = repoUsuario.findByEmail(usuario.getEmail())
                                .orElseThrow(
                                                () -> new EntityNotFoundException("Usuario no encontrado con email: "
                                                                + usuario.getEmail()));
                Reseña reseña = repository.findById(idReseña)
                                .orElseThrow(() -> new EntityNotFoundException(
                                                "Reseña no encontrada con el id" + idReseña));
                reseña.setFechaHoraBaja(LocalDateTime.now());
                repository.save(reseña);
                DtoReseña dtoreseña = new DtoReseña();
                dtoreseña.setComentario(reseña.getDescripcion());
                dtoreseña.setRating(reseña.getEstrellas());
                dtoreseña.setId(reseña.getId());
                return dtoreseña;
        }

        public DtoReseña ObtenerReseñaDeUnUsuario(Usuario usuario, DtoObtenerReseña dto) {
                Usuario usuarioEncontrado = repoUsuario.findByEmail(usuario.getEmail())
                                .orElseThrow(() -> new EntityNotFoundException(
                                                "Usuario no encontrado con email: " + usuario.getEmail()));

                Optional<Reseña> optResena = Optional.empty();

                if ("Lugar".equals(dto.getTipo())) {
                        Lugar lugar = repoLugar.findById(dto.getId())
                                        .orElseThrow(() -> new EntityNotFoundException("Lugar no encontrado"));
                        optResena = lugar.getReseñas().stream()
                                        .filter(r -> r.getUsuario().getId().equals(usuarioEncontrado.getId()))
                                        .filter(r -> r.getFechaHoraBaja() == null)
                                        .findFirst();
                } else if ("Servicio".equals(dto.getTipo())) {
                        Servicio servicio = repoServicio.findById(dto.getId())
                                        .orElseThrow(() -> new EntityNotFoundException("Servicio no encontrado"));
                        optResena = servicio.getReseñas().stream()
                                        .filter(r -> r.getUsuario().getId().equals(usuarioEncontrado.getId()))
                                        .filter(r -> r.getFechaHoraBaja() == null)
                                        .findFirst();
                }


                if (optResena.isEmpty()) {
                        return null;
                }

                Reseña reseña = optResena.get();
                DtoReseña dtoreseña = new DtoReseña();
                dtoreseña.setComentario(reseña.getDescripcion());
                dtoreseña.setRating(reseña.getEstrellas());
                dtoreseña.setId(reseña.getId());
                return dtoreseña;
        }
}
