package com.wevently.wevently.UsuariosySeguridad.Services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Service
public class ZohoTokenService {

    @Value("${zoho.mail.refresh-token}")
    private String refreshToken;

    @Value("${zoho.mail.client-id}")
    private String clientId;

    @Value("${zoho.mail.client-secret}")
    private String clientSecret;

    @Value("${zoho.mail.redirect-uri}")
    private String redirectUri;

    public String refreshAccessToken() throws Exception {
        String url = "https://accounts.zoho.com/oauth/v2/token";
        String body = "refresh_token=" + refreshToken
                + "&client_id=" + clientId
                + "&client_secret=" + clientSecret
                + "&redirect_uri=" + redirectUri
                + "&grant_type=refresh_token";

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Content-Type", "application/x-www-form-urlencoded")
                .POST(HttpRequest.BodyPublishers.ofString(body))
                .build();

        HttpClient client = HttpClient.newHttpClient();
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        // Aquí puedes parsear el JSON y extraer el nuevo access_token
        // Ejemplo simple (mejor usar una librería JSON como Jackson):
        String responseBody = response.body();
        String accessToken = null;
        int idx = responseBody.indexOf("\"access_token\":\"");
        if (idx != -1) {
            int start = idx + 16;
            int end = responseBody.indexOf("\"", start);
            accessToken = responseBody.substring(start, end);
        }
        return accessToken;
    }
}