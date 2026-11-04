package com.wevently.wevently.UsuariosySeguridad.Services;

import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.UsuariosySeguridad.Entities.AlertaRecuperacionPassword;
import com.wevently.wevently.UsuariosySeguridad.Entities.RecuperacionPassword;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Repository.AlertaRecuperacionPasswordRepository;
import com.wevently.wevently.UsuariosySeguridad.Repository.RecuperacionPasswordRepository;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class RecuperacionPasswordService {

    @Autowired
    private RecuperacionPasswordRepository recuperacionRepo;
    @Autowired
    private UsuarioRepository usuarioRepo;

    @Autowired
    private ZohoMailService zohoMailService;

   @Autowired
    private AlertaRecuperacionPasswordRepository alertaRepo;

    public RecuperacionPassword generarCodigo(String email) throws Exception {
        Usuario usuario = usuarioRepo.findByEmail(email)
                .orElseThrow(() -> new Exception("Usuario no encontrado"));

        long intentosUltimaHora = recuperacionRepo.countByUsuarioAndUltimoIntentoAfter(
                usuario, LocalDateTime.now().minusHours(1));

        RecuperacionPassword ultimaRecuperacion = recuperacionRepo.findTopByUsuarioOrderByIdDesc(usuario)
                .orElse(null);

        boolean alertaEnviada = false;
        if (ultimaRecuperacion != null) {
            alertaEnviada = alertaRepo.existsByRecuperacionPasswordAndFechaHoraAfter(
                    ultimaRecuperacion, LocalDateTime.now().minusHours(1));
        }

        if (intentosUltimaHora >= 3) {
            if (!alertaEnviada && ultimaRecuperacion != null) {
                String asunto = "Verificación de actividad en tu cuenta Wevently";
                String mensajeHtml = """
                        <html>
                        <body>
                        <p>Hola %s,</p>
                        <p>Recibimos varios intentos de recuperación de contraseña para tu cuenta en la última hora.</p>
                        <p>Si fuiste tú, puedes ignorar este mensaje.<br>
                        Si no fuiste tú, te recomendamos revisar la seguridad de tu cuenta y cambiar tu contraseña.</p>
                        <p><b>Equipo Wevently</b></p>
                        </body>
                        </html>
                        """.formatted(usuario.getNombre());
                zohoMailService.enviarEmail(email, asunto, mensajeHtml);

                // Registrar la alerta para auditoría
                AlertaRecuperacionPassword alerta = new AlertaRecuperacionPassword();
                alerta.setRecuperacionPassword(ultimaRecuperacion);
                alerta.setFechaHora(LocalDateTime.now());
                alertaRepo.save(alerta);
            }
            throw new ErrorDeNegocio("Demasiados intentos. Se envió una alerta al propietario.");
        }

        RecuperacionPassword rec = new RecuperacionPassword();
        rec.setUsuario(usuario);
        rec.setCodigo(String.format("%04d", (int) (Math.random() * 10000)));
        rec.setExpiracion(LocalDateTime.now().plusMinutes(10));
        rec.setUsado(false);
        rec.setIntentos((int) intentosUltimaHora + 1);
        rec.setUltimoIntento(LocalDateTime.now());
        return recuperacionRepo.save(rec);
    }

    public boolean validarCodigo(String email, String codigo) throws Exception {
        Usuario usuario = usuarioRepo.findByEmail(email)
                .orElseThrow(() -> new Exception("Usuario no encontrado"));
        RecuperacionPassword rec = recuperacionRepo.findTopByUsuarioOrderByIdDesc(usuario)
                .orElseThrow(() -> new Exception("No hay código generado"));
        return codigo.equals(rec.getCodigo()) &&
                rec.getExpiracion().isAfter(LocalDateTime.now()) &&
                !rec.getUsado();
    }

    public void marcarUsado(String email) throws Exception {
        Usuario usuario = usuarioRepo.findByEmail(email)
                .orElseThrow(() -> new Exception("Usuario no encontrado"));
        RecuperacionPassword rec = recuperacionRepo.findTopByUsuarioOrderByIdDesc(usuario)
                .orElseThrow(() -> new Exception("No hay código generado"));
        rec.setUsado(true);
        recuperacionRepo.save(rec);
    }
}