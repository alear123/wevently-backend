package com.wevently.wevently.Reportes.ServiciosMasSolicitados.Services;

import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.Provincia;
import com.wevently.wevently.Lugares.Repository.LocalidadRepository;
import com.wevently.wevently.Lugares.Repository.ProvinciaRepository;
import com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.ProvinciaConLocalidadesDTO;
import com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.TipoServicioCantidad;
import com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.ProvinciaCantidadDTO;
import com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO.ServicioGlobalDTO;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ServiciosMasSolicitadosService {

    private final ReservaRepository reservaRepository;
    private final ProvinciaRepository provinciaRepository;
    private final LocalidadRepository localidadRepository;

    public ServiciosMasSolicitadosService(ReservaRepository reservaRepository,
            ProvinciaRepository provinciaRepository,
            LocalidadRepository localidadRepository) {
        this.reservaRepository = reservaRepository;
        this.provinciaRepository = provinciaRepository;
        this.localidadRepository = localidadRepository;
    }

    public List<ProvinciaConLocalidadesDTO> obtenerFiltros() {
        List<Provincia> provincias = (List<Provincia>) provinciaRepository.findAll();
        return provincias.stream().map(p -> {
            List<Localidad> locs = localidadRepository.findByProvinciaId(p.getId());
            return new ProvinciaConLocalidadesDTO(
                    p.getId(),
                    p.getNombre(),
                    locs.stream()
                            .map(l -> new ProvinciaConLocalidadesDTO.LocalidadDTO(l.getId(), l.getNombre()))
                            .collect(Collectors.toList()));
        }).collect(Collectors.toList());
    }

    /**
     * Retorna los tipos de servicio más solicitados, filtrando opcionalmente por
     * provincia, localidad y fechas.
     * Solo se consideran reservas con estado COMPLETO y no dadas de baja.
     */
    public List<TipoServicioCantidad> topTipos(Long provinciaId, Long localidadId, Date desde, Date hasta) {
        // Ajustar la fecha 'hasta' para incluir el día completo
        Date hastaAjustada = hasta;
        if (hasta != null) {
            java.util.Calendar cal = java.util.Calendar.getInstance();
            cal.setTime(hasta);
            cal.add(java.util.Calendar.DATE, 1);
            hastaAjustada = cal.getTime();
        }
        return reservaRepository.topTiposByUbicacionYFechas(provinciaId, localidadId, desde, hastaAjustada);
    }

    public List<ProvinciaCantidadDTO> topProvinciasGlobal() {
        return reservaRepository.findTopProvinciasGlobal(PageRequest.of(0, 3));
    }

    public List<ServicioGlobalDTO> topServiciosGlobal() {
        return reservaRepository.findTopServiciosGlobal(PageRequest.of(0, 3));
    }
}
