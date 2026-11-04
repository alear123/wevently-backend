package com.wevently.wevently.Pagos.External.Clientes;

import com.fasterxml.jackson.databind.ObjectMapper;

//de las entidades/dtos
import com.wevently.wevently.Pagos.External.DTOs.CreatePaymentRequest;
import com.wevently.wevently.Pagos.External.DTOs.CreatePreferenceRequest;
import com.wevently.wevently.Pagos.External.DTOs.PaymentMethodResponse;
import com.wevently.wevently.Pagos.External.DTOs.PaymentResponse;
import com.wevently.wevently.Pagos.External.DTOs.PreferenceResponse;

//de java y el framework
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;

import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class MercadoPagoCliente {

    private final String accessToken;
    private final RestTemplate restTemplate;
    private static final String URL_BASE = "https://api.mercadopago.com";

    public MercadoPagoCliente(@Value("${mercadopago.acces-token}") String accessToken) {
        this.accessToken = accessToken;
        this.restTemplate = new RestTemplate();
    }

    public List<PaymentMethodResponse> getPaymentMethods() {
        String url = URL_BASE + "/v1/payment_methods";
        HttpHeaders headers = createHeaders();
        HttpEntity<Void> entity = new HttpEntity<>(headers);

        ResponseEntity<PaymentMethodResponse[]> respuesta = restTemplate.exchange(
                url, HttpMethod.GET, entity, PaymentMethodResponse[].class);

        return Arrays.asList(respuesta.getBody());

    }

    public PaymentResponse createPayment(CreatePaymentRequest request) {
        String url = URL_BASE + "/v1/payments";
        HttpHeaders headers = createheadersWithIdempotency();
        HttpEntity<CreatePaymentRequest> entity = new HttpEntity<>(request, headers);

        System.out.println("=== JSON ENVIADO A MERCADOPAGO ===");
        try {
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(request);
            System.out.println(json);
        } catch (Exception e) {
            System.out.println("Error al serializar request: " + e.getMessage());
        }

        ResponseEntity<PaymentResponse> respuestaRaw = restTemplate.exchange(
                url, HttpMethod.POST, entity, PaymentResponse.class);

        System.out.println("=== RESPUESTA DE MERCADOPAGO ===");
        System.out.println(respuestaRaw.getBody());

        PaymentResponse respuesta = respuestaRaw.getBody();

        return respuesta;
    }

    public PaymentResponse getPayment(String IdPago) {
        String url = URL_BASE + "/v1/payments/" + IdPago;
        HttpHeaders headers = createHeaders();
        HttpEntity<Void> entity = new HttpEntity<>(headers);

        ResponseEntity<PaymentResponse> respuesta = restTemplate.exchange(
                url, HttpMethod.GET, entity, PaymentResponse.class);

        return respuesta.getBody();
    }

    public boolean healthCheck() {
        try {
            getPaymentMethods();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public PreferenceResponse createPreference(CreatePreferenceRequest request) {
        String url = URL_BASE + "/checkout/preferences";
        HttpHeaders headers = createHeaders();
        HttpEntity<CreatePreferenceRequest> entity = new HttpEntity<>(request, headers);

        System.out.println("=== CREANDO PREFERENCIA EN MERCADOPAGO ===");
        try {
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(request);
            System.out.println("JSON enviado: " + json);
        } catch (Exception e) {
            System.out.println("Error serializando preference request: " + e.getMessage());
        }

        try {
            ResponseEntity<String> respuestaRaw = restTemplate.exchange(
                    url, HttpMethod.POST, entity, String.class);

            System.out.println("=== RESPUESTA STRING ===");
            System.out.println("Status Code: " + respuestaRaw.getStatusCode());
            System.out.println("Response Body: " + respuestaRaw.getBody());

            ObjectMapper mapper = new ObjectMapper();
            mapper.findAndRegisterModules();
            mapper.configure(com.fasterxml.jackson.databind.DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

            PreferenceResponse preference = mapper.readValue(
                    respuestaRaw.getBody(), PreferenceResponse.class);

            System.out.println("=== PREFERENCIA PARSEADA EXITOSAMENTE ===");
            System.out.println("Preference ID: " + preference.getId());
            System.out.println("Init Point: " + preference.getInitPoint());

            return preference;

        } catch (Exception e) {
            System.err.println("=== ERROR DETALLADO ===");
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error creando preferencia", e);
        }
    }

    private HttpHeaders createHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(accessToken);
        return headers;
    }

    /*
     * Este metodo es xq si se ejecuta la misma request 2 veces con el mismo key no
     * se le cobre 2 veces al cliente
     */
    private HttpHeaders createheadersWithIdempotency() {
        HttpHeaders headers = createHeaders();

        String idempotencyKey = UUID.randomUUID().toString();
        headers.set("X-Idempotency-Key", idempotencyKey);

        headers.set("X-Meli-Session-Id", UUID.randomUUID().toString());

        return headers;
    }
}
