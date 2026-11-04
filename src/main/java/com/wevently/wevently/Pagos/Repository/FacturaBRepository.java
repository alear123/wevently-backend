package com.wevently.wevently.Pagos.Repository;

import org.springframework.stereotype.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Pagos.Entities.FacturaB;

@Repository
public interface FacturaBRepository extends BaseRepository<FacturaB, Long> {

    FacturaB findTopByOrderByNumeroComprobanteDesc();
}
