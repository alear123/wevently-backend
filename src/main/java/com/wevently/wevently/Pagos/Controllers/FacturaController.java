package com.wevently.wevently.Pagos.Controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wevently.wevently.Pagos.DTO.DTODatosFactura;
import com.wevently.wevently.Pagos.Services.FacturaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

@RestController
@RequestMapping("/api/factura")
public class FacturaController {

    @Autowired
    private FacturaService facturaService;

    @PostMapping("/crear")
    public ResponseEntity<byte[]> descargarPdf(@RequestBody DTODatosFactura datos) throws Exception {
        System.out.println("Llamado al endpoint /api/factura/crear con tipo=" + datos.getTipoFactura());
        byte[] pdf = facturaService.generarFacturaPdf(datos);
        return ResponseEntity
                .ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=factura.pdf")
                .contentType(MediaType.APPLICATION_PDF)
                .body(pdf);
    }

}
