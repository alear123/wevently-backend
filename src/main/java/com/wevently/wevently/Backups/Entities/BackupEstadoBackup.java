/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Backups.Entities;
import com.wevently.wevently.Base.BaseEntity;
import jakarta.persistence.*;

import java.util.Date;

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
public class BackupEstadoBackup extends BaseEntity {
    
    private Date fechaDesde;
    private Date fechaHasta;
    @ManyToOne
    @JoinColumn(name = "estado_backup_id")
    private EstadoBackup estadoBackup;
}
