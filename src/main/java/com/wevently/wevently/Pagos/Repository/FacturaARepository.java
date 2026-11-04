package com.wevently.wevently.Pagos.Repository;

import org.springframework.stereotype.Repository;

import com.wevently.wevently.Base.BaseRepository;
import com.wevently.wevently.Pagos.Entities.FacturaA;

@Repository
public interface FacturaARepository extends BaseRepository<FacturaA, Long> {

    FacturaA findTopByOrderByNumeroComprobanteDesc();
}
