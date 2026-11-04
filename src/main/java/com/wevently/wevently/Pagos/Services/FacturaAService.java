package com.wevently.wevently.Pagos.Services;

import org.springframework.stereotype.Service;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Pagos.Entities.FacturaA;
import com.wevently.wevently.Pagos.Repository.FacturaARepository;

@Service
public class FacturaAService extends BaseService<FacturaA, Long, FacturaARepository> {

    public FacturaAService(FacturaARepository repository) {
        super(repository);
    }
}
