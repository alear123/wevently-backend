package com.wevently.wevently.Pagos.Services;

import org.springframework.stereotype.Service;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Pagos.Entities.ItemFactura;
import com.wevently.wevently.Pagos.Repository.ItemFacturaRepository;

@Service
public class ItemFacturaService extends BaseService<ItemFactura, Long, ItemFacturaRepository> {

    public ItemFacturaService(ItemFacturaRepository repository) {
        super(repository);
    }
}
