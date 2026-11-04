package com.wevently.wevently.Pagos.External.Adaptadores;

//entidades
import com.wevently.wevently.Pagos.Entities.MedioDePago;
import com.wevently.wevently.Pagos.Entities.RangoMontos;
import com.wevently.wevently.Pagos.Entities.TipoMedioPago;
import com.wevently.wevently.Pagos.Entities.PaymentStatus;
import com.wevently.wevently.Pagos.External.DTOs.CreatePaymentRequest;
import com.wevently.wevently.Pagos.External.DTOs.CreatePreferenceRequest;
import com.wevently.wevently.Pagos.External.DTOs.Payer;
import com.wevently.wevently.Pagos.External.DTOs.PayerIdentification;
import com.wevently.wevently.Pagos.External.DTOs.PaymentMethodResponse;
import com.wevently.wevently.Pagos.External.DTOs.PaymentResponse;
import com.wevently.wevently.Pagos.External.DTOs.PreferenceResponse;
import com.wevently.wevently.Pagos.External.DTOs.FeeDetail;
import com.wevently.wevently.Pagos.DTO.PaymentRequest;
import com.wevently.wevently.Pagos.DTO.PaymentResult;
import com.wevently.wevently.Pagos.DTO.PreferenceRequest;
import com.wevently.wevently.Pagos.DTO.PreferenceResult;
import com.wevently.wevently.Pagos.Entities.EstadoMedioPago;

//del lenaguaje y framework
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class MercadoPagoAdaptador {

    public List<MedioDePago> adaptPaymentMethods(List<PaymentMethodResponse> mpMetodos) {
        return mpMetodos.stream()
                .map(this::adaptSingle)
                .collect(Collectors.toList());
    }

    private MedioDePago adaptSingle(PaymentMethodResponse mpMetodo) {
        MedioDePago medio = new MedioDePago();

        medio.setCodigo(mpMetodo.getId());
        medio.setNombre(mpMetodo.getName());
        medio.setTipo(mapTipoMedioPago(mpMetodo.getPaymentTypeId()));
        medio.setEstado(mapEstado(mpMetodo.getStatus()));
        medio.setRangoMontos(new RangoMontos(
                BigDecimal.valueOf(mpMetodo.getMinAllowedAmount()),
                BigDecimal.valueOf(mpMetodo.getMaxAllowedAmount())));
        medio.setTiempoAcreditacion(mpMetodo.getAccreditationTime());
        medio.setEsVisible(true);
        medio.setFechaHoraAlta(LocalDateTime.now());

        return medio;
    }

    private TipoMedioPago mapTipoMedioPago(String mpTipo) {
        return switch (mpTipo) {
            case "credit_card" -> TipoMedioPago.TARJETA_CREDITO;
            case "debit_card" -> TipoMedioPago.TARJETA_DEBITO;
            case "bank_transfer" -> TipoMedioPago.TRANSFERENCIA;
            case "ticket" -> TipoMedioPago.EFECTIVO;
            case "digital_wallet" -> TipoMedioPago.BILLETERA_DIGITAL;
            case "prepaid_card" -> TipoMedioPago.TARJETA_PREPAGA;
            default -> throw new IllegalArgumentException("Tipo no soportado: " + mpTipo);
        };
    }

    private EstadoMedioPago mapEstado(String mpEstado) {
        return switch (mpEstado) {
            case "active" -> EstadoMedioPago.ACTIVO;
            case "inactive" -> EstadoMedioPago.INACTIVO;
            case "temporarily_disabled" -> EstadoMedioPago.MANTENIMIENTO;
            default -> EstadoMedioPago.INACTIVO;
        };
    }

    public CreatePaymentRequest adaptPaymentRequest(PaymentRequest request) {
        System.out.println("=== ADAPTANDO REQUEST ===");
        System.out.println("Token: " + request.getToken());
        System.out.println("Monto: " + request.getMonto());
        System.out.println("Comprador email: " + request.getComprador().getMail());

        System.out.println("=== ADAPTANDO REQUEST ===");
        System.out.println("Token: " + request.getToken());
        System.out.println("Monto: " + request.getMonto());
        System.out.println("Issuer ID: " + request.getIssuer_id());

        CreatePaymentRequest mpRequest = CreatePaymentRequest.builder()
                .token(request.getToken())
                .transactionAmount(request.getMonto())
                .description(request.getDescripcion())
                .paymentMethodId(request.getMedioPagoId())
                .installments(request.getCuotas())
                .issuerId(request.getIssuer_id())
                .payer(Payer.builder()
                        .email(request.getComprador().getMail())
                        .firstName(request.getComprador().getNombre())
                        .lastName(request.getComprador().getApellido())
                        .identification(PayerIdentification.builder()
                                .type(request.getComprador().getIdentificacion().getType())
                                .number(request.getComprador().getIdentificacion().getNumber())
                                .build())
                        .build())
                .build();

        System.out.println("Request adaptado correctamente");

        return mpRequest;
    }

    public PaymentResult adaptPaymentResult(PaymentResponse mpRespuesta) {
        System.out.println("=== ADAPTANDO RESPUESTA COMPLETA ===");
        System.out.println("ID: " + mpRespuesta.getId());
        System.out.println("Status: " + mpRespuesta.getStatus());
        System.out.println("Status Detail: " + mpRespuesta.getStatusDetail());
        System.out.println("Transaction Amount: " + mpRespuesta.getTransactionAmount());
        System.out.println("Date Created: " + mpRespuesta.getDateCreated());
        System.out.println("Date Approved: " + mpRespuesta.getDateApproved());
        System.out.println("Payment Method: " + mpRespuesta.getPaymentMethodId());
        System.out.println("External Reference: " + mpRespuesta.getExternalReference());
        System.out.println("Currency: " + mpRespuesta.getCurrencyId());
        System.out.println("Description: " + mpRespuesta.getDescription());

        if (mpRespuesta.getTransactionDetails() != null) {
            System.out.println("Net Received: " + mpRespuesta.getTransactionDetails().getNetReceivedAmount());
            System.out.println("Total Paid: " + mpRespuesta.getTransactionDetails().getTotalPaidAmount());
        }

        BigDecimal feeAmount = null;
        BigDecimal netReceived = null;

        if (mpRespuesta.getFeeDetails() != null && !mpRespuesta.getFeeDetails().isEmpty()) {
            feeAmount = mpRespuesta.getFeeDetails().stream()
                    .map(FeeDetail::getAmount)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
        }

        if (mpRespuesta.getTransactionDetails() != null) {
            netReceived = mpRespuesta.getTransactionDetails().getNetReceivedAmount();
        }

        String payerEmail = null;
        String payerName = null;
        if (mpRespuesta.getPayer() != null) {
            String firstName = mpRespuesta.getPayer().getFirstName();
            String lastName = mpRespuesta.getPayer().getLastName();

            if (firstName != null && lastName != null) {
                payerName = firstName + " " + lastName;
            } else if (firstName != null) {
                payerName = firstName;
            } else if (lastName != null) {
                payerName = lastName;
            }
        }

        return PaymentResult.builder()
                .id(mpRespuesta.getId() != null ? mpRespuesta.getId().toString() : null)
                .status(adaptPaymentStatus(mpRespuesta.getStatus()))
                .externalReference(mpRespuesta.getExternalReference())
                .approvalUrl(mpRespuesta.getInitPoint()) // para tarjetas sera null
                .transactionAmount(mpRespuesta.getTransactionAmount())
                .paymentMethodId(mpRespuesta.getPaymentMethodId())
                .currencyId(mpRespuesta.getCurrencyId())
                .dateCreated(mpRespuesta.getDateCreated())
                .dateApproved(mpRespuesta.getDateApproved())
                .statusDetail(mpRespuesta.getStatusDetail())
                .description(mpRespuesta.getDescription())
                .installments(mpRespuesta.getInstallments())
                .netReceivedAmount(netReceived)
                .feeAmount(feeAmount)
                .payerEmail(payerEmail)
                .payerName(payerName)
                .build();
    }

    public CreatePreferenceRequest adaptPreferenceRequest(PreferenceRequest request) {
        System.out.println("=== ADAPTANDO PREFERENCE REQUEST ===");
        System.out.println("Monto: " + request.getAmount());
        System.out.println("Título: " + request.getTitle());
        System.out.println("ID recibido: " + request.getId());
        System.out.println("Email: " + request.getPayerEmail());

        // crear el item (lugar/servicio)
        CreatePreferenceRequest.Item item = CreatePreferenceRequest.Item.builder()
                .id(request.getId())
                .title(request.getTitle())
                .description(request.getDescription())
                .quantity(1)
                .unitPrice(request.getAmount())
                .currencyId("ARS") // x ahora como estamos en argy
                .categoryId("services") // un lugar o servicio es al fin y al cabo un servicio
                .build();

        // URLs de retorno se configuran segun el front
        CreatePreferenceRequest.BackUrls backUrls = CreatePreferenceRequest.BackUrls.builder()
                .success(request.getSuccessUrl() != null ? request.getSuccessUrl()
                        : "http://localhost:5173/ExitoPago") // quiza sea conveniente redirigir directamente a al
                                                             // factura /acambiar cuando despleguemos
                .failure(request.getFailureUrl() != null ? request.getFailureUrl()
                        : "http://localhost:5173/FalloPago") // cambiar cuando despleguemos
                .pending(request.getPendingUrl() != null ? request.getPendingUrl()
                        : "http://localhost:5173/PendientePago") // cambiar cuando despleguemos
                .build();

        // info del qu8e pone la tarasca
        Payer payer = Payer.builder()
                .email(request.getPayerEmail())
                .firstName(request.getPayerName())
                .lastName(request.getPayerSurname())
                .build();

        // esto es para q nosotros digamos q metodos de pago use el user pero me aprece
        // que seria limitarlo al usuario respecto a merpa
        CreatePreferenceRequest.PaymentMethods paymentMethods = CreatePreferenceRequest.PaymentMethods.builder()
                .installments(12)
                .build();

        return CreatePreferenceRequest.builder()
                .items(List.of(item))
                .payer(payer)
                .backUrls(backUrls)
                // .autoReturn("all") // Retorno automático cuando se aprueba -> cambiar por
                // "approved" -> una vez en produccion actualizar esto
                .externalReference(request.getId()) // Tu ID interno
                .notificationUrl("https://8718c7c83c49.ngrok-free.app/api/pagos/webhook") // una vez despleguemos
                                                                                          // cambiar del "/api" para
                                                                                          // atras por la direccion del
                                                                                          // host
                .statementDescriptor("WEVENTLY") // Como aparece en el resumen
                .paymentMethods(paymentMethods)
                .build();
    }

    public PreferenceResult adaptPreferenceResult(PreferenceResponse mpResponse) {
        System.out.println("=== ADAPTANDO PREFERENCE RESULT ===");
        System.out.println("ID: " + mpResponse.getId());
        System.out.println("Init Point: " + mpResponse.getInitPoint());

        return PreferenceResult.success(
                mpResponse.getId(),
                mpResponse.getInitPoint(),
                mpResponse.getSandboxInitPoint());
    }

    public PaymentStatus adaptPaymentStatus(String mpEstado) {
        return switch (mpEstado) {
            case "approved" -> PaymentStatus.APPROVED;
            case "pending" -> PaymentStatus.PENDING;
            case "rejected" -> PaymentStatus.REJECTED;
            case "cancelled" -> PaymentStatus.CANCELLED;
            default -> PaymentStatus.ERROR;
        };
    }
}
