package com.wevently.wevently.UsuariosySeguridad.Services.Jwt;

import com.wevently.wevently.UsuariosySeguridad.Entities.Grupo;
import com.wevently.wevently.UsuariosySeguridad.Entities.Permiso;
import com.wevently.wevently.UsuariosySeguridad.Enum.MetodoHttp;
import com.wevently.wevently.UsuariosySeguridad.Services.PermisoService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.token.TokenService;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import jakarta.servlet.http.HttpServletRequest;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Aspect
@Component
public class PermissionAspect {

    private final HttpServletRequest request;
    private final UsuarioDetailsService usuarioDetailsService;
    private final PermisoService permisoService;

    public PermissionAspect(HttpServletRequest request, UsuarioDetailsService usuarioDetailsService, PermisoService permisoService) {
        this.request = request;
        this.usuarioDetailsService = usuarioDetailsService;
        this.permisoService = permisoService;
    }

    @Around("@annotation(TienePermisos)")
    public Object checkPermission(ProceedingJoinPoint joinPoint) throws Throwable {

        var grupos_permisos = usuarioDetailsService.getCurrentUser().verRolActual().getGrupos();
        // 3. Descubrir la ruta del método interceptado
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        Class<?> controllerClass = joinPoint.getTarget().getClass();

        // Parte común de clase (ej: @RequestMapping("/usuarios"))
        String basePath = "";
        if (controllerClass.isAnnotationPresent(RequestMapping.class)) {
            basePath = Arrays.stream(controllerClass.getAnnotation(RequestMapping.class).value())
                    .findFirst().orElse("");
        }
        Method realMethod = controllerClass.getMethod(method.getName(), method.getParameterTypes());
        // Parte del método (ej: @GetMapping("/listar"))
        String methodPath = extractMethodPath(realMethod);
        String metodoHttp = extractHttpMethod(realMethod);
        // Ruta final
        if(!basePath.startsWith("/")){
            basePath = "/" + basePath;
        }
        String ruta = basePath + methodPath;
        Permiso permiso = permisoService.findByRutaAndMetodoHttp(ruta, MetodoHttp.valueOf(metodoHttp));

        for (Grupo grupo : grupos_permisos) {
            if (grupo.getPermisos().contains(permiso)) {
                return joinPoint.proceed();
            }
        }

        throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,
                "No tiene permisos para acceder a " + ruta);
    }


    private String extractMethodPath(Method method) {
        if (method.isAnnotationPresent(GetMapping.class)) {
            return getFirstValue(method.getAnnotation(GetMapping.class).value());
        } else if (method.isAnnotationPresent(PostMapping.class)) {
            return getFirstValue(method.getAnnotation(PostMapping.class).value());
        } else if (method.isAnnotationPresent(PutMapping.class)) {
            return getFirstValue(method.getAnnotation(PutMapping.class).value());
        } else if (method.isAnnotationPresent(DeleteMapping.class)) {
            return getFirstValue(method.getAnnotation(DeleteMapping.class).value());
        } else if (method.isAnnotationPresent(RequestMapping.class)) {
            return getFirstValue(method.getAnnotation(RequestMapping.class).value());
        }
        return "";
    }

    private String extractHttpMethod(Method method) {
        if (method.isAnnotationPresent(GetMapping.class)) {
            return "GET";
        } else if (method.isAnnotationPresent(PostMapping.class)) {
            return "POST";
        } else if (method.isAnnotationPresent(PutMapping.class)) {
            return "PUT";
        } else if (method.isAnnotationPresent(DeleteMapping.class)) {
            return "DELETE";
        } else if (method.isAnnotationPresent(RequestMapping.class)) {
            RequestMapping mapping = method.getAnnotation(RequestMapping.class);
            if (mapping.method().length > 0) {
                return mapping.method()[0].name();
            }
        }
        return "UNKNOWN";
    }


    private String getFirstValue(String[] values) {
        return values.length > 0 ? values[0] : "";
    }

}
