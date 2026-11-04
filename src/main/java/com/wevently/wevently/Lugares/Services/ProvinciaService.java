/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Lugares.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Lugares.DTO.DTOProvincia2;
import com.wevently.wevently.Lugares.DTO.DtoLocalidad;
import com.wevently.wevently.Lugares.DTO.DtoProvincia;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.Provincia;
import com.wevently.wevently.Lugares.Repository.ProvinciaRepository;
import com.wevently.wevently.Lugares.Repository.LocalidadRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import java.util.HashMap;
import java.util.List;

@Service
public class ProvinciaService extends BaseService<Provincia, Long, ProvinciaRepository> {

    @Autowired
    LocalidadRepository localidadRepository;

    public ProvinciaService(ProvinciaRepository repository) {
        super(repository);
    }

    public List<Provincia> findAll() {
        return StreamSupport.stream(repository.findAll().spliterator(), false)
                .collect(Collectors.toList());
    }

    public Provincia setearLocalidad(Long idProvincia, Long idLocalidad) {
        Provincia provincia = repository.findById(idProvincia)
                .orElseThrow(() -> new RuntimeException("Provincia no encontrada"));

        Localidad localidad = localidadRepository.findById(idLocalidad)
                .orElseThrow(() -> new RuntimeException("Localidad no encontrada"));

        provincia.getLocalidades().add(localidad);
        return repository.save(provincia);
    }

    public Provincia actualizarProvincia(Long idProvincia, DTOProvincia2 provincia2) {
        Provincia provincia = repository.findById(idProvincia)
                .orElseThrow(() -> new RuntimeException("Provincia no encontrada"));

        List<Localidad> localidades = provincia.getLocalidades();

        provincia.setNombre(provincia2.getNombre());
        provincia.setLocalidades(localidades);
        return repository.save(provincia);
    }

    public Map<String, Object> verificarYDarDeBaja(Long id) {
        Provincia provincia = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Provincia no encontrada"));

        long localidadesActivas = provincia.getLocalidades().stream()
                .filter(loc -> loc.getFechaHoraBaja() == null)
                .count();

        Map<String, Object> resultado = new HashMap<>();

        if (localidadesActivas > 0) {
            resultado.put("exitoso", false);
            resultado.put("mensaje", "La provincia tiene " + localidadesActivas + " localidades activas");
            resultado.put("cantidadLocalidades", localidadesActivas);
        } else {
            provincia.setFechaHoraBaja(LocalDateTime.now());
            repository.save(provincia);
            resultado.put("exitoso", true);
            resultado.put("mensaje", "Provincia dada de baja correctamente");
        }

        return resultado;
    }

    public Provincia darDeAltaAgain(Long idProvincia) {
        Provincia provincia = repository.findById(idProvincia)
                .orElseThrow(() -> new RuntimeException("Provincia no encontrada"));

        provincia.setFechaHoraBaja(null);
        return repository.save(provincia);
    }

    public List<DtoProvincia> getDtosProvincia() {
        List<Provincia> provincias = repository.findByfechaHoraBajaIsNull();

        return provincias.stream().map(provincia -> {
            DtoProvincia dtoProvincia = new DtoProvincia();
            dtoProvincia.setId(provincia.getId());
            dtoProvincia.setNombre(provincia.getNombre());
            List<DtoLocalidad> listaDtoLicalidad = provincia.getLocalidades().stream().map(localidad -> {
                DtoLocalidad dtoLocalidad = new DtoLocalidad();
                dtoLocalidad.setId(localidad.getId());
                dtoLocalidad.setNombre(localidad.getNombre());
                return dtoLocalidad;
            }).toList();
            dtoProvincia.setDtosLocalidad(listaDtoLicalidad);
            return dtoProvincia;
        }).toList();
    }
}
