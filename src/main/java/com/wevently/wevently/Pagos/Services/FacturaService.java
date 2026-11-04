package com.wevently.wevently.Pagos.Services;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Pagos.DTO.DTODatosFactura;
import com.wevently.wevently.Pagos.Entities.BaseFacturaEntity;
import com.wevently.wevently.Pagos.Entities.FacturaA;
import com.wevently.wevently.Pagos.Entities.FacturaB;
import com.wevently.wevently.Pagos.Entities.ItemFactura;
import com.wevently.wevently.Pagos.Repository.FacturaARepository;
import com.wevently.wevently.Pagos.Repository.FacturaBRepository;
import com.wevently.wevently.Pagos.Util.NumUtil;

import org.apache.pdfbox.pdmodel.*;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import java.io.ByteArrayOutputStream;

import jakarta.persistence.EntityNotFoundException;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class FacturaService {

    @Autowired
    private FacturaARepository facturaARepository;

    @Autowired
    private FacturaBRepository facturaBRepository;

    @Autowired
    private ReservaRepository reservaRepository;

    public String secuenciaNumeroComprobante(String tipo) {
        Integer nuevoNumero = 1;
        if (tipo.equals("A")) {
            FacturaA last = facturaARepository.findTopByOrderByNumeroComprobanteDesc();
            if (last != null && last.getNumeroComprobante() != null) {
                nuevoNumero = Integer.parseInt(last.getNumeroComprobante()) + 1;
            }
        } else {
            FacturaB last = facturaBRepository.findTopByOrderByNumeroComprobanteDesc();
            if (last != null && last.getNumeroComprobante() != null) {
                nuevoNumero = Integer.parseInt(last.getNumeroComprobante()) + 1;
            }
        }
        return String.format("%08d", nuevoNumero);
    }

    
    public BaseFacturaEntity crearFactura(DTODatosFactura datos) {
        /*
         * Reserva r = reservaRepository.findById(datos.getIdReserva())
         * .orElseThrow(
         * () -> new EntityNotFoundException("no se encontró la reserva con id: " +
         * datos.getIdReserva()));
         */

        Reserva r = reservaRepository.findByIdForUpdate(datos.getIdReserva());
        log.info("Reserva bloqueada: id={}, facturaExistente={}", r.getId(), r.getFactura() != null);

        if (r.getFactura() != null) {
            log.debug("la reserva ya tiene una factura asociada {}", r.getFactura());
            if (datos.getTipoFactura().equals("A") && r.getFactura() instanceof FacturaA) {
                return (FacturaA) r.getFactura();
            }
            if (datos.getTipoFactura().equals("B") && r.getFactura() instanceof FacturaB) {
                return (FacturaB) r.getFactura();
            }
            return r.getFactura();
        }

        if (datos.getTipoFactura().equals("A")) {
            FacturaA nueva = new FacturaA();
            nueva.setTipo("A");
            nueva.setCodigoComprobante("01");
            nueva.setNumeroComprobante(secuenciaNumeroComprobante("A"));
            nueva.setFechaEmision(datos.getDateCreated().toLocalDate());
            nueva.setFechaVencimientoPago(datos.getDateApproved().toLocalDate());
            nueva.setNombreReceptor(datos.getNombreComprador());
            nueva.setApellidoReceptor(datos.getApellidoComprador());
            nueva.setCuitReceptor(datos.getCuitComprador());
            nueva.setCondicionIVAReceptor("Responsable inscripto");
            nueva.setNombreEmisor("Wevently");
            nueva.setRazonSocialEmisor("Wevently S.A.");
            nueva.setCuitEmisor("30-111111111-4");
            nueva.setDomicilioEmisor("Rodriguez 273, Capital");
            nueva.setProvinciaEmisor("Mendoza");
            nueva.setIngresosBrutosEmisor("Reg. Simplificado");
            nueva.setCondicionIVAEmisor("Responsable inscripto");
            nueva.setCondicionVenta("Tarjeta");

            ItemFactura nuevoItem = new ItemFactura();
            nuevoItem.setCantidad(1);
            // Detalle recortado a 30 carcteres para no deformar la tabla
            String detalle = "";
            if (r.getServicio() != null) {
                detalle = r.getServicio().getNombre() + " - " + r.getServicio().getDescripcion();
            } else if (r.getLugar() != null) {
                detalle = r.getLugar().getNombre() + " - " + r.getLugar().getDescripcion();
            }
            nuevoItem.setDetalleProducto(detalle.length() > 30 ? detalle.substring(0, 30) : detalle);

            nuevoItem.setUnidadMedida("UNIDAD");
            nuevoItem.setPrecioUnitarioNeto(datos.getTransactionAmount());
            nuevoItem.setBonificacion(BigDecimal.ZERO);
            nuevoItem.setAlicuotaIVA(new BigDecimal("21"));
            nuevoItem.setImporteIVA(
                    datos.getTransactionAmount().divide(new BigDecimal("1.21"), 2, RoundingMode.HALF_UP)
                            .multiply(new BigDecimal("0.21")).setScale(2, RoundingMode.HALF_UP));
            nuevoItem.setSubtotal(datos.getTransactionAmount());

            List<ItemFactura> items = new ArrayList<>();
            items.add(nuevoItem);
            nueva.setItems(items);

            nueva.setImporteEnLetras(NumUtil.getNumeroEnLetras(datos.getTransactionAmount()));
            nueva.setBonificacion(BigDecimal.ZERO);
            nueva.setSubtotal(datos.getTransactionAmount());
            nueva.setOtrosImpuestos(BigDecimal.ZERO);
            nueva.setImporteExento(BigDecimal.ZERO);
            nueva.setImporteIVA(nuevoItem.getImporteIVA());
            nueva.setImporteNetoGravado(datos.getTransactionAmount().subtract(nueva.getImporteIVA()));
            nueva.setImporteTotal(nueva.getImporteNetoGravado().add(nueva.getImporteIVA()));
            nueva.setLeyendaAutorizacionFiscal(
                    "Comprobante autorizado. Régimen de Transparencia Fiscal al Consumidor Ley 27.743");

            // SOLO UN SAVE en todo el endpoint, nunca dos por request
            FacturaA facturaA = facturaARepository.save(nueva);
            log.info("FacturaA guardada id={}, numero={}", facturaA.getId(), facturaA.getNumeroComprobante());
            r.setFactura(facturaA);
            reservaRepository.save(r);
            log.info("Reserva {} actualizada con factura id={}", r.getId(), facturaA.getId());
            return facturaA;

        } else { // FACTURA B
            FacturaB nueva = new FacturaB();
            nueva.setTipo("B");
            nueva.setCodigoComprobante("06");
            nueva.setNumeroComprobante(secuenciaNumeroComprobante("B"));
            nueva.setFechaEmision(datos.getDateCreated().toLocalDate());
            nueva.setFechaVencimientoPago(datos.getDateApproved().toLocalDate());

            nueva.setNombreReceptor(datos.getNombreComprador());
            nueva.setApellidoReceptor(datos.getApellidoComprador());
            nueva.setCuitReceptor(datos.getCuitComprador());
            nueva.setCondicionIVAReceptor("Consumidor Final/ Responsable inscripto");
            nueva.setNombreEmisor("Wevently");
            nueva.setRazonSocialEmisor("Wevently S.A.");
            nueva.setCuitEmisor("30-111111111-4");
            nueva.setDomicilioEmisor("Rodriguez 273, Capital");
            nueva.setProvinciaEmisor("Mendoza");
            nueva.setIngresosBrutosEmisor("Reg. Simplificado");
            nueva.setCondicionIVAEmisor("Responsable inscripto");
            nueva.setCondicionVenta("Tarjeta");

            ItemFactura nuevoItem = new ItemFactura();
            nuevoItem.setCantidad(1);
            String detalle = "";
            if (r.getServicio() != null) {
                detalle = r.getServicio().getNombre() + " - " + r.getServicio().getDescripcion();
            } else if (r.getLugar() != null) {
                detalle = r.getLugar().getNombre() + " - " + r.getLugar().getDescripcion();
            }
            nuevoItem.setDetalleProducto(detalle.length() > 30 ? detalle.substring(0, 30) : detalle);

            nuevoItem.setUnidadMedida("UNIDAD");
            nuevoItem.setPrecioUnitarioNeto(datos.getTransactionAmount());
            nuevoItem.setBonificacion(BigDecimal.ZERO);
            nuevoItem.setSubtotal(datos.getTransactionAmount());
            nuevoItem.setAlicuotaIVA(null); // El campo queda null

            // IVA CONTENIDO
            BigDecimal ivaContenido = datos.getTransactionAmount()
                    .divide(new BigDecimal("1.21"), 2, RoundingMode.HALF_UP)
                    .multiply(new BigDecimal("0.21")).setScale(2, RoundingMode.HALF_UP);
            nueva.setImporteIVAContenido(ivaContenido);

            List<ItemFactura> items = new ArrayList<>();
            items.add(nuevoItem);
            nueva.setItems(items);

            nueva.setImporteEnLetras(NumUtil.getNumeroEnLetras(datos.getTransactionAmount()));
            nueva.setBonificacion(BigDecimal.ZERO);
            nueva.setSubtotal(datos.getTransactionAmount());
            nueva.setOtrosImpuestos(BigDecimal.ZERO);
            nueva.setImporteExento(BigDecimal.ZERO);
            nueva.setImporteTotal(datos.getTransactionAmount());
            nueva.setLeyendaTransparenciaFiscal("Régimen de Transparencia Fiscal al Consumidor Ley 27.743");

            FacturaB facturaB = facturaBRepository.save(nueva);
            log.info("FacturaB guardada id={}, numero={}", facturaB.getId(), facturaB.getNumeroComprobante());
            r.setFactura(facturaB);
            reservaRepository.save(r);
            log.info("Reserva {} actualizada con factura id={}", r.getId(), facturaB.getId());
            return facturaB;
        }
    }

    public byte[] generarFacturaPdf(DTODatosFactura datos) throws Exception {
        System.out.println("INICIO generarFacturaPdf tipo=" + datos.getTipoFactura());
        BaseFacturaEntity factura = crearFactura(datos);
        System.out.println("CREADA factura tipo=" + factura.getTipo() + " id=" + factura.getId());

        // Inicializar documento A4
        PDDocument document = new PDDocument();
        PDPage page = new PDPage(PDRectangle.A4);
        document.addPage(page);
        PDPageContentStream cs = new PDPageContentStream(document, page);

        // CAJA superior (emisor/tipo/nro)
        cs.setLineWidth(1.2f);
        cs.addRect(40, 749, 515, 90); // Caja superior grande
        cs.stroke();

        // Box "Tipo"
        cs.addRect(50, 785, 44, 44); // el cubito del tipo fact
        cs.stroke();
        cs.beginText();
        cs.setFont(PDType1Font.HELVETICA_BOLD, 34);
        cs.newLineAtOffset(62, 800);
        cs.showText(factura.getTipo());
        cs.endText();

        // AFIP leyenda superior
        cs.beginText();
        cs.setFont(PDType1Font.HELVETICA_BOLD, 15);
        cs.newLineAtOffset(110, 825);
        cs.showText("FACTURA");
        cs.endText();
        cs.beginText();
        cs.setFont(PDType1Font.HELVETICA_BOLD, 10);
        cs.newLineAtOffset(110, 809);
        cs.showText("ORIGINAL");
        cs.endText();

        // Datos emisor principales
        int emisorY = 802;
        cs.beginText();
        cs.setFont(PDType1Font.HELVETICA, 10);
        cs.newLineAtOffset(170, emisorY);
        cs.showText("Razón Social: " + factura.getRazonSocialEmisor());
        cs.newLineAtOffset(0, -15);
        cs.showText("Domicilio: " + factura.getDomicilioEmisor() + " - " + factura.getProvinciaEmisor());
        cs.newLineAtOffset(0, -15);
        cs.showText("Ing.Brutos: " + factura.getIngresosBrutosEmisor());
        cs.endText();

        // Número y fecha (extremo derecho)
        cs.beginText();
        cs.setFont(PDType1Font.HELVETICA, 10);
        cs.newLineAtOffset(405, 825);
        cs.showText("Cod." + factura.getCodigoComprobante());
        cs.newLineAtOffset(0, -16);
        cs.showText("Nro: " + factura.getNumeroComprobante());
        cs.newLineAtOffset(0, -16);
        cs.showText("Fecha Emisión: " + factura.getFechaEmision());
        cs.endText();

        // ----- Receptor -----
        cs.setLineWidth(0.9f);
        // cs.addRect(40, 725, 515, 45); // la cajita de la info del cliente
        cs.stroke();

        cs.beginText();
        cs.setFont(PDType1Font.HELVETICA, 10);
        cs.newLineAtOffset(50, 752);
        cs.showText("Cliente: " + factura.getNombreReceptor() + " " + factura.getApellidoReceptor()
                + "   CUIT: " + factura.getCuitReceptor() + "       IVA: " + factura.getCondicionIVAReceptor());
        cs.endText();

        // ----- Items (detalle) -----
        int itemsY = 706;
        cs.setLineWidth(0.6f);
        cs.moveTo(40, itemsY);
        cs.lineTo(555, itemsY);
        cs.stroke();

        int tablaY = itemsY - 18;
        cs.beginText();
        cs.setFont(PDType1Font.HELVETICA_BOLD, 10);
        cs.newLineAtOffset(48, tablaY);
        cs.showText("Descripción");
        cs.newLineAtOffset(210, 0);
        cs.showText("Cant");
        cs.newLineAtOffset(40, 0);
        cs.showText("U.Med");
        cs.newLineAtOffset(45, 0);
        cs.showText("P.Unit");
        cs.newLineAtOffset(55, 0);
        cs.showText("Bonif");
        cs.newLineAtOffset(40, 0);
        cs.showText("Subtotal");
        cs.newLineAtOffset(55, 0);
        cs.showText("IVA");
        cs.endText();
        tablaY -= 18;

        for (ItemFactura item : factura.getItems()) {
            int x = 48;
            cs.beginText();
            cs.setFont(PDType1Font.HELVETICA, 10);
            cs.newLineAtOffset(x, tablaY);
            cs.showText(item.getDetalleProducto());
            cs.newLineAtOffset(210, 0);
            cs.showText(item.getCantidad().toString());
            cs.newLineAtOffset(40, 0);
            cs.showText(item.getUnidadMedida());
            cs.newLineAtOffset(45, 0);
            cs.showText(item.getPrecioUnitarioNeto().toString());
            cs.newLineAtOffset(55, 0);
            cs.showText(item.getBonificacion().toString());
            cs.newLineAtOffset(40, 0);
            cs.showText(item.getSubtotal().toString());

            // SOLO para Factura A muestro IVA, para B espacio vacío
            String ivaStr = "";
            if (item.getAlicuotaIVA() != null)
                ivaStr = item.getAlicuotaIVA().toString();
            cs.newLineAtOffset(55, 0);
            cs.showText(ivaStr);
            cs.endText();
            tablaY -= 16;
        }

        cs.setLineWidth(0.6f);
        cs.moveTo(40, tablaY);
        cs.lineTo(555, tablaY);
        cs.stroke();

        // ----- Totales -----
        int totalesY = tablaY - 18;
        cs.beginText();
        cs.setFont(PDType1Font.HELVETICA_BOLD, 11);
        cs.newLineAtOffset(48, totalesY);
        if (factura instanceof FacturaA fa) {
            cs.showText("Importe Neto Gravado: $" + fa.getImporteNetoGravado());
            cs.newLineAtOffset(0, -14);
            cs.showText("Importe IVA: $" + fa.getImporteIVA());
            cs.newLineAtOffset(0, -14);
            cs.showText("Importe Exento: $" + fa.getImporteExento());
            cs.newLineAtOffset(0, -14);
            cs.showText("Otros Impuestos: $" + fa.getOtrosImpuestos());
            cs.newLineAtOffset(0, -14);
            cs.showText("Importe TOTAL: $" + fa.getImporteTotal());
            cs.newLineAtOffset(0, -18);
            cs.showText("Importe en Letras: " + fa.getImporteEnLetras());
        } else if (factura instanceof FacturaB fb) {
            cs.showText("Importe Subtotal: $" + fb.getSubtotal());
            cs.newLineAtOffset(0, -14);
            cs.showText("Importe Exento: $" + fb.getImporteExento());
            cs.newLineAtOffset(0, -14);
            cs.showText("Otros Impuestos: $" + fb.getOtrosImpuestos());
            cs.newLineAtOffset(0, -14);
            cs.showText("Importe TOTAL: $" + fb.getImporteTotal());
            cs.newLineAtOffset(0, -18);
            cs.showText("Importe en Letras: " + fb.getImporteEnLetras());
        }
        cs.endText();

        // ----- Leyenda/CAE -----
        int leyendaY = totalesY - 80;
        cs.setLineWidth(0.7f);
        cs.moveTo(42, leyendaY);
        cs.lineTo(553, leyendaY);
        cs.stroke();
        cs.beginText();
        cs.setFont(PDType1Font.HELVETICA_BOLD, 11);
        cs.newLineAtOffset(46, leyendaY - 18);
        if (factura instanceof FacturaA fa) {
            cs.showText(fa.getLeyendaAutorizacionFiscal());
        } else if (factura instanceof FacturaB fb) {
            cs.showText(fb.getLeyendaTransparenciaFiscal());
        }
        cs.endText();

        // ----- Pie -----
        cs.beginText();
        cs.setFont(PDType1Font.HELVETICA_OBLIQUE, 9);
        cs.newLineAtOffset(46, 60);
        cs.showText("Este comprobante fue generado electrónicamente - Wevently.");
        cs.endText();

        cs.close();

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        document.save(out);
        document.close();
        return out.toByteArray();
    }

}
