package com.wevently.wevently.Reportes.IngresosFinancieros.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Entities.TipoEvento;
import com.wevently.wevently.Eventos.Enum.EstadoReserva;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Eventos.Services.TipoEventoService;
import com.wevently.wevently.Lugares.Entities.Localidad;
import com.wevently.wevently.Lugares.Entities.Provincia;
import com.wevently.wevently.Lugares.Repository.ProvinciaRepository;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTORangoFechas;
import com.wevently.wevently.Reportes.IngresosFinancieros.DTO.DtoReporteFinanciero;
import com.wevently.wevently.Reportes.IngresosFinancieros.DTO.IngresoMensual;
import com.wevently.wevently.Servicios.Entities.Servicio;
import com.wevently.wevently.Servicios.Repository.ServicioRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;
import com.wevently.wevently.UsuariosySeguridad.Services.UsuariosService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
public class IngresosFinancierosService
extends BaseService<Reserva, Long, ReservaRepository> {

    @Autowired
    private ReservaRepository reservaRepository;
    @Autowired
    UsuarioDetailsService usuarioDetailsService;
    @Autowired
    TipoEventoService tipoEventoService;
    

    public IngresosFinancierosService(ReservaRepository reservaRepository) {
        super(reservaRepository);

    }

    public DtoReporteFinanciero getReporteFinanciero(DTORangoFechas rangoFechas, String tipoEvento) throws ErrorDeNegocio{
        try {
            Usuario usuario = usuarioDetailsService.getCurrentUser();

            List<Reserva> reservas = repository.findAllByEstadoReservaAndPrestadorAndFechaReservaBetweenOrderByFechaReservaAsc(EstadoReserva.COMPLETO, usuario, rangoFechas.getDesde(), rangoFechas.getHasta());

            DtoReporteFinanciero dto = new DtoReporteFinanciero(
                    reservas.stream()
                            .mapToDouble(r -> r.getPrecioReserva())
                            .sum()
                    ,getDatosGraficoBarras(tipoEvento, reservas)
                    ,getDatosGraficoTorta(reservas)
                    ,getDatosGraficoLineal(rangoFechas, usuario)
            );

            return dto;
        }
        catch(Exception e){
            throw new ErrorDeNegocio("No se ha podido generar el reporte financiero");
        }

    }

    private List<IngresoMensual> getDatosGraficoBarras(String tipoEvento, List<Reserva> reservas){
        if(!tipoEvento.equals("Todos")){
            reservas = reservas.stream().filter(r -> r.getEvento().getTipoEvento().getNombre().equals(tipoEvento)).collect(Collectors.toList());
        }
        Double totalMes =  0.0;
        List<IngresoMensual> ingresos = new ArrayList<>();
        int contador = 0;
        if(!reservas.isEmpty()) {
            Date fechaAnterior = reservas.get(0).getFechaReserva();
            for(Reserva reserva : reservas) {
                if(reserva.getFechaReserva().getMonth() == fechaAnterior.getMonth() &&
                        (reserva.getFechaReserva().getYear() == fechaAnterior.getYear())){
                    totalMes += reserva.getPrecioReserva();

                }
                if(reserva.getFechaReserva().getMonth() != fechaAnterior.getMonth() ||
                        reserva.getFechaReserva().getYear() != fechaAnterior.getYear() ||
                        (reservas.size() == contador + 1)) {
                    ingresos.add(new IngresoMensual(fechaAnterior.getYear() + 1900,
                            fechaAnterior.getMonth() + 1,
                            totalMes));
                    totalMes = reserva.getPrecioReserva(); // reiniciar con el actual
                }

                fechaAnterior = reserva.getFechaReserva();
                contador += 1;

                if(contador == reservas.size()){
                    ingresos.add(new IngresoMensual(fechaAnterior.getYear() + 1900,
                            fechaAnterior.getMonth() + 1,
                            totalMes));
                }
            }
        }
        return ingresos;
    }

    private List<DtoReporteFinanciero.DistribucionPorTipoEvento> getDatosGraficoTorta(List<Reserva> reservas) throws Exception {
        List<DtoReporteFinanciero.DistribucionPorTipoEvento> listaPorTipoEvento = new ArrayList<DtoReporteFinanciero.DistribucionPorTipoEvento>();
        for(TipoEvento tipo: tipoEventoService.findAll()){
            listaPorTipoEvento.add(new DtoReporteFinanciero.DistribucionPorTipoEvento(tipo.getNombre(),
                    reservas.stream()
                            .filter(r -> r.getEvento().getTipoEvento().getNombre().equals(tipo.getNombre()))
                            .mapToDouble(r -> r.getPrecioReserva())
                            .sum()
                    )
            );
        }

        return listaPorTipoEvento;
    }

    private List<DtoReporteFinanciero.DistribucionPorFecha> getDatosGraficoLineal(
            DTORangoFechas rangoFechas, Usuario usuario) {

        List<Object[]> filas = reservaRepository.obtenerTotalPorFecha(rangoFechas.getDesde(), rangoFechas.getHasta(), usuario);

        List<DtoReporteFinanciero.DistribucionPorFecha> distribucionPorFechas =
                filas.stream()
                        .map(f -> new DtoReporteFinanciero.DistribucionPorFecha(
                                f[0].toString(),
                                Double.parseDouble(f[1].toString())
                        ))
                        .toList();

        return distribucionPorFechas;
    }


    private boolean mismaFecha(Date f1, Date f2) {
        Calendar c1 = Calendar.getInstance();
        c1.setTime(f1);

        Calendar c2 = Calendar.getInstance();
        c2.setTime(f2);

        return c1.get(Calendar.YEAR) == c2.get(Calendar.YEAR)
                && c1.get(Calendar.MONTH) == c2.get(Calendar.MONTH)
                && c1.get(Calendar.DAY_OF_MONTH) == c2.get(Calendar.DAY_OF_MONTH);
    }
    private Date sumarDias(Date fecha, int dias) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(fecha);
        cal.add(Calendar.DAY_OF_MONTH, dias);
        return cal.getTime();
    }





}
