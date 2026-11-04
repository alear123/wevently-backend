/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Reportes.CantidadUsuariosActivos.Controllers;

import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTODatos;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.DTO.DTORangoFechas;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.Entities.MetricaActividad;

import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Reportes.CantidadUsuariosActivos.Services.CantidadUsuariosActivosService;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/reportes/CantidadUsuariosActivos")
public class CantidadUsuariosActivos extends BaseController<MetricaActividad, Long, CantidadUsuariosActivosService> {

    public CantidadUsuariosActivos(CantidadUsuariosActivosService service) {
        super(service);
    }

    // agregar endpoint para insertar una nueva metricaActividad cdo el usuario
    // inicia sesions

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/obtener")
    public ResponseEntity<DTODatos> obtenerReporte(
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaDesde,
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaHasta) {

        DTORangoFechas rangoFechas = DTORangoFechas.builder()
                .desde(fechaDesde)
                .hasta(fechaHasta)
                .build();

        return ResponseEntity.ok(service.ArmarDatosFront(rangoFechas));
    }
}
