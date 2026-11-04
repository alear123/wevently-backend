/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Servicios.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Servicios.Entities.Chat;

import java.util.Optional;

import org.springframework.stereotype.Repository;

@Repository
public interface ChatRepository extends BaseRepository<Chat, Long> {

    Optional<Chat> findByReserva(Reserva reserva);
}
