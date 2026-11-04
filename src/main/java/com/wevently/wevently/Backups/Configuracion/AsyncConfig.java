package com.wevently.wevently.Backups.Configuracion;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;

@Configuration
public class AsyncConfig {

    @Bean(name = "backupTaskExecutor")
    public Executor backupTaskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(2);       // cantidad de hilos iniciales
        executor.setMaxPoolSize(4);        // cantidad máxima de hilos
        executor.setQueueCapacity(10);     // cantidad máxima de tareas en cola
        executor.setThreadNamePrefix("Backup-Executor-");
        executor.initialize();
        return executor;
    }
}
