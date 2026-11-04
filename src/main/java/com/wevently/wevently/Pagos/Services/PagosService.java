/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Pagos.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Pagos.DTO.DTOMedioDePago;
import com.wevently.wevently.Pagos.DTO.PreferenceRequest;
import com.wevently.wevently.Pagos.DTO.PreferenceResult;
import com.wevently.wevently.Pagos.Entities.MedioDePago;
import com.wevently.wevently.Pagos.Repository.MedioDePagoRepository;

import jakarta.persistence.EntityNotFoundException;
import lombok.extern.slf4j.Slf4j;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
@Slf4j
public class PagosService extends BaseService<MedioDePago, Long, MedioDePagoRepository> {

    private final FactoriaPayment FactoriaMedioDePago;

    public PagosService(MedioDePagoRepository repository, FactoriaPayment factoriaPayment) {
        super(repository);
        this.FactoriaMedioDePago = factoriaPayment;
    }

    public List<MedioDePago> listarTodos() {
        Iterable<MedioDePago> iterable = repository.findAll();
        return StreamSupport
                .stream(iterable.spliterator(), false)
                .collect(Collectors.toList());
    }

    public MedioDePago obtenerPorId(Long Id) {
        return repository.findById(Id)
                .orElseThrow(() -> new EntityNotFoundException("Medio de pago no encontrado"));
    }

    public DTOMedioDePago cambiarVisibilidad(Long id) {
        MedioDePago medio = obtenerPorId(id);
        System.out.println("encontramos el medio: " + medio.getNombre());
        System.out.println("su boolean es: " + medio.getEsVisible());
        medio.setEsVisible(!medio.getEsVisible());
        System.out.println("su boolean lueego de la modificacion: " + medio.getEsVisible());
        MedioDePago medioActualizado = repository.save(medio);

        // hago el dto para devolver la info actualizada al front
        DTOMedioDePago medioDTO = DTOMedioDePago.builder()
                .id(medioActualizado.getId())
                .nombre(medioActualizado.getNombre())
                .esVisible(medioActualizado.getEsVisible())
                .codigo(medioActualizado.getCodigo())
                .tipo(medioActualizado.getTipo().name())
                .estado(medioActualizado.getEstado().name())
                .montoMax(medioActualizado.getRangoMontos().getMaximo())
                .montoMin(medioActualizado.getRangoMontos().getMinimo())
                .tiempoAcreditacion(medioActualizado.getTiempoAcreditacion())
                .build();

        return medioDTO;
    }

    public List<DTOMedioDePago> obtenerDisponiblesParaCompra() {
        List<MedioDePago> mediosPosta = FactoriaMedioDePago.obtenerMediosDisponibles();

        List<DTOMedioDePago> mediosFront = new ArrayList<>();
        for (MedioDePago medioPosta : mediosPosta) {
            DTOMedioDePago DTOmedio = DTOMedioDePago.builder()
                    .id(medioPosta.getId())
                    .nombre(medioPosta.getNombre())
                    .esVisible(medioPosta.getEsVisible())
                    .codigo(medioPosta.getCodigo())
                    .tipo(medioPosta.getTipo().name())
                    .estado(medioPosta.getEstado().name())
                    .montoMax(medioPosta.getRangoMontos().getMaximo())
                    .montoMin(medioPosta.getRangoMontos().getMinimo())
                    .tiempoAcreditacion(medioPosta.getTiempoAcreditacion())
                    .build();

            mediosFront.add(DTOmedio);

        }

        return mediosFront;
    }

    public void sincronizarConProveedor() {
        FactoriaMedioDePago.actualizarMediosDePago();
    }

    public PreferenceResult crearPreferencia(PreferenceRequest request) {
        return FactoriaMedioDePago.procesarPreferencia(request);
    }

    public MedioDePago buscarPorCodigo(String codigo) {
        return repository.findByCodigo(codigo).orElseThrow(
                () -> new EntityNotFoundException("no se encontro el medio de pago con codigo: {}" + codigo));
    }

}
