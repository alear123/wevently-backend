package com.wevently.wevently.Pagos.Services;

import com.wevently.wevently.Base.Excepciones.ErrorDeNegocio;
import com.wevently.wevently.Eventos.DTO.ConfirmarReservaDTO;
import com.wevently.wevently.Eventos.Entities.Reserva;
import com.wevently.wevently.Eventos.Repository.ReservaRepository;
import com.wevently.wevently.Pagos.DTO.DTOTransferenciaPendiente;
import com.wevently.wevently.Pagos.Entities.AuditoriaTransaccion;
import com.wevently.wevently.Pagos.Repository.AuditoriaTransaccionRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class AuditoriaTransaccionService {

        private static final Logger log = LoggerFactory.getLogger(AuditoriaTransaccionService.class);

        private final AuditoriaTransaccionRepository repository;

        @Autowired
        private ParametroComisionService parametroComisionService;

        @Autowired
        private ReservaRepository reservaRepository;

        public AuditoriaTransaccionService(AuditoriaTransaccionRepository repository) {
                this.repository = repository;
        }

        public AuditoriaTransaccion registrarProximaTransferencia(ConfirmarReservaDTO entity, Reserva actualizada)
                        throws ErrorDeNegocio {

                BigDecimal comisionNos = parametroComisionService.calcularComisionNosotros(
                                entity.getTransactionAmount(),
                                actualizada);
                BigDecimal montoTransferir = entity.getTransactionAmount().subtract(comisionNos)
                                .subtract(entity.getFeeAmount());

                AuditoriaTransaccion auditoria = AuditoriaTransaccion.builder()
                                .reservaId(actualizada.getId())
                                .organizadorId(actualizada.getOrganizador().getId())
                                .prestadorId(actualizada.getPrestador().getId())
                                .montoTotal(entity.getTransactionAmount())
                                .comisionMercadoPago(entity.getFeeAmount())
                                .comisionNosotros(comisionNos)
                                .montoAtransferir(montoTransferir)
                                .idPago(entity.getIdPago())
                                .fechaPago(entity.getDateApproved().toLocalDateTime())
                                .fechaCreacionPago(entity.getDateCreated().toLocalDateTime())
                                .metodoPago(entity.getPaymentMethodId())
                                .fechaHoraCreacionAuditoria(LocalDateTime.now())
                                .build();

                AuditoriaTransaccion resultado = repository.save(auditoria);

                log.info("Auditoría registrada - ID: {}, Reserva: {}, Transferencia: {}",
                                resultado.getId(), resultado.getReservaId(), resultado.getMontoAtransferir());

                return resultado;
        }

        public List<DTOTransferenciaPendiente> obtenerTransferenciasPendientes() {
                // deberia traerme las auditoria transaccion q sean (hoy >=) &
                // fechaHoraTransaccion sea null
                LocalDateTime hoy = LocalDateTime.now();

                List<AuditoriaTransaccion> auditorias = repository.findTransferenciasPendientes(hoy);

                return auditorias.stream()
                                .map(this::convertirADTO)
                                .collect(Collectors.toList());

        }

        private DTOTransferenciaPendiente convertirADTO(AuditoriaTransaccion aud) {
                try {
                        // no me hace falta verificar la fecha del evento xq x lo gral fechaEvento =
                        // fechaReserva
                        Reserva reserva = reservaRepository.findById(aud.getReservaId())
                                        .orElseThrow(() -> new ErrorDeNegocio(
                                                        "Reserva no encontrada: " + aud.getReservaId()));

                        return DTOTransferenciaPendiente.builder()
                                        .idAuditoriaTransaccion(aud.getId())
                                        .fechaOperacion(aud.getFechaCreacionPago())
                                        .nombreOrganizador(reserva.getOrganizador().getNombre() + " "
                                                        + reserva.getOrganizador().getApellido())
                                        .nombrePrestador(reserva.getPrestador().getNombre() + " "
                                                        + reserva.getPrestador().getApellido())
                                        .alias(reserva.getPrestador().getDatosBancarios().getAlias())
                                        .CBUCVU(reserva.getPrestador().getDatosBancarios().getCBUCVU())
                                        .montoAtransferir(aud.getMontoAtransferir())
                                        .fechaHoraModificacion(aud.getFechaHoraModificacion())
                                        .build();
                } catch (Exception e) {
                        throw new RuntimeException("Error al convertir auditoria a DTO", e);
                }
        }

        public void actualizarEstadoTransaccion(Long idAuditoria) {
                AuditoriaTransaccion auditoria = repository.findById(idAuditoria)
                                .orElseThrow(() -> new RuntimeException("Auditoría de transaccion no encontrada"));

                if (auditoria.getFechaHoraTransaccion() != null) {
                        throw new RuntimeException("La transferencia ya fue confirmada previamente");
                }

                auditoria.setFechaHoraTransaccion(LocalDateTime.now());
                auditoria.setFechaHoraModificacion(LocalDateTime.now());
                repository.save(auditoria);

                log.info("Transferencia confirmada - Auditoria ID: {}, Monto: {}",
                                idAuditoria, auditoria.getMontoAtransferir());
        }
}
