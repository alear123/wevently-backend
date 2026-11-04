/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Reportes.IngresosFinancieros.Controllers;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTORangoFechas;
import com.wevently.wevently.Reportes.IngresosFinancieros.DTO.DtoReporteFinanciero;
import com.wevently.wevently.Reportes.IngresosFinancieros.DTO.IngresoMensual;
import com.wevently.wevently.Reportes.IngresosFinancieros.Services.IngresosFinancierosService;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/reportes/financiero")
public class IngresosFinancierosController extends BaseController<Reserva, Long, IngresosFinancierosService> {

    public IngresosFinancierosController(IngresosFinancierosService service) {
        super(service);
    }




    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/obtener")
    public ResponseEntity<DtoReporteFinanciero> obtenerReporte(
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date desde,
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date hasta,
            @RequestParam String tipo ){

        try {
            Date fecha = new Date(); // fecha actual

            // Convertir Date a LocalDateTime
            LocalDateTime ldt = hasta.toInstant()
                    .atZone(ZoneId.systemDefault())
                    .toLocalDateTime();

            // Obtener el comienzo del día siguiente (00:00 del próximo día)
            LocalDateTime inicioDiaSiguiente = ldt.toLocalDate().plusDays(1).atStartOfDay();

            // Diferencia en segundos
            Duration diff = Duration.between(ldt, inicioDiaSiguiente);

            // Sumar a la fecha original
            Date fechaHastaFormateada = Date.from(ldt.plusSeconds(diff.getSeconds() - 1)
                    .atZone(ZoneId.systemDefault())
                    .toInstant());

            DTORangoFechas rangoFechas = DTORangoFechas.builder()
                    .desde(desde)
                    .hasta(fechaHastaFormateada)
                    .build();

            DtoReporteFinanciero datos = service.getReporteFinanciero(rangoFechas, tipo);

            return ResponseEntity.ok(datos);
        } catch (ErrorDeNegocio e) {
            System.out.println(e);
            return ResponseEntity.status(400).build();

        }
    }
}
