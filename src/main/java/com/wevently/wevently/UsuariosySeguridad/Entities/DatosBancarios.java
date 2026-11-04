package com.wevently.wevently.UsuariosySeguridad.Entities;

import java.time.LocalDateTime;

import com.wevently.wevently.Base.BaseEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "datos_bancarios")
public class DatosBancarios extends BaseEntity {

    private String CBUCVU;
    private String Alias;

    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
    @OneToOne
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

}
