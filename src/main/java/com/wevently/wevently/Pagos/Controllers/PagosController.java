/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Pagos.Controllers;

import com.wevently.wevently.Pagos.Entities.MedioDePago;
import com.wevently.wevently.Pagos.DTO.DTOMedioDePago;
import com.wevently.wevently.Pagos.DTO.PaymentRequest;
import com.wevently.wevently.Pagos.DTO.PaymentResult;
import com.wevently.wevently.Pagos.DTO.PreferenceRequest;
import com.wevently.wevently.Pagos.DTO.PreferenceResult;
//import com.fasterxml.jackson.databind.ObjectMapper;
import com.wevently.wevently.Base.BaseController;
import com.wevently.wevently.Pagos.Services.FactoriaPayment;
import com.wevently.wevently.Pagos.Services.PagosService;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.TienePermisos;

//import com.wevently.wevently.Pagos.Services.DistribucionFondosService;
//import com.wevently.wevently.Pagos.External.Clientes.MercadoPagoCliente;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.BigDecimal;
import java.util.List;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/pagos")
@Slf4j
public class PagosController extends BaseController<MedioDePago, Long, PagosService> {

    private final FactoriaPayment FactoriaMedioDePago;

    public PagosController(PagosService service, FactoriaPayment factoriaPayment) {
        super(service);
        this.FactoriaMedioDePago = factoriaPayment;
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @GetMapping("/disponibles")
    public ResponseEntity<List<DTOMedioDePago>> obtenerDisponibles() {
        List<DTOMedioDePago> disponibles = service.obtenerDisponiblesParaCompra();
        return ResponseEntity.ok(disponibles);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PutMapping("/{id}/cambiar-visibilidad")
    public ResponseEntity<DTOMedioDePago> cambiarVisibilidad(@PathVariable Long id) {

        return ResponseEntity.ok(service.cambiarVisibilidad(id));
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping("/sincronizar")
    public ResponseEntity<Void> sincronizar() {
        service.sincronizarConProveedor();

        return ResponseEntity.ok().build();
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping("/procesar-pago")
    public ResponseEntity<PaymentResult> procesarPago(@Valid @RequestBody PaymentRequest request) {
        System.out.println("=== DATOS RECIBIDOS ===");
        System.out.println("Token: " + request.getToken());
        System.out.println("Monto: " + request.getMonto());
        System.out.println("Payment Method ID: " + request.getMedioPagoId());

        if (request.getComprador() != null) {

            if (request.getComprador().getIdentificacion() != null) {
                System.out.println("ID Type: " + request.getComprador().getIdentificacion().getType());
                System.out.println("ID Number: " + request.getComprador().getIdentificacion().getNumber());
            } else {
                System.out.println("IDENTIFICACIÓN ES NULL");
            }
        } else {
            System.out.println("COMPRADOR ES NULL");
        }

        PaymentResult resultado = FactoriaMedioDePago.procesarPago(request);

        return ResponseEntity.ok(resultado);
    }

    @PreAuthorize("isAuthenticated()")
    @TienePermisos
    @PostMapping("/crear-preferencia")
    public ResponseEntity<PreferenceResult> crearPreferencia(@Valid @RequestBody PreferenceRequest request) {
        System.out.println("=== CREANDO PREFERENCIA ===");
        System.out.println("Monto: " + request.getAmount());
        System.out.println("Título: " + request.getTitle());
        System.out.println("Email: " + request.getPayerEmail());

        try {

            if (request.getAmount() == null || request.getAmount().compareTo(BigDecimal.ZERO) <= 0) {
                return ResponseEntity.badRequest().body(PreferenceResult.error("el monto debe ser mayor a 0"));
            }

            if (request.getPayerEmail() == null || request.getPayerEmail().trim().isEmpty()) {
                return ResponseEntity.badRequest().body(PreferenceResult.error("el email del que paga es requerido"));
            }

            PreferenceResult resultado = service.crearPreferencia(request);

            return ResponseEntity.ok(resultado);
        } catch (Exception e) {
            System.err.println("Error creando preferencia: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.internalServerError().body(PreferenceResult.error("error interno del servidor"));
        }
    }

    /*
     * este se usa cuando despleguemos en produccion para recibir confirmaciones
     * desde mercado pago
     * 
     * @PostMapping("/webhook")
     * public ResponseEntity<Void> manejarWebhook(@RequestBody String payload,
     * 
     * @RequestHeader Map<String, String> headers) {
     * 
     * log.info("=== WEBHOOK RECIBIDO ===");
     * 
     * try {
     * ObjectMapper mapper = new ObjectMapper();
     * Map<String, Object> webhookData = mapper.readValue(payload,
     * new TypeReference<Map<String, Object>>() {
     * });
     * 
     * String type = (String) webhookData.get("type");
     * 
     * if ("payment".equals(type)) {
     * Map<String, Object> data = (Map<String, Object>) webhookData.get("data");
     * String paymentId = (String) data.get("id");
     * 
     * log.info("Payment ID recibido: {}", paymentId);
     * 
     * // Consultar estado del pago
     * PaymentResponse payment = mercadoPagoCliente.getPayment(paymentId);
     * 
     * // Solo procesar si el pago fue aprobado
     * if ("approved".equals(payment.getStatus())) {
     * procesarDistribucionAutomatica(payment);
     * }
     * }
     * 
     * return ResponseEntity.ok().build();
     * 
     * } catch (Exception e) {
     * log.error("Error procesando webhook", e);
     * return ResponseEntity.internalServerError().build();
     * }
     * }
     */

}
