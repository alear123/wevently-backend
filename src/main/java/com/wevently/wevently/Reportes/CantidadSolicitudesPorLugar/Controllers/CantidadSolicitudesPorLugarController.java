package com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.Controllers;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO.DTODato;
import com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.DTO.DTORangoFechas;
import com.wevently.wevently.Reportes.CantidadSolicitudesPorLugar.Services.CantidadSolicitudesPorLugarService;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;

@RestController
@RequestMapping("api/reportes/solicitudesPorLugar")
public class CantidadSolicitudesPorLugarController {

    @Autowired
    private CantidadSolicitudesPorLugarService service;

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/obtener")
    public ResponseEntity<DTODato> obtenerReporte(@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaDesde,
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaHasta) {

        DTORangoFechas rangoFechas = DTORangoFechas.builder().desde(fechaDesde).hasta(fechaHasta).build();

        DTODato datos = service.hacerDatosFront(rangoFechas);

        return ResponseEntity.ok(datos);
    }
}
