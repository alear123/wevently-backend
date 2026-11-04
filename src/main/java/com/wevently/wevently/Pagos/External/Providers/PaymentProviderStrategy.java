package com.wevently.wevently.Pagos.External.Providers;

import com.wevently.wevently.Pagos.Entities.MedioDePago;
import com.wevently.wevently.Pagos.DTO.PaymentResult;
import com.wevently.wevently.Pagos.DTO.PreferenceRequest;
import com.wevently.wevently.Pagos.DTO.PreferenceResult;
import com.wevently.wevently.Pagos.DTO.PaymentRequest;
import com.wevently.wevently.Pagos.Entities.PaymentStatus;

import java.util.List;

public interface PaymentProviderStrategy {
    List<MedioDePago> obtenerMediosDePago();

    PaymentResult crearPago(PaymentRequest request);

    PaymentStatus consultarEstadoPago(String paymentId);

    boolean estaDisponible();

    PreferenceResult crearPreferencia(PreferenceRequest request);
}