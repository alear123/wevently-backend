package com.wevently.wevently.Lugares.Entities;

import com.wevently.wevently.Base.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.time.LocalDateTime;
import java.util.Date;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class LugarPrecio extends BaseEntity {
    @NotNull
    private LocalDateTime fechaDesde;
    private LocalDateTime fechaHasta;
    @NotNull
    private Float precio;
}
