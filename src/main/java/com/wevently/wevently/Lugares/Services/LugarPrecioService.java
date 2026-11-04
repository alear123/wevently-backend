/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Lugares.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Lugares.Entities.LugarPrecio;
import com.wevently.wevently.Lugares.Repository.LugarPrecioRepository;
import org.springframework.stereotype.Service;

@Service
public class LugarPrecioService extends BaseService<LugarPrecio, Long, LugarPrecioRepository> {

    public LugarPrecioService(LugarPrecioRepository repository) {
        super(repository);
    }

}
