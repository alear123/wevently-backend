/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Reportes.CantidadVistasPorLugar.Controllers;

import com.wevently.wevently.Reportes.CantidadVistasPorLugar.DTO.DTODatos;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.DTO.DTORangoFechas;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.Entities.MetricaVistasLugar;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Reportes.CantidadVistasPorLugar.Services.VistasPorLugarService;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/reportes/vistasPorLugar")
public class VistasPorLugarController extends BaseController<MetricaVistasLugar, Long, VistasPorLugarService> {

    public VistasPorLugarController(VistasPorLugarService service) {
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
