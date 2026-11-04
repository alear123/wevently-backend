package com.wevently.wevently.UsuariosySeguridad.Services.Jwt;


import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface TienePermisos {
}
