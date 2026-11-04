package com.wevently.wevently.Pagos.External.Providers;

//entidades-dtos
import com.wevently.wevently.Pagos.Entities.MedioDePago;
import com.wevently.wevently.Pagos.Entities.PaymentStatus;
import com.wevently.wevently.Pagos.External.DTOs.CreatePaymentRequest;
import com.wevently.wevently.Pagos.External.DTOs.CreatePreferenceRequest;
import com.wevently.wevently.Pagos.External.DTOs.PaymentMethodResponse;
import com.wevently.wevently.Pagos.External.DTOs.PaymentResponse;
import com.wevently.wevently.Pagos.External.DTOs.PreferenceResponse;
import com.wevently.wevently.Pagos.DTO.PaymentRequest;
import com.wevently.wevently.Pagos.DTO.PaymentResult;
import com.wevently.wevently.Pagos.DTO.PreferenceRequest;
import com.wevently.wevently.Pagos.DTO.PreferenceResult;

//framework, adaptadores
import org.springframework.stereotype.Component;
import com.wevently.wevently.Pagos.External.Adaptadores.MercadoPagoAdaptador;
import com.wevently.wevently.Pagos.External.Clientes.MercadoPagoCliente;

import java.util.Collections;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class MercadoPagoStrategy implements PaymentProviderStrategy {
    private static final Logger log = LoggerFactory.getLogger(MercadoPagoStrategy.class);

    private final MercadoPagoCliente mercadoPagoCliente;
    private final MercadoPagoAdaptador mercadoPagoAdaptador;

    public MercadoPagoStrategy(MercadoPagoCliente cliente, MercadoPagoAdaptador adaptador) {
        this.mercadoPagoCliente = cliente;
        this.mercadoPagoAdaptador = adaptador;
    }

    @Override
    public List<MedioDePago> obtenerMediosDePago() {
        try {
            List<PaymentMethodResponse> mpMetodos = mercadoPagoCliente.getPaymentMethods();
            log.info("Metodos de pago recibidos de MercadoPago: {}", mpMetodos.size());
            return mercadoPagoAdaptador.adaptPaymentMethods(mpMetodos);
        } catch (Exception e) {
            log.error("Error obteniendo medios de apgo desde Mercado pago", e);
            return Collections.emptyList();
        }
    }

    @Override
    public PaymentResult crearPago(PaymentRequest request) {
        try {
            CreatePaymentRequest mpRequest = mercadoPagoAdaptador.adaptPaymentRequest(request);
            PaymentResponse mpResponse = mercadoPagoCliente.createPayment(mpRequest);
            return mercadoPagoAdaptador.adaptPaymentResult(mpResponse);
        } catch (Exception e) {
            log.error("Error creando pago en mercadoPago", e);
            return PaymentResult.error("error creando el pago: " + e.getMessage());
        }
    }

    @Override
    public PaymentStatus consultarEstadoPago(String IdPago) {
        try {
            PaymentResponse pago = mercadoPagoCliente.getPayment(IdPago);
            return mercadoPagoAdaptador.adaptPaymentStatus(pago.getStatus());
        } catch (Exception e) {
            log.error("Error consultando el estado del pago", e);
            return PaymentStatus.ERROR;
        }
    }

    @Override
    public boolean estaDisponible() {
        try {
            return mercadoPagoCliente.healthCheck();
        } catch (Exception e) {
            log.error("Mercado pago no esta disponible", e);
            return false;
        }
    }

    public PreferenceResult crearPreferencia(PreferenceRequest request) {
        try {
            CreatePreferenceRequest mpRequest = mercadoPagoAdaptador.adaptPreferenceRequest(request);
            PreferenceResponse mpResponse = mercadoPagoCliente.createPreference(mpRequest);

            return mercadoPagoAdaptador.adaptPreferenceResult(mpResponse);
        } catch (Exception e) {
            log.error("Error creando preferencia en MercadoPago", e);
            return PreferenceResult.error("Error creando preferencia: " + e.getMessage());
        }
    }
}
