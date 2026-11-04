package com.wevently.wevently.UsuariosySeguridad.Services.Jwt;

import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UsuarioDetailsService implements UserDetailsService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if ("admin".equals(username)) {
            return new User("admin", new BCryptPasswordEncoder().encode("admin123"), new ArrayList<>());
        } else {
            throw new UsernameNotFoundException("User not found");
        }
    }

    public Usuario loadUserByEmail(String email) throws UsernameNotFoundException {
        if(email == null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();

            if (auth != null && auth.isAuthenticated()) {
                Object principal = auth.getPrincipal();
                if (principal instanceof Usuario usuario) {
                     email = usuario.getEmail(); // <-- tu email
                }
            }
        }
        if(usuarioRepository.existsByEmail(email)){
            return usuarioRepository.findByEmail(email).get();
        }
        return null;
    }

    public Usuario getCurrentUser() throws Exception {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth != null){
            if (auth.isAuthenticated()) {
                Object principal = auth.getPrincipal();
                if (principal instanceof Usuario usuario) {
                    if (usuarioRepository.existsByEmail(usuario.getEmail())) {
                        return usuarioRepository.findByEmail(usuario.getEmail()).get();
                    }
                    throw new Exception("El usuario no existe");
                }
            }
            throw new Exception("El usuario no se encuentra logueado");
        }
        throw new Exception("No se pudo determinar el usuario a partir del token");
    }
}

