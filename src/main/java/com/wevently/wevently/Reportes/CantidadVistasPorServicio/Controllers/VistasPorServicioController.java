/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Reportes.CantidadVistasPorServicio.Controllers;

import com.wevently.wevently.Reportes.CantidadVistasPorServicio.Entities.MetricaVistasServicio;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.Services.VistasPorServicioService;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.DTO.DTODatos;
import com.wevently.wevently.Reportes.CantidadVistasPorServicio.DTO.DTORangoFechas;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Date;

@RestController
@RequestMapping("/api/reportes/vistasPorServicio")
public class VistasPorServicioController extends BaseController<MetricaVistasServicio, Long, VistasPorServicioService> {

    public VistasPorServicioController(VistasPorServicioService service) {
        super(service);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/obtener")
    public ResponseEntity<List<DTODatos>> obtenerReporte(
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaDesde,
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaHasta) {

        DTORangoFechas rangoFechas = DTORangoFechas.builder()
                .desde(fechaDesde)
                .hasta(fechaHasta)
                .build();

        List<DTODatos> datos = service.armarDatosFront(rangoFechas);

        return ResponseEntity.ok(datos);
    }
}
