/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Servicios.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Servicios.DTO.DtoNuevaPropuesta;
import com.wevently.wevently.Servicios.DTO.DtoPropuesta;
import com.wevently.wevently.Servicios.Entities.Chat;
import com.wevently.wevently.Servicios.Entities.Propuesta;
import com.wevently.wevently.Servicios.Repository.PropuestaRepository;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Services.Jwt.UsuarioDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class PropuestaService extends BaseService<Propuesta, Long, PropuestaRepository> {

    @Autowired
    UsuarioDetailsService userDetailsService;
    @Autowired
    SimpMessagingTemplate messagingTemplate;

    public PropuestaService(PropuestaRepository repository) {
        super(repository);
    }




    public Propuesta getPropuestaActiva(Chat chat){

        for(Propuesta p : chat.getPropuestas()){
            if(p.getFechaHoraBaja() == null){
                return p;
            }
        }
        return null;
    }
}
