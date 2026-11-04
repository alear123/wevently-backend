package com.wevently.wevently.Pagos.Services;

import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.Entities.Reserva;
import org.springframework.stereotype.Service;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Pagos.Entities.ParametroComision;
import com.wevently.wevently.Pagos.Repository.ParametroComisionRepository;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;

@Service
public class ParametroComisionService extends BaseService<ParametroComision, Long, ParametroComisionRepository> {

    public ParametroComisionService(ParametroComisionRepository repository) {
        super(repository);
    }

    public ParametroComision findByFechaHoraBajaIsNull() throws ErrorDeNegocio {
        if(repository.findByFechaHoraBajaIsNull().isPresent()){
            return repository.findByFechaHoraBajaIsNull().get();
        }
        throw new ErrorDeNegocio("No existe parametro comision activo");

    }

    public ParametroComision findParametroComisionActivo() throws ErrorDeNegocio {
        if(!repository.findParametroComisionActivo(LocalDateTime.now()).isEmpty()){
            return repository.findParametroComisionActivo(LocalDateTime.now()).get(0);
        }
        throw new ErrorDeNegocio("No existe parametro comision activo");
    }

    public ParametroComision obtenerParametroComisionVigente() throws ErrorDeNegocio {
        LocalDateTime ahora = LocalDateTime.now();
        return repository.findVigentePorFecha(ahora)
                .orElseThrow(() -> new ErrorDeNegocio("No se encontró un parametro de comisión vigente"));
    }

    public BigDecimal calcularComisionNosotros(BigDecimal montoTotal, Reserva r) throws ErrorDeNegocio {
        ParametroComision p = obtenerParametroComisionVigente();

        boolean tieneLugar = r.getLugar() != null;
        boolean tieneServicio = r.getServicio() != null;

        if (tieneLugar == tieneServicio) {
            throw new ErrorDeNegocio(
                    "La reserva debe tener relacionado un lugar o un servicio, pero no ambos ni ninguno.");
        }

        float porcentajeComision = tieneLugar ? p.getComisionLugar() : p.getComisionServicio();
        BigDecimal tasaDecimal = BigDecimal.valueOf(porcentajeComision).divide(BigDecimal.valueOf(100));
        return montoTotal.multiply(tasaDecimal).setScale(2, RoundingMode.HALF_UP);

    }

}
