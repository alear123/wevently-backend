package com.wevently.wevently.UsuariosySeguridad.Services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.wevently.wevently.UsuariosySeguridad.Services.ZohoTokenService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Service
public class ZohoMailService {

    @Value("${zoho.mail.account-email}")
    private String fromAddress;

    private final ZohoTokenService zohoTokenService;
    private String accountId; // Guardar el accountId en memoria

    public ZohoMailService(ZohoTokenService zohoTokenService) {
        this.zohoTokenService = zohoTokenService;
    }

    public void enviarEmail(String destinatario, String asunto, String cuerpo) throws Exception {
        String accessToken = zohoTokenService.refreshAccessToken();

        if (accountId == null) {
            accountId = obtenerAccountId(accessToken);
        }

        String url = "https://mail.zoho.com/api/accounts/" + accountId + "/messages";

        ObjectMapper mapper = new ObjectMapper();
        ObjectNode json = mapper.createObjectNode();
        json.put("fromAddress", fromAddress);
        json.put("toAddress", destinatario); 
        json.put("subject", asunto);
        json.put("content", cuerpo); 
        json.put("mailFormat", "html"); // formato HTML

        String jsonString = mapper.writeValueAsString(json);

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Authorization", "Zoho-oauthtoken " + accessToken)
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(jsonString))
                .build();

        HttpClient client = HttpClient.newHttpClient();
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());


        if (response.statusCode() != 200) {
            throw new RuntimeException("Error enviando email: " + response.body());
        }
    }
    // Usa Jackson para parsear el JSON y obtener el accountId
    private String obtenerAccountId(String accessToken) throws Exception {
        String url = "https://mail.zoho.com/api/accounts";
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Authorization", "Zoho-oauthtoken " + accessToken)
                .GET()
                .build();

        HttpClient client = HttpClient.newHttpClient();
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        ObjectMapper mapper = new ObjectMapper();
        JsonNode root = mapper.readTree(response.body());
        // El accountId está en: root.data[0].accountId
        JsonNode data = root.path("data");
        if (data.isArray() && data.size() > 0) {
            return data.get(0).path("accountId").asText();
        }
        throw new RuntimeException("No se pudo obtener el accountId de Zoho Mail");
    }
}