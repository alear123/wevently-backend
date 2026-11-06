/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wevently.wevently.Backups.Services;

import com.wevently.wevently.Backups.DTO.BackupConfiguracionResponseDTO;
import java.time.format.DateTimeFormatter;
import com.wevently.wevently.Backups.DTO.DtoBackup;
import com.wevently.wevently.Backups.DTO.DtoModificacionBackup;
import com.wevently.wevently.Backups.DTO.DtoNuevoBackup;
import com.wevently.wevently.Backups.Entities.BackupConfiguracion;
import com.wevently.wevently.Backups.Entities.BackupEstadoBackup;
import com.wevently.wevently.Backups.Entities.BackupFisico;
import com.wevently.wevently.Backups.Entities.EstadoBackup;
import com.wevently.wevently.Backups.Enums.EstadoBackupFisico;
import com.wevently.wevently.Backups.Enums.FrecuenciaBackup;
import com.wevently.wevently.Backups.Repository.BackupFisicoRepository;
import com.wevently.wevently.Backups.Repository.BackupsRepository;
import com.wevently.wevently.Backups.Repository.EstadoBackupRepository;
import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.UsuariosySeguridad.Entities.Usuario;
import com.wevently.wevently.UsuariosySeguridad.Repository.UsuarioRepository;
import com.wevently.wevently.UsuariosySeguridad.Services.NotificacionService;
import com.zaxxer.hikari.HikariDataSource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import javax.sql.DataSource;

@Service
public class BackupsService extends BaseService<BackupConfiguracion, Long, BackupsRepository> {

    @Autowired
    UsuarioRepository repoUsuario;

    @Autowired
    EstadoBackupRepository repoEstadoBackup;

    @Autowired
    BackupFisicoRepository repoBackupFisico;

    @Value("${DB_USERNAME}")
    private String mysqlUser;

    @Value("${DB_PASSWORD}")
    private String mysqlPassword;

    @Value("${MYSQL_DATABASE}")
    private String mysqlDatabase;

    @Value("${BACKUP_DIRECTORY}")
    private String backupDirectory;

    // Carpeta donde están mysqldump y mysql (configurable con MYSQL_BIN_DIR)
    @Value("${MYSQL_BIN_DIR:C:\\Program Files\\MySQL\\MySQL Server 9.2\\bin}")
    private String mysqlBinDir;

    // Devuelve la ruta completa al ejecutable (agrega .exe en Windows)
    private String mysqlBinario(String nombre) {
        boolean esWindows = System.getProperty("os.name").toLowerCase().contains("win");
        return mysqlBinDir + File.separator + nombre + (esWindows ? ".exe" : "");
    }

    @Autowired
    private NotificacionService notificacionService;

    public BackupsService(BackupsRepository repository) {
        super(repository);
    }

    public List<DtoBackup> listarBackups() {

        List<BackupConfiguracion> configs = repository.findAll();

        return configs.stream()
                .map(config -> {
                    // Forzar carga de backupEstadoBackups y backupsFisicos
                    config.getBackupEstadoBackups().size(); // carga la colección
                    if (config.getBackupsFisicos() != null) {
                        config.getBackupsFisicos().size(); // carga la colección
                    }
                    return new DtoBackup(config);
                })
                .collect(Collectors.toList());
    }

    @Transactional
    public BackupConfiguracion createBackup(DtoNuevoBackup dto, String email) {
        // Buscar usuario
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        // Crear la configuración backup
        BackupConfiguracion backup = new BackupConfiguracion();
        backup.setNombre(dto.getNombre());
        backup.setDiasRetencion(dto.getRetencion());
        backup.setFechaProgramada(dto.getFechaProgramada());
        backup.setFechaHora(LocalDateTime.now());
        backup.setUsuario(usuario);
        backup.setFrecuencia(dto.getFrecuencia());

        // Estado inicial ACTIVA
        EstadoBackup estadoPendiente = repoEstadoBackup.findByNombre("ACTIVA")
                .orElseGet(() -> {
                    EstadoBackup nuevo = new EstadoBackup();
                    nuevo.setNombre("ACTIVA");
                    nuevo.setFechaHoraAlta(LocalDateTime.now());
                    return repoEstadoBackup.save(nuevo);
                });

        BackupEstadoBackup backupEstado = new BackupEstadoBackup();
        backupEstado.setEstadoBackup(estadoPendiente);
        backupEstado.setFechaDesde(new Date());

        backup.setBackupEstadoBackups(List.of(backupEstado));

        // Crear backup físico inicial PENDIENTE
        BackupFisico fisico = new BackupFisico();
        LocalDateTime fecha = dto.getFechaProgramada() != null ? dto.getFechaProgramada() : LocalDateTime.now();
        fisico.setNombre("Backup inicial de " + dto.getNombre() + " - " + fecha.format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss")));
        fisico.setFechaHora(fecha);
        fisico.setTamaño(0.0); // aún no generado
        fisico.setEsquemaDbHash(""); // se calcula cuando se ejecute
        fisico.setDiasRetencion(dto.getRetencion());
        fisico.setEstadoBackupFisico(EstadoBackupFisico.PENDIENTE);

        // Asociar el backup físico a la configuración
        backup.getBackupsFisicos().add(fisico);

        // Guardar la configuración junto con el backup físico
        repository.save(backup);

        return backup;
    }

    @Transactional
    public BackupConfiguracionResponseDTO modificarConfiguracion(Long id, DtoModificacionBackup dto) {
        BackupConfiguracion config = repository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Configuración no encontrada con id: " + id));

        config.setNombre(dto.getNombre());
        config.setDiasRetencion(dto.getRetencion());

        if (config.getBackupsFisicos() != null) {
            config.getBackupsFisicos().stream()
                    .filter(bf -> bf.getEstadoBackupFisico() == EstadoBackupFisico.PENDIENTE)
                    .forEach(bf -> bf.setDiasRetencion(dto.getRetencion()));
        }

        BackupConfiguracion guardada = repository.save(config);

        return new BackupConfiguracionResponseDTO(
                guardada.getId(),
                guardada.getNombre(),
                guardada.getDiasRetencion()
        );
    }


    @Transactional
    public BackupConfiguracion cancelarBackup(Long idBackup, String email) {
        // Buscar usuario
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        // Buscar backup
        BackupConfiguracion backup = repository.findById(idBackup)
                .orElseThrow(() -> new EntityNotFoundException("Backup no encontrado con id: " + idBackup));

        // Buscar estado ACTIVA actual de la configuración
        Optional<BackupEstadoBackup> estadoActivoOpt = backup.getBackupEstadoBackups().stream()
                .filter(beb -> beb.getEstadoBackup().getNombre().equals("ACTIVA"))
                .filter(beb -> beb.getFechaHasta() == null)
                .findFirst();

        if (estadoActivoOpt.isEmpty()) {
            throw new RuntimeException("La configuracion de backup no está en estado ACTIVA y no puede cancelarse");
        }

        BackupEstadoBackup estadoActivo = estadoActivoOpt.get();

        // Cerrar el estado ACTIVA
        estadoActivo.setFechaHasta(new Date());

        // Buscar o crear estado INACTIVA
        EstadoBackup estadoCancelado = repoEstadoBackup.findByNombre("INACTIVA")
                .orElseGet(() -> {
                    EstadoBackup nuevo = new EstadoBackup();
                    nuevo.setNombre("INACTIVA");
                    nuevo.setFechaHoraAlta(LocalDateTime.now());
                    return repoEstadoBackup.save(nuevo);
                });

        // Crear nuevo estado para la configuración
        BackupEstadoBackup nuevoEstado = new BackupEstadoBackup();
        nuevoEstado.setEstadoBackup(estadoCancelado);
        nuevoEstado.setFechaDesde(new Date());

        backup.getBackupEstadoBackups().add(nuevoEstado);

        // Cambiar todos los backups físicos pendientes a CANCELADO
        if (backup.getBackupsFisicos() != null) {
            backup.getBackupsFisicos().stream()
                    .filter(bf -> bf.getEstadoBackupFisico() == EstadoBackupFisico.PENDIENTE)
                    .forEach(bf -> bf.setEstadoBackupFisico(EstadoBackupFisico.CANCELADO));
        }

        // Guardar los cambios
        repository.save(backup);

        return backup;
    }


    @Scheduled(cron = "0 0 1 * * *")
    @Transactional
    public void ejecutarBackupsPendientes() {
        System.out.println("Inicio revisión diaria de backups pendientes: " + LocalDateTime.now() );

        // Traer todas las configuraciones activas
        List<BackupConfiguracion> configs = repository.findAll();
        System.out.println("Configuraciones encontradas: " + configs.size());

        for (BackupConfiguracion config : configs) {
            System.out.println("Revisando configuración: " + config.getNombre());
            config.getBackupsFisicos().forEach(bf ->
                    System.out.println("    Backup: " + bf.getNombre() + " - Estado: " + bf.getEstadoBackupFisico() + " - FechaHora: " + bf.getFechaHora())
            );

            if (config.getBackupsFisicos() == null) {
                System.out.println("  No tiene backups físicos. Continuando...");
                continue;
            }

            List<BackupFisico> pendientes = config.getBackupsFisicos().stream()
                    .filter(bf -> bf.getEstadoBackupFisico() == EstadoBackupFisico.PENDIENTE
                            && bf.getFechaHora().isBefore(LocalDateTime.now()))
                    .toList();

            System.out.println("  Backups pendientes encontrados: " + pendientes.size());

            for (BackupFisico bf : pendientes) {
                System.out.println("    Procesando backup: " + bf.getNombre() + " - FechaHora: " + bf.getFechaHora());

                try {
                    // Ejecutar backup físico
                    ejecutarBackupFisico(bf, config);
                    System.out.println("    Backup ejecutado correctamente: " + bf.getNombre());

                    // Crear inmediatamente el siguiente backup pendiente
                    LocalDateTime proximaFecha = calcularProximaFecha(bf.getFechaHora(), config.getFrecuencia());
                    System.out.println("    Próxima fecha calculada: " + proximaFecha);

                    System.out.println("calcularProximaFecha: bf=" + bf + " frecuencia=" + config.getFrecuencia() + " -> proximaFecha=" + proximaFecha);

                    if (proximaFecha != null) {
                        BackupFisico nuevo = new BackupFisico();
                        String nombreConFecha = "Backup de " + config.getNombre() + " - " + proximaFecha.format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
                        nuevo.setNombre(nombreConFecha);
                        nuevo.setFechaHora(proximaFecha);
                        nuevo.setTamaño(0.0);
                        nuevo.setEsquemaDbHash("");
                        nuevo.setDiasRetencion(config.getDiasRetencion());
                        nuevo.setEstadoBackupFisico(EstadoBackupFisico.PENDIENTE);
                        nuevo.setConfiguracion(config);

                        config.getBackupsFisicos().add(nuevo);
                        repository.save(config);


                    }

                } catch (Exception e) {
                    System.err.println("    ERROR al ejecutar backup físico " + bf.getNombre() + ": " + e.getMessage());
                    e.printStackTrace();
                }
            }
        }

        System.out.println("=== Fin revisión diaria de backups pendientes ===");
    }


    // Calcula la próxima fecha a partir de un backup ejecutado
    private LocalDateTime calcularProximaFecha(LocalDateTime fechaReferencia, FrecuenciaBackup frecuencia) {
        if (frecuencia == null || fechaReferencia == null) return null;


        System.out.println("calcularProximaFecha -> fechaActual=" + fechaReferencia + ", frecuencia=" + frecuencia);

        if (frecuencia == null) {
            System.out.println("Frecuencia nula, devolviendo null");
            return null;
        }

        return switch (frecuencia) {
            case DIARIO -> fechaReferencia.plusDays(1);
            case SEMANAL -> fechaReferencia.plusWeeks(1);
            case MENSUAL -> fechaReferencia.plusMonths(1);
        };
    }



    private void ejecutarBackupFisico(BackupFisico bf, BackupConfiguracion config) throws Exception {
        String basePath = System.getProperty("user.dir");
        String backupDir = basePath + File.separator + backupDirectory;

        File directory = new File(backupDir);
        if (!directory.exists()) directory.mkdirs();

        String fechaStr = bf.getFechaHora().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
        String filePath = backupDir + File.separator + "backup_" + bf.getNombre() + "_" + fechaStr + ".sql";

        bf.setFilePath(filePath);

        // Ejecución del mysqldump (igual que antes)
        ProcessBuilder pb = new ProcessBuilder(
                mysqlBinario("mysqldump"),
                "-u", mysqlUser,
                "-p" + mysqlPassword,
                "--single-transaction",
                "--routines",
                "--triggers",
                "--events",
                "--add-drop-table",
                "--skip-comments",
                "--compact",
                "--ignore-table=" + mysqlDatabase + ".backup_configuracion_backup_estado_backup_aud",
                "--ignore-table=" + mysqlDatabase + ".backup_configuracion_backup_fisico_aud",
                "--ignore-table=" + mysqlDatabase + ".backup_estado_backup",
                "--ignore-table=" + mysqlDatabase + ".backup_estado_backup_aud",
                "--ignore-table=" + mysqlDatabase + ".backups_configuraciones",
                "--ignore-table=" + mysqlDatabase + ".backups_configuraciones_aud",
                "--ignore-table=" + mysqlDatabase + ".backups_fisicos",
                "--ignore-table=" + mysqlDatabase + ".backups_fisicos_aud",
                "--ignore-table=" + mysqlDatabase + ".estados_backup",
                "--ignore-table=" + mysqlDatabase + ".estados_backup_aud",
                mysqlDatabase
        );

        pb.redirectErrorStream(false);
        Process process = pb.start();

        try (FileOutputStream fos = new FileOutputStream(filePath);
             BufferedInputStream bis = new BufferedInputStream(process.getInputStream())) {

            byte[] buffer = new byte[8192];
            int read;
            long totalBytes = 0;
            while ((read = bis.read(buffer)) != -1) {
                fos.write(buffer, 0, read);
                totalBytes += read;
            }
            bf.setTamaño(totalBytes / (1024.0 * 1024.0));
        }

        int exitCode = process.waitFor();
        if (exitCode != 0) throw new RuntimeException("Error al ejecutar mysqldump, código: " + exitCode);

        // Actualizar estado físico a COMPLETADO
        bf.setEstadoBackupFisico(EstadoBackupFisico.COMPLETADO);
        bf.setEsquemaDbHash(generarHashEsquema());

        System.out.println("Backup completado: " + filePath + " (" + String.format("%.2f", bf.getTamaño()) + " MB)");

        // Persistir cambios a través de la configuración
        repository.save(config);
    }


    // Ejecuta diariamente a las 2 AM
    @Scheduled(cron = "0 0 2 * * *")
    @Transactional
    public void limpiarBackupsPorRetencion() {
        System.out.println("Revisión diaria de backups físicos por retención: " + LocalDateTime.now());

        // Obtener todas las configuraciones que tengan backups físicos
        List<BackupConfiguracion> configuraciones = repository.findAll();

        LocalDateTime ahora = LocalDateTime.now();

        for (BackupConfiguracion config : configuraciones) {
            List<BackupFisico> backups = config.getBackupsFisicos();

            for (BackupFisico bf : backups) {
                // Solo considerar los COMPLETADOS
                if (bf.getEstadoBackupFisico() != EstadoBackupFisico.COMPLETADO) continue;

                // Fecha de creación + días de retención
                LocalDateTime fechaExpiracion = bf.getFechaHora().plusDays(bf.getDiasRetencion());

                if (fechaExpiracion.isBefore(ahora)) {
                    System.out.println(
                            "El backup físico " + bf.getNombre() + " ha superado los días de retención. Eliminando...");

                    // Eliminar archivo físico
                    if (bf.getFilePath() != null) {
                        File file = new File(bf.getFilePath());
                        if (file.exists()) {
                            boolean eliminado = file.delete();
                            if (eliminado) {
                                System.out.println("Archivo eliminado: " + bf.getFilePath());
                            } else {
                                System.err.println("No se pudo eliminar el archivo: " + bf.getFilePath());
                            }
                        }
                    }

                    // Marcar como ELIMINADO
                    bf.setEstadoBackupFisico(EstadoBackupFisico.ELIMINADO);
                }
            }

            // Guardar cambios en la configuración (persistirá los backups físicos modificados)
            repository.save(config);
        }
    }


    /*@Transactional
    public Resource descargarBackup(Long idBackup) {
        // Buscar backup
        Backup backup = repository.findById(idBackup)
                .orElseThrow(() -> new EntityNotFoundException("Backup no encontrado con id: " + idBackup));

        // Verificar si tiene estado COMPLETADO
        boolean esCompletado = backup.getBackupEstadoBackups().stream()
                .anyMatch(beb ->
                    beb.getEstadoBackup().getNombre().equalsIgnoreCase("COMPLETADO")
                    && beb.getFechaHasta() == null
                );

        if (!esCompletado) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "El backup no está completado y no puede descargarse"
            );
        }

        // Verificar que exista el archivo físico
        if (backup.getFilePath() == null) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND,
                    "El archivo del backup no está disponible"
            );
        }

        File file = new File(backup.getFilePath());
        if (!file.exists()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND,
                    "El archivo físico no se encontró en el servidor"
            );
        }

        return new FileSystemResource(file);
    }*/


    private String generarHashEsquema() {
        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/" + mysqlDatabase, mysqlUser, mysqlPassword)) {

            DatabaseMetaData metaData = conn.getMetaData();
            StringBuilder esquemaInfo = new StringBuilder();

            try (ResultSet tablas = metaData.getTables(mysqlDatabase, null, "%", new String[]{"TABLE"})) {
                while (tablas.next()) {
                    String nombreTabla = tablas.getString("TABLE_NAME");
                    esquemaInfo.append(nombreTabla).append(":");

                    try (ResultSet columnas = metaData.getColumns(mysqlDatabase, null, nombreTabla, "%")) {
                        while (columnas.next()) {
                            esquemaInfo.append(columnas.getString("COLUMN_NAME"))
                                    .append(columnas.getString("TYPE_NAME"))
                                    .append(";");
                        }
                    }
                    esquemaInfo.append("|");
                }
            }

            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(esquemaInfo.toString().getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) hexString.append(String.format("%02x", b));
            return hexString.toString();

        } catch (Exception e) {
            throw new RuntimeException("Error al generar hash del esquema", e);
        }
    }


    @Async("backupTaskExecutor")
    public void restaurarBackup(Long idBackup, String email) {
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado"));

        BackupFisico backup = repoBackupFisico.findById(idBackup)
                .orElseThrow(() -> new EntityNotFoundException("Backup no encontrado"));

        // VERIFICAR HASH DEL ESQUEMA
        String hashActual = generarHashEsquema();
        String hashBackup = backup.getEsquemaDbHash();

        System.out.println("   Hash BD actual: " + hashActual);
        System.out.println("   Hash Backup:    " + hashBackup);

        if (hashBackup == null || hashBackup.isEmpty()) {
            System.out.println("  El backup no tiene hash de esquema registrado");
            System.out.println("   Se continuará con la restauración (advertencia)");
        } else if (!hashActual.equals(hashBackup)) {
            System.out.println("  ¡ADVERTENCIA! Los esquemas NO coinciden");
            System.out.println("   Esquema actual:  " + hashActual.substring(0, 16) + "...");
            System.out.println("   Esquema backup:  " + hashBackup.substring(0, 16) + "...");

            throw new RuntimeException("Restauración cancelada: El esquema del backup no coincide con la base de datos actual");
        } else {
            System.out.println("Los esquemas coinciden perfectamente");
        }

        // Simplemente restaurar - NO actualizar el registro del backup
        restaurarConSalidaVisible(backup);

        System.out.println("Restauración completada exitosamente");
        System.out.println(" El backup conserva su información original");
        notificacionService.notificarAlerta(
                usuario.getId(),
                "Restauración completada",
                "El backup '" + backup.getNombre() + "' fue restaurado exitosamente.",
                null
        );
    }

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private DataSource dataSource;

    @Async("backupTaskExecutor")
    public void restaurarConSalidaVisible(BackupFisico  backup) {
        File sqlFile = new File(backup.getFilePath());
        if (!sqlFile.exists()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Archivo SQL no encontrado");
        }

        System.out.println("Iniciando restauración: " + sqlFile.getAbsolutePath());
        System.out.println("Tamaño del archivo: " + String.format("%.2f MB", sqlFile.length() / 1024.0 / 1024.0));

        try {
            String mysqlPath = mysqlBinario("mysql");

            // PASO 0: Cerrar el pool de conexiones de Hibernate
            System.out.println("Cerrando conexiones de Hibernate");
            if (dataSource instanceof HikariDataSource) {
                HikariDataSource hikariDataSource = (HikariDataSource) dataSource;
                System.out.println("   Conexiones activas: " + hikariDataSource.getHikariPoolMXBean().getActiveConnections());
                System.out.println("   Conexiones idle: " + hikariDataSource.getHikariPoolMXBean().getIdleConnections());

                // Cerrar todas las conexiones
                hikariDataSource.getHikariPoolMXBean().softEvictConnections();
                Thread.sleep(2000); // Esperar que se cierren

                System.out.println(" Conexiones cerradas correctamente");
            }

            // PASO 1: MATAR conexiones restantes desde MySQL
            System.out.println(" Forzando cierre de conexiones en MySQL");

            ProcessBuilder getConnections = new ProcessBuilder(
                    mysqlPath,
                    "-u" + mysqlUser,
                    "-p" + mysqlPassword,
                    "-N", "-B",
                    "-e",
                    "SELECT id FROM information_schema.processlist " +
                            "WHERE db = '" + mysqlDatabase + "' AND id != CONNECTION_ID();"
            );

            getConnections.redirectErrorStream(true);
            Process getConnProc = getConnections.start();

            List<String> connectionIds = new ArrayList<>();
            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(getConnProc.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    if (!line.contains("Using a password") && !line.trim().isEmpty()) {
                        connectionIds.add(line.trim());
                    }
                }
            }
            getConnProc.waitFor();

            // Matar cada conexión
            if (!connectionIds.isEmpty()) {
                System.out.println("   Matando " + connectionIds.size() + " conexiónes");
                for (String connId : connectionIds) {
                    ProcessBuilder killConn = new ProcessBuilder(
                            mysqlPath,
                            "-u" + mysqlUser,
                            "-p" + mysqlPassword,
                            "-e",
                            "KILL " + connId + ";"
                    );
                    killConn.redirectErrorStream(true);
                    Process killProc = killConn.start();
                    killProc.waitFor();
                    System.out.println("Conexión " + connId + " cerrada");
                }
                Thread.sleep(1000);
            } else {
                System.out.println(" No hay conexiones activas");
            }

            // PASO 2: Obtener lista de tablas
            System.out.println("Generando script de limpieza");

            ProcessBuilder listTables = new ProcessBuilder(
                    mysqlPath,
                    "-u" + mysqlUser,
                    "-p" + mysqlPassword,
                    mysqlDatabase,
                    "-N", "-B",
                    "--default-character-set=utf8mb4",
                    "-e",
                    "SELECT table_name FROM information_schema.tables " +
                            "WHERE table_schema = '" + mysqlDatabase + "' " +
                            "ORDER BY table_name;"
            );

            listTables.redirectErrorStream(true);
            Process listProcess = listTables.start();

            List<String> tables = new ArrayList<>();
            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(listProcess.getInputStream(), StandardCharsets.UTF_8))) { // 🔥 UTF-8
                String line;
                while ((line = reader.readLine()) != null) {
                    if (!line.contains("Using a password") && !line.trim().isEmpty()) {
                        tables.add(line.trim());
                    }
                }
            }

            int listExitCode = listProcess.waitFor();
            if (listExitCode != 0) {
                throw new RuntimeException("Error al listar tablas. Exit code: " + listExitCode);
            }

            System.out.println(" Encontradas " + tables.size() + " tablas totales");

            // PASO 3: Filtrar y eliminar
            if (!tables.isEmpty()) {
                Set<String> tablasExcluidas = new HashSet<>(Arrays.asList(
                        "backup_configuracion_backup_estado_backup_aud",
                        "backup_configuracion_backup_fisico_aud",
                        "backup_estado_backup",
                        "backup_estado_backup_aud",
                        "backups_configuraciones",
                        "backups_configuraciones_aud",
                        "backups_fisicos",
                        "backups_fisicos_aud",
                        "estados_backup",
                        "estados_backup_aud"
                ));

                List<String> tablasAEliminar = new ArrayList<>();
                List<String> tablasPreservadas = new ArrayList<>();

                for (String table : tables) {
                    String tableClean = table.toLowerCase()
                            .replace("`", "")
                            .replace("'", "")
                            .replace("\"", "")
                            .trim();

                    if (tablasExcluidas.contains(tableClean)) {
                        tablasPreservadas.add(table);
                    } else {
                        tablasAEliminar.add(table);
                    }
                }

                System.out.println("\n Resumen:");
                System.out.println("   Total: " + tables.size());
                System.out.println("   A eliminar: " + tablasAEliminar.size());
                System.out.println("   Preservadas: " + tablasPreservadas.size());

                if (!tablasAEliminar.isEmpty()) {
                    // Crear script DROP con TODAS las tablas a eliminar
                    File dropScriptFile = File.createTempFile("drop_tables_", ".sql");
                    try (BufferedWriter writer = new BufferedWriter(
                            new OutputStreamWriter(
                                    new FileOutputStream(dropScriptFile),
                                    StandardCharsets.UTF_8))) {

                        writer.write("SET FOREIGN_KEY_CHECKS = 0;\n");
                        writer.write("SET SESSION lock_wait_timeout = 5;\n");
                        writer.write("SET NAMES utf8mb4;\n");
                        writer.write("SET CHARACTER SET utf8mb4;\n\n");

                        // Escribir DROP para cada tabla
                        for (String table : tablasAEliminar) {
                            // Asegurarse de que el nombre esté entre backticks
                            String tableName = table.replace("`", ""); // Quitar backticks existentes
                            writer.write("DROP TABLE IF EXISTS `" + tableName + "`;\n");
                        }

                        writer.write("\nSET FOREIGN_KEY_CHECKS = 1;\n");
                    }

                    System.out.println("\n Ejecutando DROP de " + tablasAEliminar.size() + " tablas...");

                    ProcessBuilder dropTables = new ProcessBuilder(
                            mysqlPath,
                            "-u" + mysqlUser,
                            "-p" + mysqlPassword,
                            mysqlDatabase,
                            "--default-character-set=utf8mb4"
                    );

                    dropTables.redirectInput(dropScriptFile);
                    dropTables.redirectErrorStream(true);

                    Process dropProcess = dropTables.start();

                    List<String> dropOutput = new ArrayList<>();
                    try (BufferedReader reader = new BufferedReader(
                            new InputStreamReader(dropProcess.getInputStream(), StandardCharsets.UTF_8))) {
                        String line;
                        while ((line = reader.readLine()) != null) {
                            if (!line.contains("Using a password")) {
                                dropOutput.add(line);
                                System.out.println("   MySQL: " + line);
                            }
                        }
                    }

                    boolean finished = dropProcess.waitFor(30, TimeUnit.SECONDS);

                    // Limpiar archivo temporal
                    dropScriptFile.delete();

                    if (!finished) {
                        System.err.println(" TIMEOUT al eliminar tablas");
                        dropProcess.destroyForcibly();
                        throw new RuntimeException("Timeout al eliminar tablas");
                    }

                    int dropExitCode = dropProcess.exitValue();
                    if (dropExitCode != 0) {
                        System.err.println(" Errores durante el DROP:");
                        dropOutput.forEach(line -> System.err.println("   " + line));
                        throw new RuntimeException("Error al eliminar tablas. Exit code: " + dropExitCode);
                    }

                    System.out.println(" Tablas eliminadas exitosamente");

                    //  VERIFICAR qué tablas quedaron
                    System.out.println("\n Verificando tablas restantes...");
                    Thread.sleep(1000);

                    ProcessBuilder verifyTables = new ProcessBuilder(
                            mysqlPath,
                            "-u" + mysqlUser,
                            "-p" + mysqlPassword,
                            mysqlDatabase,
                            "-N", "-B",
                            "--default-character-set=utf8mb4",
                            "-e",
                            "SELECT table_name FROM information_schema.tables " +
                                    "WHERE table_schema = '" + mysqlDatabase + "' " +
                                    "ORDER BY table_name;"
                    );

                    verifyTables.redirectErrorStream(true);
                    Process verifyProcess = verifyTables.start();

                    List<String> remainingTables = new ArrayList<>();
                    try (BufferedReader reader = new BufferedReader(
                            new InputStreamReader(verifyProcess.getInputStream(), StandardCharsets.UTF_8))) {
                        String line;
                        while ((line = reader.readLine()) != null) {
                            if (!line.contains("Using a password") && !line.trim().isEmpty()) {
                                remainingTables.add(line.trim());
                            }
                        }
                    }
                    verifyProcess.waitFor();

                    System.out.println("   Tablas restantes: " + remainingTables.size());
                    for (String table : remainingTables) {
                        System.out.println("      - " + table);
                    }

                } else {
                    System.out.println(" No hay tablas para eliminar");
                }
            }

            Thread.sleep(2000); // Pausa extra

            // PASO 4: Restaurar el backup
            System.out.println(" Iniciando importación del backup");

            // Crear archivo temporal con comandos previos
            File tempSqlFile = File.createTempFile("restore_", ".sql");
            try (FileWriter fw = new FileWriter(tempSqlFile)) {
                fw.write("SET FOREIGN_KEY_CHECKS = 0;\n");
                fw.write("SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';\n");
                fw.write("SET time_zone = '+00:00';\n\n");

                // Copiar contenido del backup original
                try (BufferedReader br = new BufferedReader(new FileReader(sqlFile))) {
                    String line;
                    while ((line = br.readLine()) != null) {
                        fw.write(line + "\n");
                    }
                }

                fw.write("\nSET FOREIGN_KEY_CHECKS = 1;\n");
            }

            ProcessBuilder pb = new ProcessBuilder(
                    mysqlPath,
                    "-u" + mysqlUser,
                    "-p" + mysqlPassword,
                    mysqlDatabase,
                    "--force",
                    "--connect-timeout=60",
                    "--max_allowed_packet=64M",
                    "--default-character-set=utf8mb4"
            );

            pb.redirectInput(tempSqlFile); // Usar el archivo temporal
            pb.redirectErrorStream(false);

            long startTime = System.currentTimeMillis();
            Process process = pb.start();

            System.out.println("Proceso MySQL iniciado");

            // Thread para STDOUT
            AtomicInteger stdoutLines = new AtomicInteger(0);
            Thread stdoutThread = new Thread(() -> {
                try (BufferedReader reader = new BufferedReader(
                        new InputStreamReader(process.getInputStream()))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        stdoutLines.incrementAndGet();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });

            // Thread para STDERR - SOLO errores reales
            AtomicBoolean hayErroresCriticos = new AtomicBoolean(false);
            AtomicInteger errorCount = new AtomicInteger(0);
            List<String> erroresMostrar = new ArrayList<>();

            Thread stderrThread = new Thread(() -> {
                try (BufferedReader reader = new BufferedReader(
                        new InputStreamReader(process.getErrorStream()))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        if (line.contains("Using a password")) continue;

                        if (line.contains("ERROR")) {
                            errorCount.incrementAndGet();
                            if (errorCount.get() <= 10) { // Solo guardar los primeros 10
                                erroresMostrar.add(line);
                            }
                            // Solo marcar como crítico si NO es error de foreign key o tabla existente
                            if (!line.contains("1824") && // Foreign key error
                                    !line.contains("1050") && // Table exists
                                    !line.contains("1062") && // Duplicate entry
                                    !line.contains("1146")) { // Table doesn't exist
                                hayErroresCriticos.set(true);
                            }
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });

            stdoutThread.start();
            stderrThread.start();

            boolean terminado = process.waitFor(15, TimeUnit.MINUTES);
            stdoutThread.join(5000);
            stderrThread.join(5000);

            // Limpiar archivo temporal
            tempSqlFile.delete();

            if (!terminado) {
                process.destroyForcibly();
                throw new RuntimeException("Timeout en restauración");
            }

            long totalTime = (System.currentTimeMillis() - startTime) / 1000;
            System.out.println("️Tiempo total: " + totalTime + " segundos");

            if (errorCount.get() > 0) {
                System.out.println("\nSe encontraron " + errorCount.get() + " errores durante la importación");
                if (!erroresMostrar.isEmpty()) {
                    System.out.println("Primeros errores:");
                    erroresMostrar.forEach(e -> System.out.println("  " + e));
                }
            }

            if (process.exitValue() == 0 || !hayErroresCriticos.get()) {
                System.out.println("  Restauración completada");
                if (errorCount.get() > 0) {
                    System.out.println(" Con " + errorCount.get() + " warnings ");
                }
                System.out.println("Reiniciando pool de conexiones");
                try {
                    if (dataSource instanceof HikariDataSource) {
                        HikariDataSource hikariDS = (HikariDataSource) dataSource;

                        // Expulsar todas las conexiones
                        hikariDS.getHikariPoolMXBean().softEvictConnections();
                        Thread.sleep(2000);

                        // Forzar creación de nueva conexión
                        try (Connection conn = hikariDS.getConnection()) {
                            conn.createStatement().execute("SELECT 1");
                        }

                        System.out.println("Pool reiniciado - aplicación lista");
                    }
                } catch (Exception ex) {
                    System.out.println("Error al reiniciar pool: " + ex.getMessage());
                    System.out.println("Reinicia manualmente la aplicación ");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error en restauración: " + e.getMessage(), e);
        }
    }

    @Transactional
    public BackupConfiguracion habilitarBackupConfiguracion(Long idBackup, String email) {
        // Buscar usuario
        Usuario usuario = repoUsuario.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));

        // uscar la configuración de backup
        BackupConfiguracion backup = repository.findById(idBackup)
                .orElseThrow(() -> new EntityNotFoundException("Backup no encontrado con id: " + idBackup));

        //Verificar si está actualmente INACTIVA
        Optional<BackupEstadoBackup> estadoInactivoOpt = backup.getBackupEstadoBackups().stream()
                .filter(beb -> beb.getEstadoBackup().getNombre().equalsIgnoreCase("INACTIVA"))
                .filter(beb -> beb.getFechaHasta() == null)
                .findFirst();

        if (estadoInactivoOpt.isEmpty()) {
            throw new RuntimeException("La configuración no está en estado INACTIVA y no puede habilitarse");
        }

        //  Cerrar el estado INACTIVA
        BackupEstadoBackup estadoInactivo = estadoInactivoOpt.get();
        estadoInactivo.setFechaHasta(new Date());

        //  Buscar o crear estado ACTIVA
        EstadoBackup estadoActiva = repoEstadoBackup.findByNombre("ACTIVA")
                .orElseGet(() -> {
                    EstadoBackup nuevo = new EstadoBackup();
                    nuevo.setNombre("ACTIVA");
                    nuevo.setFechaHoraAlta(LocalDateTime.now());
                    return repoEstadoBackup.save(nuevo);
                });

        //  Crear nuevo estado ACTIVA
        BackupEstadoBackup nuevoEstado = new BackupEstadoBackup();
        nuevoEstado.setEstadoBackup(estadoActiva);
        nuevoEstado.setFechaDesde(new Date());
        backup.getBackupEstadoBackups().add(nuevoEstado);

        // Crear un nuevo backup físico pendiente
        BackupFisico nuevoFisico = new BackupFisico();
        LocalDateTime fecha = backup.getFechaProgramada() != null
                ? backup.getFechaProgramada()
                : LocalDateTime.now().plusDays(1);

        nuevoFisico.setNombre("Backup reactivado de " + backup.getNombre() + " - " + fecha.format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss")));
        nuevoFisico.setFechaHora(fecha);
        nuevoFisico.setTamaño(0.0);
        nuevoFisico.setEsquemaDbHash("");
        nuevoFisico.setDiasRetencion(backup.getDiasRetencion());
        nuevoFisico.setEstadoBackupFisico(EstadoBackupFisico.PENDIENTE);
        nuevoFisico.setConfiguracion(backup);

        backup.getBackupsFisicos().add(nuevoFisico);

        // 8️Guardar cambios
        repository.save(backup);

        System.out.println("Backup configuracion habilitado nuevamente: " + backup.getNombre());
        System.out.println("Se creó nuevo backup físico pendiente con fecha: " + nuevoFisico.getFechaHora());

        return backup;
    }

}
