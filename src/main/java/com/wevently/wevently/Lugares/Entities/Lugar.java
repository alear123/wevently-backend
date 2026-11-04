package com.wevently.wevently.Lugares.Entities;

import com.wevently.wevently.Base.BaseEntity;
import com.wevently.wevently.Eventos.Entities.EventoSoportado;
import com.wevently.wevently.Eventos.Entities.Reseña;
import com.wevently.wevently.Imagenes.Entities.Imagen;
import com.wevently.wevently.Servicios.Entities.ServicioSoportado;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Audited
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Lugares")
public class Lugar extends BaseEntity {
    @NotBlank
    private String nombre;
    private String descripcion;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "lugar_id")
    private List<Imagen> imagenes;
    @NotBlank
    private String direccion;
    private Integer capacidadPersonas;
    @NotNull
    private LocalDateTime fechaHoraAlta;
    private LocalDateTime fechaHoraBaja;
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    private TipoLugar tipoLugar;
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Localidad localidad;
    @ManyToMany(cascade = CascadeType.PERSIST)
    @JoinTable(name = "lugar_caracteristica", joinColumns = @JoinColumn(name = "lugar_id"), inverseJoinColumns = @JoinColumn(name = "caracteristica_id"))
    private List<Caracteristica> caracteristicas;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "lugar_id")
    private List<Reseña> reseñas;
    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinColumn(name = "lugar_id")
    private List<ServicioSoportado> serviciosSoportados;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "lugar_id")
    private List<LugarPrecio> lugarPrecios = new ArrayList<>();
    @NotNull
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Usuario propietario;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "lugar_id")
    private List<EventoSoportado> eventosSoportados;
}
