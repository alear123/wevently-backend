package com.wevently.wevently.Reportes.ServiciosMasSolicitados.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ProvinciaConLocalidadesDTO {
    private Long id;
    private String nombre;
    private List<LocalidadDTO> localidades;

    @Setter
    @Getter
    @AllArgsConstructor
    @NoArgsConstructor
    public static class LocalidadDTO {
        private Long id;
        private String nombre;
    }
}
