package com.wevently.wevently.Pagos.Services;

//entidades - dtos
import com.wevently.wevently.Pagos.DTO.PaymentRequest;
import com.wevently.wevently.Pagos.DTO.PaymentResult;
import com.wevently.wevently.Pagos.DTO.PreferenceRequest;
import com.wevently.wevently.Pagos.DTO.PreferenceResult;
import com.wevently.wevently.Pagos.Entities.MedioDePago;

//framework, repo y estrategias
import com.wevently.wevently.Pagos.External.Providers.PaymentProviderStrategy;
import com.wevently.wevently.Pagos.Repository.MedioDePagoRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class FactoriaPayment {
    private final PaymentProviderStrategy EstrategiaDePago;
    private final MedioDePagoRepository medioDePagoRepository;

    public FactoriaPayment(PaymentProviderStrategy paymentStrategy,
            MedioDePagoRepository medioDePagoRepository) {
        this.EstrategiaDePago = paymentStrategy;
        this.medioDePagoRepository = medioDePagoRepository;
    }

    public List<MedioDePago> obtenerMediosDisponibles() {
        return medioDePagoRepository.findMediosActivos();
    }

    public PaymentResult procesarPago(PaymentRequest request) {
        Optional<MedioDePago> medio = medioDePagoRepository.findByCodigo(request.getMedioPagoId());

        if (medio.isEmpty() || !medio.get().getEsVisible()) {
            return PaymentResult.error("el medio de pago no está disponible, proba otro");
        }

        System.out
                .println("medio encontrado: " + medio.get().getNombre() + " - Visible: " + medio.get().getEsVisible());

        return EstrategiaDePago.crearPago(request);
    }

    public void actualizarMediosDePago() {
        List<MedioDePago> mediosExternos = EstrategiaDePago.obtenerMediosDePago();

        for (MedioDePago medioExterno : mediosExternos) {
            Optional<MedioDePago> medioExistente = medioDePagoRepository.findByCodigo(medioExterno.getCodigo());

            if (medioExistente.isPresent()) {
                MedioDePago medio = medioExistente.get();
                medio.setNombre(medioExterno.getNombre());
                medio.setEstado(medioExterno.getEstado());
                medio.setRangoMontos(medioExterno.getRangoMontos());
                medio.setTiempoAcreditacion(medioExterno.getTiempoAcreditacion());
                medio.setFechaHoraModificacion(LocalDateTime.now());
                medioDePagoRepository.save(medio);
            } else {
                medioExterno.setEsVisible(true);
                medioDePagoRepository.save(medioExterno);
            }
        }
    }

    public PreferenceResult procesarPreferencia(PreferenceRequest request) {
        return EstrategiaDePago.crearPreferencia(request);
    }

}
