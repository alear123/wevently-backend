package com.wevently.wevently.UsuariosySeguridad.Services;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.UsuariosySeguridad.Entities.DatosBancarios;
import com.wevently.wevently.UsuariosySeguridad.Repository.DatosBancariosRepository;

@Service
@Transactional
public class DatosBancariosService extends BaseService<DatosBancarios, Long, DatosBancariosRepository> {

    public DatosBancariosService(DatosBancariosRepository repository) {
        super(repository);
    }
}
