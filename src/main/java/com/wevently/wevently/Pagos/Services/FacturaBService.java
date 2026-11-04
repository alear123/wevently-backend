package com.wevently.wevently.Pagos.Services;

import org.springframework.stereotype.Service;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Pagos.Entities.FacturaB;
import com.wevently.wevently.Pagos.Repository.FacturaBRepository;

@Service
public class FacturaBService extends BaseService<FacturaB, Long, FacturaBRepository> {

    public FacturaBService(FacturaBRepository repository) {
        super(repository);
    }
}
