/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.wevently.wevently.Backups.Repository;

import com.wevently.wevently.Backups.Entities.BackupConfiguracion;
import com.wevently.wevently.Base.BaseRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BackupsRepository extends BaseRepository<BackupConfiguracion, Long> {

    public List<BackupConfiguracion> findAll();

}
