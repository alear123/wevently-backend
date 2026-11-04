package com.wevently.wevently.UsuariosySeguridad.Services.Listeners;

import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class LoginAttempService {

    private static final int MAX_INTENTOS = 5;
    private static final int BLOQUEO_SEGUNDOS = 60;

    private final ConcurrentHashMap<String, Integer> intentosFallidos = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, LocalDateTime> bloqueados = new ConcurrentHashMap<>();

    public void loginFallido(String email) {
        int intentos = intentosFallidos.getOrDefault(email, 0) + 1;
        intentosFallidos.put(email, intentos);

        if (intentos >= MAX_INTENTOS) {
            bloqueados.put(email, LocalDateTime.now().plusSeconds(BLOQUEO_SEGUNDOS));
            intentosFallidos.remove(email);
        }
    }

    public void loginExitoso(String email) {
        intentosFallidos.remove(email);
        bloqueados.remove(email);
    }

    public boolean estaBloqueado(String email) {
        if (!bloqueados.containsKey(email)) return false;

        LocalDateTime finBloqueo = bloqueados.get(email);
        if (finBloqueo.isAfter(LocalDateTime.now())) {
            return true;
        } else {
            bloqueados.remove(email);
            return false;
        }
    }
}
