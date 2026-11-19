/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerta_recuperacion_password` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime(6) NOT NULL,
  `recuperacion_password_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5otln88uvjfsguv0iv0f6onrx` (`recuperacion_password_id`),
  CONSTRAINT `FK5otln88uvjfsguv0iv0f6onrx` FOREIGN KEY (`recuperacion_password_id`) REFERENCES `recuperaciones_password` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerta_recuperacion_password_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora` datetime(6) DEFAULT NULL,
  `recuperacion_password_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK5j5bwmdgbmur3g3c0xwx608xd` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_transacciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comision_mercado_pago` decimal(38,2) DEFAULT NULL,
  `comision_nosotros` decimal(38,2) DEFAULT NULL,
  `fecha_creacion_pago` datetime(6) DEFAULT NULL,
  `fecha_hora_creacion_auditoria` datetime(6) DEFAULT NULL,
  `fecha_hora_modificacion` datetime(6) DEFAULT NULL,
  `fecha_hora_transaccion` datetime(6) DEFAULT NULL,
  `fecha_pago` datetime(6) DEFAULT NULL,
  `id_pago` varchar(255) DEFAULT NULL,
  `metodo_pago` varchar(255) DEFAULT NULL,
  `monto_atransferir` decimal(38,2) DEFAULT NULL,
  `monto_total` decimal(38,2) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `organizador_id` bigint DEFAULT NULL,
  `prestador_id` bigint DEFAULT NULL,
  `reserva_id` bigint DEFAULT NULL,
  `transferencia_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `auditoria_transacciones` VALUES (1,120.11,80.90,'2025-11-01 12:01:20.000000','2025-11-01 12:02:00.000000','2025-11-01 12:05:00.000000','2025-11-01 12:06:00.000000','2025-11-01 12:07:00.000000','PAG001','diners',2100.00,2200.00,'Pago exitoso',1,2,7,'TX001'),(2,130.75,90.50,'2025-11-01 13:02:21.000000','2025-11-01 13:03:50.000000','2025-11-01 13:04:10.000000','2025-11-01 13:07:00.000000','2025-11-01 13:08:00.000000','PAG002','mercadopago_cc',2300.00,2440.50,'Pago verificado',1,2,8,'TX002'),(3,122.33,98.36,'2025-11-10 09:20:00.000000','2025-11-10 09:22:00.000000','2025-11-10 09:25:00.000000','2025-11-10 09:26:00.000000','2025-11-10 09:27:00.000000','PAG003','debvisa',2250.00,2370.69,'Pago en proceso',1,2,9,'TX003'),(4,145.10,95.20,'2025-11-11 15:02:00.000000','2025-11-11 15:02:35.000000','2025-11-11 15:03:10.000000','2025-11-11 15:05:00.000000','2025-11-11 15:08:00.000000','PAG004','visa',2500.00,2640.30,'Pago completo',1,2,10,'TX004'),(5,107.00,87.82,'2025-10-21 08:12:21.000000','2025-10-21 08:14:00.000000','2025-10-21 08:17:00.000000','2025-10-21 08:19:00.000000','2025-10-21 08:21:00.000000','PAG005','amex',2000.00,2094.82,'Pago demorado',1,2,11,'TX005'),(6,131.33,91.31,'2025-10-23 19:02:55.000000','2025-10-23 19:04:00.000000','2025-10-23 19:08:00.000000','2025-10-23 19:10:00.000000','2025-10-23 19:12:00.000000','PAG006','master',2150.00,2242.64,'Pago completo',1,2,12,'TX006'),(7,140.12,92.15,'2025-11-01 16:10:10.000000','2025-11-01 16:14:00.000000','2025-12-01 16:17:00.000000','2025-12-01 16:21:00.000000','2025-12-01 16:22:00.000000','PAG007','maestro',2225.00,2357.41,'Pago exitoso',1,2,13,'TX007'),(8,129.80,90.22,'2025-11-02 17:03:13.000000','2025-11-02 17:04:04.000000','2025-12-02 17:06:00.000000','2025-12-02 17:09:00.000000','2025-12-02 17:10:00.000000','PAG008','cabal',1980.00,2099.80,'Pago verificado',1,2,14,'TX008'),(9,110.02,85.00,'2025-11-09 10:11:20.000000','2025-11-09 10:13:10.000000','2025-12-09 10:16:00.000000','2025-12-09 10:20:00.000000','2025-12-09 10:21:00.000000','PAG009','debin_transfer',2050.00,2145.22,'Pago completo',1,2,15,'TX009'),(10,133.73,97.74,'2025-11-10 12:03:43.000000','2025-11-10 12:06:41.000000','2025-12-10 12:08:00.000000','2025-12-10 12:11:10.000000','2025-12-10 12:13:00.000000','PAG010','sol',2175.00,2306.47,'Pago exitoso',1,2,16,'TX010'),(11,82.00,2.80,'2026-11-06 20:58:11.517000','2026-11-06 17:58:11.883573',NULL,NULL,'2026-11-06 20:58:11.935000','1354925959','visa',1915.20,2000.00,NULL,5,3,20,NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_transacciones_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `comision_mercado_pago` decimal(38,2) DEFAULT NULL,
  `comision_nosotros` decimal(38,2) DEFAULT NULL,
  `fecha_creacion_pago` datetime(6) DEFAULT NULL,
  `fecha_hora_creacion_auditoria` datetime(6) DEFAULT NULL,
  `fecha_hora_modificacion` datetime(6) DEFAULT NULL,
  `fecha_hora_transaccion` datetime(6) DEFAULT NULL,
  `fecha_pago` datetime(6) DEFAULT NULL,
  `id_pago` varchar(255) DEFAULT NULL,
  `metodo_pago` varchar(255) DEFAULT NULL,
  `monto_atransferir` decimal(38,2) DEFAULT NULL,
  `monto_total` decimal(38,2) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `organizador_id` bigint DEFAULT NULL,
  `prestador_id` bigint DEFAULT NULL,
  `reserva_id` bigint DEFAULT NULL,
  `transferencia_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKbmkhp7dpwenx8arbsk79d554u` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `auditoria_transacciones_aud` VALUES (11,349,0,82.00,2.80,'2026-11-06 20:58:11.517000','2026-11-06 17:58:11.883573',NULL,NULL,'2026-11-06 20:58:11.935000','1354925959','visa',1915.20,2000.00,NULL,5,3,20,NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_factura_entity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido_receptor` varchar(255) DEFAULT NULL,
  `bonificacion` decimal(38,2) DEFAULT NULL,
  `codigo_comprobante` varchar(255) DEFAULT NULL,
  `condicionivaemisor` varchar(255) DEFAULT NULL,
  `condicionivareceptor` varchar(255) DEFAULT NULL,
  `condicion_venta` varchar(255) DEFAULT NULL,
  `cuit_emisor` varchar(255) DEFAULT NULL,
  `cuit_receptor` varchar(255) DEFAULT NULL,
  `domicilio_emisor` varchar(255) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_vencimiento_pago` date DEFAULT NULL,
  `importe_en_letras` varchar(255) DEFAULT NULL,
  `importe_exento` decimal(38,2) DEFAULT NULL,
  `importe_total` decimal(38,2) DEFAULT NULL,
  `ingresos_brutos_emisor` varchar(255) DEFAULT NULL,
  `nombre_emisor` varchar(255) DEFAULT NULL,
  `nombre_receptor` varchar(255) DEFAULT NULL,
  `numero_comprobante` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `otros_impuestos` decimal(38,2) DEFAULT NULL,
  `provincia_emisor` varchar(255) DEFAULT NULL,
  `razon_social_emisor` varchar(255) DEFAULT NULL,
  `subtotal` decimal(38,2) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `base_factura_entity` VALUES (1,'Arce',0.00,'01','Responsable inscripto','Responsable inscripto','Tarjeta','30-111111111-4','21-21211212-1','Rodriguez 273, Capital','2026-11-06','2026-11-06','Dos mil con 00/100',0.00,2000.00,'Reg. Simplificado','Wevently','Casamiento Jorge','00000001',NULL,0.00,'Mendoza','Wevently S.A.',2000.00,'A');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_factura_entity_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `apellido_receptor` varchar(255) DEFAULT NULL,
  `bonificacion` decimal(38,2) DEFAULT NULL,
  `codigo_comprobante` varchar(255) DEFAULT NULL,
  `condicionivaemisor` varchar(255) DEFAULT NULL,
  `condicionivareceptor` varchar(255) DEFAULT NULL,
  `condicion_venta` varchar(255) DEFAULT NULL,
  `cuit_emisor` varchar(255) DEFAULT NULL,
  `cuit_receptor` varchar(255) DEFAULT NULL,
  `domicilio_emisor` varchar(255) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_vencimiento_pago` date DEFAULT NULL,
  `importe_en_letras` varchar(255) DEFAULT NULL,
  `importe_exento` decimal(38,2) DEFAULT NULL,
  `importe_total` decimal(38,2) DEFAULT NULL,
  `ingresos_brutos_emisor` varchar(255) DEFAULT NULL,
  `nombre_emisor` varchar(255) DEFAULT NULL,
  `nombre_receptor` varchar(255) DEFAULT NULL,
  `numero_comprobante` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `otros_impuestos` decimal(38,2) DEFAULT NULL,
  `provincia_emisor` varchar(255) DEFAULT NULL,
  `razon_social_emisor` varchar(255) DEFAULT NULL,
  `subtotal` decimal(38,2) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK1w64m3h9o03ka0a9tdaemsgce` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `base_factura_entity_aud` VALUES (1,350,0,'Arce',0.00,'01','Responsable inscripto','Responsable inscripto','Tarjeta','30-111111111-4','21-21211212-1','Rodriguez 273, Capital','2026-11-06','2026-11-06','Dos mil con 00/100',0.00,2000.00,'Reg. Simplificado','Wevently','Casamiento Jorge','00000001',NULL,0.00,'Mendoza','Wevently S.A.',2000.00,'A');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_factura_entity_items` (
  `base_factura_entity_id` bigint NOT NULL,
  `items_id` bigint NOT NULL,
  UNIQUE KEY `UK_pt2jhabkjmyyii9hmlcxphb5h` (`items_id`),
  KEY `FKd9lt3acpf4gbc0cei958gb5af` (`base_factura_entity_id`),
  CONSTRAINT `FKd9lt3acpf4gbc0cei958gb5af` FOREIGN KEY (`base_factura_entity_id`) REFERENCES `base_factura_entity` (`id`),
  CONSTRAINT `FKjqk16rahvw0vit0634fa0qqsw` FOREIGN KEY (`items_id`) REFERENCES `item_factura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `base_factura_entity_items` VALUES (1,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_factura_entity_items_aud` (
  `rev` int NOT NULL,
  `base_factura_entity_id` bigint NOT NULL,
  `items_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`base_factura_entity_id`,`rev`,`items_id`),
  KEY `FKoujbju5e3i9q9ch6i1efoccj3` (`rev`),
  CONSTRAINT `FKoujbju5e3i9q9ch6i1efoccj3` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `base_factura_entity_items_aud` VALUES (350,1,1,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristicas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `caracteristicas` VALUES (1,'2026-11-06 17:30:10.000000',NULL,'Pileta'),(2,'2026-11-06 17:30:10.000000',NULL,'Estacionamiento'),(3,'2026-11-06 17:30:10.000000',NULL,'WiFi'),(4,'2026-11-06 17:30:10.000000',NULL,'Aire acondicionado'),(5,'2026-11-06 17:30:10.000000',NULL,'Accesibilidad');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristicas_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKq7q33nkp37661c5x54icmlt2f` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_mensaje_aud` (
  `rev` int NOT NULL,
  `chat_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`chat_id`,`rev`,`id`),
  KEY `FKj5op907cn7folskkg9boemr2u` (`rev`),
  CONSTRAINT `FKj5op907cn7folskkg9boemr2u` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `chat_mensaje_aud` VALUES (330,3,1,0),(333,3,2,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_propuesta_aud` (
  `rev` int NOT NULL,
  `chat_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`chat_id`,`rev`,`id`),
  KEY `FK1d2vcbxo3dcnxmo8lgt1c88at` (`rev`),
  CONSTRAINT `FK1d2vcbxo3dcnxmo8lgt1c88at` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `chat_propuesta_aud` VALUES (335,3,3,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_inicio` datetime(6) NOT NULL,
  `evento_id` bigint DEFAULT NULL,
  `organizador_id` bigint NOT NULL,
  `prestador_id` bigint NOT NULL,
  `reserva_id` bigint DEFAULT NULL,
  `servicio_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6kyf32tx9n4bq6xwtufurbsdi` (`reserva_id`),
  KEY `FKefugm7ugdo68wx2shr35343t9` (`evento_id`),
  KEY `FKr0a47iiiu88cft7f34q9pi15s` (`organizador_id`),
  KEY `FKfvurmfwh0kfn6l7lkdltksea1` (`prestador_id`),
  KEY `FK2h80fajl0gys9942rj7vqe3rj` (`servicio_id`),
  CONSTRAINT `FK2h80fajl0gys9942rj7vqe3rj` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
  CONSTRAINT `FKefugm7ugdo68wx2shr35343t9` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`),
  CONSTRAINT `FKfvurmfwh0kfn6l7lkdltksea1` FOREIGN KEY (`prestador_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKr0a47iiiu88cft7f34q9pi15s` FOREIGN KEY (`organizador_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKr41eqhtp83qff4dlqfy5i760y` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `chats` VALUES (1,'2026-11-06 17:30:10.000000',1,1,3,3,1),(2,'2026-11-06 17:30:10.000000',2,1,3,4,1),(3,'2026-11-06 17:46:34.001421',12,5,2,19,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_inicio` datetime(6) DEFAULT NULL,
  `evento_id` bigint DEFAULT NULL,
  `organizador_id` bigint DEFAULT NULL,
  `prestador_id` bigint DEFAULT NULL,
  `reserva_id` bigint DEFAULT NULL,
  `servicio_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKh5mymavt0moki3l61699rk9o9` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `chats_aud` VALUES (3,329,0,'2026-11-06 17:46:34.001421',12,5,2,19,1),(3,330,1,'2026-11-06 17:46:34.001421',12,5,2,19,1),(3,333,1,'2026-11-06 17:46:34.001421',12,5,2,19,1),(3,335,1,'2026-11-06 17:46:34.001421',12,5,2,19,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_bancarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) DEFAULT NULL,
  `cbucvu` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_a0w5ri92anaxnw1t44gmvrlwp` (`usuario_id`),
  CONSTRAINT `FKfun4i2x5ffcc0t0ti44ojqec0` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_bancarios_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `cbucvu` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKgvaptmgul4uwcme71sfahnaj7` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_de_eventos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `estados_de_eventos` VALUES (1,'2026-11-06 17:30:10.000000',NULL,'Pendiente'),(2,'2026-11-06 17:30:10.000000',NULL,'Cancelado'),(3,'2026-11-06 17:30:10.000000',NULL,'Realizado');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_de_eventos_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKr9xc4lr4r4oskd7thevur6d7c` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_de_servicios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q5wfqmxt1qdy8riecn7d41edh` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `estados_de_servicios` VALUES (1,'2023-01-01 00:00:00.000000',NULL,'Activo'),(2,'2023-01-10 00:00:00.000000',NULL,'Inactivo');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_de_servicios_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK2gleb8jbmv0iy31u8un3mhenw` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento_reserva_aud` (
  `rev` int NOT NULL,
  `evento_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`evento_id`,`rev`,`id`),
  KEY `FK417mhv87eg8we5ryyddw0hyl7` (`rev`),
  CONSTRAINT `FK417mhv87eg8we5ryyddw0hyl7` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `evento_reserva_aud` VALUES (311,10,17,0),(321,11,18,0),(328,12,19,0),(342,12,20,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` date NOT NULL,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `hora_fin` time(6) NOT NULL,
  `hora_inicio` time(6) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `personas` int NOT NULL,
  `estado_evento_id` bigint NOT NULL,
  `tipo_evento_id` bigint NOT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnk6xhu7ftbo1dwx5o2pr4m9h` (`estado_evento_id`),
  KEY `FK1kmpwbs4aijxt563t9dxs8b0g` (`tipo_evento_id`),
  KEY `FKhc319vgaaft3j4wncwtshtuqv` (`usuario_id`),
  CONSTRAINT `FK1kmpwbs4aijxt563t9dxs8b0g` FOREIGN KEY (`tipo_evento_id`) REFERENCES `tipos_de_eventos` (`id`),
  CONSTRAINT `FKhc319vgaaft3j4wncwtshtuqv` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKnk6xhu7ftbo1dwx5o2pr4m9h` FOREIGN KEY (`estado_evento_id`) REFERENCES `estados_de_eventos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `eventos` VALUES (1,'casamiento de maria y jorge','2025-10-10','2026-11-06 17:30:10.000000',NULL,'12:00:00.000000','14:00:00.000000','casamiento jorge',100,3,3,1),(2,'casamiento de mario y jorge','2025-10-10','2026-11-06 17:30:10.000000',NULL,'12:00:00.000000','14:00:00.000000','casamiento mario',200,2,2,1),(3,'casamiento de robert y maria','2025-10-10','2026-11-06 17:30:10.000000',NULL,'12:00:00.000000','14:00:00.000000','casamiento maria',300,3,3,1),(4,'Post Congreso de IT','2025-11-05','2026-11-06 17:30:10.000000',NULL,'23:00:00.000000','20:00:00.000000','Congreso IT',160,3,1,1),(5,'Fiesta Fin de Año Utn','2025-11-14','2026-11-06 17:30:10.000000',NULL,'06:00:00.000000','03:00:00.000000','Fiesta Utn',180,3,2,1),(6,'Seminario Arquitectura','2025-10-25','2026-11-06 17:30:10.000000',NULL,'19:00:00.000000','17:30:00.000000','Seminario Arquitectura',70,3,3,1),(7,'Gran reunión de empresas Tech','2025-11-01','2026-11-06 17:30:10.000000',NULL,'22:00:00.000000','19:00:00.000000','Reunión Tech',90,3,5,1),(8,'Taller sobre SQL','2025-11-10','2026-11-06 17:30:10.000000',NULL,'16:30:00.000000','14:00:00.000000','Taller SQL',40,3,4,1),(9,'asdasdasdasdsadasd','2026-11-18','2026-11-06 17:38:21.613414',NULL,'20:00:00.000000','08:00:00.000000','asdasdassdsa',322,3,3,5),(10,'asdsadassdadasd','2026-11-18','2026-11-06 17:40:11.299307',NULL,'18:00:00.000000','09:00:00.000000','Casamiento Jorge',200,3,2,5),(11,'asasdasdsadasdasd','2026-11-16','2026-11-06 17:43:15.674694',NULL,'21:00:00.000000','12:00:00.000000','Alejandroasa',222,3,2,5),(12,'awdadsadasdasdasd','2026-11-19','2026-11-06 17:46:32.143163',NULL,'18:00:00.000000','10:00:00.000000','Conferencia Tech',232,1,2,5),(13,'aaaaaaaaaaaaaaaaaaaaaaa','2026-11-27','2026-11-18 12:17:57.695383',NULL,'20:00:00.000000','11:00:00.000000','Conferencia_Tech',200,1,3,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `hora_fin` time(6) DEFAULT NULL,
  `hora_inicio` time(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `personas` int DEFAULT NULL,
  `estado_evento_id` bigint DEFAULT NULL,
  `tipo_evento_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKskfwa4lv76n3ydkvx1envx0pr` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `eventos_aud` VALUES (9,303,0,'asdasdasdasdsadasd','2026-11-18','2026-11-06 17:38:21.613414',NULL,'20:00:00.000000','08:00:00.000000','asdasdassdsa',322,1,3),(10,310,0,'asdsadassdadasd','2026-11-18','2026-11-06 17:40:11.299307',NULL,'18:00:00.000000','09:00:00.000000','Casamiento Jorge',200,1,2),(10,311,1,'asdsadassdadasd','2026-11-18','2026-11-06 17:40:11.299307',NULL,'18:00:00.000000','09:00:00.000000','Casamiento Jorge',200,1,2),(11,318,0,'asasdasdsadasdasd','2026-11-16','2026-11-06 17:43:15.674694',NULL,'21:00:00.000000','12:00:00.000000','Alejandroasa',222,1,2),(11,321,1,'asasdasdsadasdasd','2026-11-16','2026-11-06 17:43:15.674694',NULL,'21:00:00.000000','12:00:00.000000','Alejandroasa',222,1,2),(12,327,0,'awdadsadasdasdasd','2026-11-19','2026-11-06 17:46:32.143163',NULL,'18:00:00.000000','10:00:00.000000','Conferencia Tech',232,1,2),(12,328,1,'awdadsadasdasdasd','2026-11-19','2026-11-06 17:46:32.143163',NULL,'18:00:00.000000','10:00:00.000000','Conferencia Tech',232,1,2),(12,342,1,'awdadsadasdasdasd','2026-11-19','2026-11-06 17:46:32.143163',NULL,'18:00:00.000000','10:00:00.000000','Conferencia Tech',232,1,2),(1,402,1,'casamiento de maria y jorge','2025-10-10','2026-11-06 17:30:10.000000',NULL,'12:00:00.000000','14:00:00.000000','casamiento jorge',100,3,3),(4,402,1,'Post Congreso de IT','2025-11-05','2026-11-06 17:30:10.000000',NULL,'23:00:00.000000','20:00:00.000000','Congreso IT',160,3,1),(5,402,1,'Fiesta Fin de Año Utn','2025-11-14','2026-11-06 17:30:10.000000',NULL,'06:00:00.000000','03:00:00.000000','Fiesta Utn',180,3,2),(7,402,1,'Gran reunión de empresas Tech','2025-11-01','2026-11-06 17:30:10.000000',NULL,'22:00:00.000000','19:00:00.000000','Reunión Tech',90,3,5),(9,402,1,'asdasdasdasdsadasd','2026-11-18','2026-11-06 17:38:21.613414',NULL,'20:00:00.000000','08:00:00.000000','asdasdassdsa',322,3,3),(10,402,1,'asdsadassdadasd','2026-11-18','2026-11-06 17:40:11.299307',NULL,'18:00:00.000000','09:00:00.000000','Casamiento Jorge',200,3,2),(11,402,1,'asasdasdsadasdasd','2026-11-16','2026-11-06 17:43:15.674694',NULL,'21:00:00.000000','12:00:00.000000','Alejandroasa',222,3,2),(13,407,0,'aaaaaaaaaaaaaaaaaaaaaaa','2026-11-27','2026-11-18 12:17:57.695383',NULL,'20:00:00.000000','11:00:00.000000','Conferencia_Tech',200,1,3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_soportados` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `tipo_evento_id` bigint NOT NULL,
  `lugar_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm9itlgek5631hm6wfq0o2q9kq` (`tipo_evento_id`),
  KEY `FK6iu2g6kin7x3qjoyub320qbog` (`lugar_id`),
  CONSTRAINT `FK6iu2g6kin7x3qjoyub320qbog` FOREIGN KEY (`lugar_id`) REFERENCES `lugares` (`id`),
  CONSTRAINT `FKm9itlgek5631hm6wfq0o2q9kq` FOREIGN KEY (`tipo_evento_id`) REFERENCES `tipos_de_eventos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `eventos_soportados` VALUES (1,'2026-11-06 17:30:10.000000',NULL,1,1),(2,'2026-11-06 17:30:10.000000',NULL,2,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_soportados_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `tipo_evento_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKploy7lletgjg7hn0drb5o1djg` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_a` (
  `alicuotaiva` decimal(38,2) DEFAULT NULL,
  `cae_codigo` varchar(255) DEFAULT NULL,
  `importeiva` decimal(38,2) DEFAULT NULL,
  `importe_neto_gravado` decimal(38,2) DEFAULT NULL,
  `leyenda_autorizacion_fiscal` varchar(255) DEFAULT NULL,
  `marca_interna` varchar(255) DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKjjwnwfnjn3rsckfrwpw4ynu9j` FOREIGN KEY (`id`) REFERENCES `base_factura_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `factura_a` VALUES (NULL,NULL,347.11,1652.89,'Comprobante autorizado. Régimen de Transparencia Fiscal al Consumidor Ley 27.743',NULL,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_a_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `alicuotaiva` decimal(38,2) DEFAULT NULL,
  `cae_codigo` varchar(255) DEFAULT NULL,
  `importeiva` decimal(38,2) DEFAULT NULL,
  `importe_neto_gravado` decimal(38,2) DEFAULT NULL,
  `leyenda_autorizacion_fiscal` varchar(255) DEFAULT NULL,
  `marca_interna` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK66j9hte6b7ewhecopxmsoxmel` FOREIGN KEY (`rev`, `id`) REFERENCES `base_factura_entity_aud` (`rev`, `id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `factura_a_aud` VALUES (1,350,NULL,NULL,347.11,1652.89,'Comprobante autorizado. Régimen de Transparencia Fiscal al Consumidor Ley 27.743',NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_b` (
  `alicuotaiva` decimal(38,2) DEFAULT NULL,
  `importeivacontenido` decimal(38,2) DEFAULT NULL,
  `leyenda_transparencia_fiscal` varchar(255) DEFAULT NULL,
  `marca_interna` varchar(255) DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK5wf3914iy65d0411p1bh1ykf6` FOREIGN KEY (`id`) REFERENCES `base_factura_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_b_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `alicuotaiva` decimal(38,2) DEFAULT NULL,
  `importeivacontenido` decimal(38,2) DEFAULT NULL,
  `leyenda_transparencia_fiscal` varchar(255) DEFAULT NULL,
  `marca_interna` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK263q9tfbdee0xgljoysnb1cxj` FOREIGN KEY (`rev`, `id`) REFERENCES `base_factura_entity_aud` (`rev`, `id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9u5buu0dehagjdoqm3wv6orm3` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `generos` VALUES (1,'Hombre'),(2,'Mujer');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKj34jbk9b137jt62bgemooffcc` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_permiso` (
  `grupo_id` bigint NOT NULL,
  `permiso_id` bigint NOT NULL,
  KEY `FKm358cc061kb880nmgums0vkob` (`permiso_id`),
  KEY `FKc8boavvyqm7u999wedlrniw3o` (`grupo_id`),
  CONSTRAINT `FKc8boavvyqm7u999wedlrniw3o` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`),
  CONSTRAINT `FKm358cc061kb880nmgums0vkob` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `grupo_permiso` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,98),(1,99),(1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185),(1,186),(1,187),(1,188),(1,189),(1,190),(1,191),(1,192),(1,193),(1,194),(1,195),(1,196),(1,197),(1,198),(1,199),(1,200),(1,201),(1,202),(1,203),(1,204),(1,205),(1,206),(1,207),(1,208),(1,209),(1,210),(1,211),(1,212),(1,213),(1,214),(1,215),(1,216),(1,217),(1,218),(1,219),(1,220),(1,221),(1,222),(1,223),(1,224),(1,225),(1,226),(1,227),(1,228),(1,229),(1,230),(1,231),(1,232),(1,233),(1,234),(1,235),(1,236),(1,237),(1,238),(1,239),(1,240),(1,241),(1,242),(1,243),(1,244),(1,245),(1,246),(1,247),(1,248),(1,249),(1,250),(1,251),(1,252),(1,253),(1,254),(1,255),(1,256),(1,257),(1,258),(1,259),(1,260),(1,261),(1,262),(1,263),(1,264),(1,265),(1,266),(1,267),(1,268),(1,269),(1,270),(1,271),(1,272),(1,273),(1,274),(1,275),(1,276),(1,277),(1,278),(1,279),(1,280),(1,281),(1,282),(1,283),(1,284),(1,285),(1,286),(1,287),(1,288),(1,289),(1,290),(1,291),(1,292),(1,293),(1,294),(1,295),(1,296),(1,297),(1,298),(1,299),(1,300),(1,301),(1,302),(1,303),(1,304),(1,305),(1,306),(1,307),(1,308),(1,309),(1,310),(1,311),(1,312),(1,313),(1,314),(1,315),(1,316),(1,317),(1,318),(1,319),(1,320),(1,321),(1,322),(1,323),(1,324),(1,325),(1,326),(1,327),(1,328),(1,329),(1,330),(1,331),(1,332),(1,333),(1,334),(1,335),(1,336),(1,337),(1,338),(1,339),(1,340),(1,341),(1,342),(1,343),(1,344),(1,345),(1,346),(1,347),(1,348),(1,349),(1,340),(2,64),(2,74),(2,87),(2,105),(2,107),(2,108),(2,114),(2,121),(2,124),(2,164),(2,165),(2,176),(2,180),(2,181),(2,198),(2,199),(2,203),(2,215),(2,219),(2,227),(2,230),(2,269),(2,273),(2,274),(2,289),(2,298),(2,303),(2,305),(2,306),(2,318),(2,332),(2,339),(2,340),(2,341),(2,349),(2,3),(2,32),(2,35),(2,67),(2,91),(2,120),(2,134),(2,155),(2,185),(2,211),(2,220),(2,263),(2,281),(2,310),(2,311),(2,312),(2,313),(2,314),(2,315),(2,328),(2,340),(3,19),(3,37),(3,43),(3,55),(3,63),(3,97),(3,100),(3,106),(3,112),(3,118),(3,121),(3,122),(3,126),(3,133),(3,137),(3,161),(3,180),(3,182),(3,194),(3,202),(3,207),(3,214),(3,216),(3,221),(3,232),(3,240),(3,246),(3,256),(3,272),(3,317),(3,318),(3,319),(3,321),(3,346),(3,347),(4,4),(4,7),(4,10),(4,13),(4,19),(4,22),(4,23),(4,26),(4,31),(4,33),(4,38),(4,49),(4,50),(4,59),(4,60),(4,75),(4,80),(4,82),(4,83),(4,85),(4,89),(4,90),(4,98),(4,103),(4,106),(4,108),(4,109),(4,115),(4,118),(4,128),(4,135),(4,138),(4,142),(4,153),(4,154),(4,157),(4,158),(4,168),(4,170),(4,188),(4,192),(4,194),(4,196),(4,200),(4,206),(4,207),(4,208),(4,214),(4,216),(4,217),(4,237),(4,246),(4,257),(4,266),(4,282),(4,284),(4,287),(4,288),(4,289),(4,292),(4,297),(4,300),(4,304),(4,305),(4,306),(4,307),(4,308),(4,310),(4,334),(4,335),(4,343),(4,347),(4,348),(5,103),(5,110),(5,180),(5,187),(5,202);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_permiso_aud` (
  `rev` int NOT NULL,
  `grupo_id` bigint NOT NULL,
  `permiso_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`grupo_id`,`rev`,`permiso_id`),
  KEY `FK2ajk8i152wy4b6mflb5pdwi6g` (`rev`),
  CONSTRAINT `FK2ajk8i152wy4b6mflb5pdwi6g` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_g9dejrl43d208l27d4uek6tq4` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `grupos` VALUES (1,'Da acceso a todos los servicios que permiten configurar los parametros del sistema','2026-11-06 17:30:10.000000',NULL,'Configuraciones'),(2,'Da acceso a todas las acciones en el modulo de Eventos','2026-11-06 17:30:10.000000',NULL,'Eventos'),(3,'Da acceso a todas las acciones en el modulo de Servicios','2026-11-06 17:30:10.000000',NULL,'Servicios'),(4,'Da acceso a todas las acciones en el modulo de Lugares','2026-11-06 17:30:10.000000',NULL,'Lugares'),(5,'Da acceso a las acciones para recuperacion de usuario y contraseña ','2026-11-06 17:30:10.000000',NULL,'Seguridad');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKfbdoq4c5o9o0gbila4nwylete` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) DEFAULT NULL,
  `servicio_id` bigint DEFAULT NULL,
  `lugar_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi0wjpnskplinscqr75kqqpqow` (`servicio_id`),
  KEY `FK6y0u9xlc5boojpkvmi7c5dvy1` (`lugar_id`),
  CONSTRAINT `FK6y0u9xlc5boojpkvmi7c5dvy1` FOREIGN KEY (`lugar_id`) REFERENCES `lugares` (`id`),
  CONSTRAINT `FKi0wjpnskplinscqr75kqqpqow` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `imagenes` VALUES (1,'3/Img_1.jpg',NULL,1),(2,'3/Img_2.jpg',NULL,1),(3,'3/Img_3.jpg',NULL,1),(4,'3/Img_2.jpg',NULL,2),(5,'3/Img_3.jpg',NULL,3),(6,'3/Img_1.jpg',1,NULL),(7,'3/Img_2.jpg',1,NULL),(8,'3/Img_3.jpg',1,NULL),(9,'3/Img_2.jpg',2,NULL),(10,'3/Img_3.jpg',3,NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKbo6b9wphxjkjolp3os05agffb` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_factura` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alicuotaiva` decimal(38,2) DEFAULT NULL,
  `bonificacion` decimal(38,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `codigo_producto` varchar(255) DEFAULT NULL,
  `detalle_producto` varchar(255) DEFAULT NULL,
  `importeiva` decimal(38,2) DEFAULT NULL,
  `precio_unitario_neto` decimal(38,2) DEFAULT NULL,
  `subtotal` decimal(38,2) DEFAULT NULL,
  `unidad_medida` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `item_factura` VALUES (1,21.00,0.00,1,NULL,'Quincho Silva - lugar ideal pa',347.11,2000.00,2000.00,'UNIDAD');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_factura_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `alicuotaiva` decimal(38,2) DEFAULT NULL,
  `bonificacion` decimal(38,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `codigo_producto` varchar(255) DEFAULT NULL,
  `detalle_producto` varchar(255) DEFAULT NULL,
  `importeiva` decimal(38,2) DEFAULT NULL,
  `precio_unitario_neto` decimal(38,2) DEFAULT NULL,
  `subtotal` decimal(38,2) DEFAULT NULL,
  `unidad_medida` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKs9lt0jvx1pv4gre5fn44ldbm0` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `item_factura_aud` VALUES (1,350,0,21.00,0.00,1,NULL,'Quincho Silva - lugar ideal pa',347.11,2000.00,2000.00,'UNIDAD');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `provincia_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpsu514uguuo384j979ub9dp4y` (`provincia_id`),
  CONSTRAINT `FKpsu514uguuo384j979ub9dp4y` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=837 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `localidades` VALUES (1,'2026-11-06 17:30:10.000000',NULL,'25 de Mayo',1),(2,'2026-11-06 17:30:10.000000',NULL,'3 de febrero',1),(3,'2026-11-06 17:30:10.000000',NULL,'A. Alsina',1),(4,'2026-11-06 17:30:10.000000',NULL,'A. Gonzáles Cháves',1),(5,'2026-11-06 17:30:10.000000',NULL,'Aguas Verdes',1),(6,'2026-11-06 17:30:10.000000',NULL,'Alberti',1),(7,'2026-11-06 17:30:10.000000',NULL,'Arrecifes',1),(8,'2026-11-06 17:30:10.000000',NULL,'Ayacucho',1),(9,'2026-11-06 17:30:10.000000',NULL,'Azul',1),(10,'2026-11-06 17:30:10.000000',NULL,'Bahía Blanca',1),(11,'2026-11-06 17:30:10.000000',NULL,'Balcarce',1),(12,'2026-11-06 17:30:10.000000',NULL,'Baradero',1),(13,'2026-11-06 17:30:10.000000',NULL,'Benito Juárez',1),(14,'2026-11-06 17:30:10.000000',NULL,'Berazategui',1),(15,'2026-11-06 17:30:10.000000',NULL,'Berisso',1),(16,'2026-11-06 17:30:10.000000',NULL,'Bolívar',1),(17,'2026-11-06 17:30:10.000000',NULL,'Bragado',1),(18,'2026-11-06 17:30:10.000000',NULL,'Brandsen',1),(19,'2026-11-06 17:30:10.000000',NULL,'Campana',1),(20,'2026-11-06 17:30:10.000000',NULL,'Cañuelas',1),(21,'2026-11-06 17:30:10.000000',NULL,'Capilla del Señor',1),(22,'2026-11-06 17:30:10.000000',NULL,'Capitán Sarmiento',1),(23,'2026-11-06 17:30:10.000000',NULL,'Carhué',1),(24,'2026-11-06 17:30:10.000000',NULL,'Carlos Casares',1),(25,'2026-11-06 17:30:10.000000',NULL,'Carlos Tejedor',1),(26,'2026-11-06 17:30:10.000000',NULL,'Carmen de Areco',1),(27,'2026-11-06 17:30:10.000000',NULL,'Carmen de Patagones',1),(28,'2026-11-06 17:30:10.000000',NULL,'Castelli',1),(29,'2026-11-06 17:30:10.000000',NULL,'Chacabuco',1),(30,'2026-11-06 17:30:10.000000',NULL,'Chascomús',1),(31,'2026-11-06 17:30:10.000000',NULL,'Chivilcoy',1),(32,'2026-11-06 17:30:10.000000',NULL,'Colón',1),(33,'2026-11-06 17:30:10.000000',NULL,'Coronel Dorrego',1),(34,'2026-11-06 17:30:10.000000',NULL,'Coronel Pringles',1),(35,'2026-11-06 17:30:10.000000',NULL,'Coronel Suárez',1),(36,'2026-11-06 17:30:10.000000',NULL,'Dolores',1),(37,'2026-11-06 17:30:10.000000',NULL,'Ensenada',1),(38,'2026-11-06 17:30:10.000000',NULL,'Escobar',1),(39,'2026-11-06 17:30:10.000000',NULL,'Esteban Echeverría',1),(40,'2026-11-06 17:30:10.000000',NULL,'Exaltación de la Cruz',1),(41,'2026-11-06 17:30:10.000000',NULL,'Florencio Varela',1),(42,'2026-11-06 17:30:10.000000',NULL,'Florentino Ameghino',1),(43,'2026-11-06 17:30:10.000000',NULL,'General Alvarado',1),(44,'2026-11-06 17:30:10.000000',NULL,'General Alvear',1),(45,'2026-11-06 17:30:10.000000',NULL,'General Arenales',1),(46,'2026-11-06 17:30:10.000000',NULL,'General Belgrano',1),(47,'2026-11-06 17:30:10.000000',NULL,'General Guido',1),(48,'2026-11-06 17:30:10.000000',NULL,'General Juan Madariaga',1),(49,'2026-11-06 17:30:10.000000',NULL,'General La Madrid',1),(50,'2026-11-06 17:30:10.000000',NULL,'General Las Heras',1),(51,'2026-11-06 17:30:10.000000',NULL,'General Lavalle',1),(52,'2026-11-06 17:30:10.000000',NULL,'General Paz',1),(53,'2026-11-06 17:30:10.000000',NULL,'General Pinto',1),(54,'2026-11-06 17:30:10.000000',NULL,'General Pueyrredón',1),(55,'2026-11-06 17:30:10.000000',NULL,'General Rodríguez',1),(56,'2026-11-06 17:30:10.000000',NULL,'General San Martín',1),(57,'2026-11-06 17:30:10.000000',NULL,'General Viamonte',1),(58,'2026-11-06 17:30:10.000000',NULL,'General Villegas',1),(59,'2026-11-06 17:30:10.000000',NULL,'Guaminí',1),(60,'2026-11-06 17:30:10.000000',NULL,'Henderson',1),(61,'2026-11-06 17:30:10.000000',NULL,'Hurlingham',1),(62,'2026-11-06 17:30:10.000000',NULL,'Ituzaingó',1),(63,'2026-11-06 17:30:10.000000',NULL,'José C. Paz',1),(64,'2026-11-06 17:30:10.000000',NULL,'Junín',1),(65,'2026-11-06 17:30:10.000000',NULL,'La Matanza',1),(66,'2026-11-06 17:30:10.000000',NULL,'La Plata',1),(67,'2026-11-06 17:30:10.000000',NULL,'Lanús',1),(68,'2026-11-06 17:30:10.000000',NULL,'Laprida',1),(69,'2026-11-06 17:30:10.000000',NULL,'Las Flores',1),(70,'2026-11-06 17:30:10.000000',NULL,'Leandro N. Alem',1),(71,'2026-11-06 17:30:10.000000',NULL,'Lincoln',1),(72,'2026-11-06 17:30:10.000000',NULL,'Lobería',1),(73,'2026-11-06 17:30:10.000000',NULL,'Lobos',1),(74,'2026-11-06 17:30:10.000000',NULL,'Lomas de Zamora',1),(75,'2026-11-06 17:30:10.000000',NULL,'Luján',1),(76,'2026-11-06 17:30:10.000000',NULL,'Magdalena',1),(77,'2026-11-06 17:30:10.000000',NULL,'Maipú',1),(78,'2026-11-06 17:30:10.000000',NULL,'Mar Chiquita',1),(79,'2026-11-06 17:30:10.000000',NULL,'Marcos Paz',1),(80,'2026-11-06 17:30:10.000000',NULL,'Mercedes',1),(81,'2026-11-06 17:30:10.000000',NULL,'Merlo',1),(82,'2026-11-06 17:30:10.000000',NULL,'Monte',1),(83,'2026-11-06 17:30:10.000000',NULL,'Monte Hermoso',1),(84,'2026-11-06 17:30:10.000000',NULL,'Moreno',1),(85,'2026-11-06 17:30:10.000000',NULL,'Morón',1),(86,'2026-11-06 17:30:10.000000',NULL,'Navarro',1),(87,'2026-11-06 17:30:10.000000',NULL,'Necochea',1),(88,'2026-11-06 17:30:10.000000',NULL,'Olavarría',1),(89,'2026-11-06 17:30:10.000000',NULL,'Patagones',1),(90,'2026-11-06 17:30:10.000000',NULL,'Pehuajó',1),(91,'2026-11-06 17:30:10.000000',NULL,'Pellegrini',1),(92,'2026-11-06 17:30:10.000000',NULL,'Pergamino',1),(93,'2026-11-06 17:30:10.000000',NULL,'Pila',1),(94,'2026-11-06 17:30:10.000000',NULL,'Pilar',1),(95,'2026-11-06 17:30:10.000000',NULL,'Pinamar',1),(96,'2026-11-06 17:30:10.000000',NULL,'Presidente Perón',1),(97,'2026-11-06 17:30:10.000000',NULL,'Puan',1),(98,'2026-11-06 17:30:10.000000',NULL,'Quilmes',1),(99,'2026-11-06 17:30:10.000000',NULL,'Ramallo',1),(100,'2026-11-06 17:30:10.000000',NULL,'Rauch',1),(101,'2026-11-06 17:30:10.000000',NULL,'Rivadavia',1),(102,'2026-11-06 17:30:10.000000',NULL,'Rojas',1),(103,'2026-11-06 17:30:10.000000',NULL,'Roque Pérez',1),(104,'2026-11-06 17:30:10.000000',NULL,'Saavedra',1),(105,'2026-11-06 17:30:10.000000',NULL,'Saladillo',1),(106,'2026-11-06 17:30:10.000000',NULL,'Salto',1),(107,'2026-11-06 17:30:10.000000',NULL,'San Andrés de Giles',1),(108,'2026-11-06 17:30:10.000000',NULL,'San Antonio de Areco',1),(109,'2026-11-06 17:30:10.000000',NULL,'San Cayetano',1),(110,'2026-11-06 17:30:10.000000',NULL,'San Fernando',1),(111,'2026-11-06 17:30:10.000000',NULL,'San Isidro',1),(112,'2026-11-06 17:30:10.000000',NULL,'San Miguel',1),(113,'2026-11-06 17:30:10.000000',NULL,'San Nicolás',1),(114,'2026-11-06 17:30:10.000000',NULL,'San Pedro',1),(115,'2026-11-06 17:30:10.000000',NULL,'San Vicente',1),(116,'2026-11-06 17:30:10.000000',NULL,'Suipacha',1),(117,'2026-11-06 17:30:10.000000',NULL,'Tandil',1),(118,'2026-11-06 17:30:10.000000',NULL,'Tapalqué',1),(119,'2026-11-06 17:30:10.000000',NULL,'Tigre',1),(120,'2026-11-06 17:30:10.000000',NULL,'Tordillo',1),(121,'2026-11-06 17:30:10.000000',NULL,'Tornquist',1),(122,'2026-11-06 17:30:10.000000',NULL,'Trenque Lauquen',1),(123,'2026-11-06 17:30:10.000000',NULL,'Tres Arroyos',1),(124,'2026-11-06 17:30:10.000000',NULL,'Tres de Febrero',1),(125,'2026-11-06 17:30:10.000000',NULL,'Tres Lomas',1),(126,'2026-11-06 17:30:10.000000',NULL,'Viamonte',1),(127,'2026-11-06 17:30:10.000000',NULL,'Vicente López',1),(128,'2026-11-06 17:30:10.000000',NULL,'Villa Gesell',1),(129,'2026-11-06 17:30:10.000000',NULL,'Villarino',1),(130,'2026-11-06 17:30:10.000000',NULL,'Zárate',1),(131,'2026-11-06 17:30:10.000000',NULL,'Avellaneda',2),(132,'2026-11-06 17:30:10.000000',NULL,'Berazategui',2),(133,'2026-11-06 17:30:10.000000',NULL,'Berisso',2),(134,'2026-11-06 17:30:10.000000',NULL,'Escobar',2),(135,'2026-11-06 17:30:10.000000',NULL,'Esteban Echeverría',2),(136,'2026-11-06 17:30:10.000000',NULL,'Ezeiza',2),(137,'2026-11-06 17:30:10.000000',NULL,'Florencio Varela',2),(138,'2026-11-06 17:30:10.000000',NULL,'Hurlingham',2),(139,'2026-11-06 17:30:10.000000',NULL,'Ituzaingó',2),(140,'2026-11-06 17:30:10.000000',NULL,'José C. Paz',2),(141,'2026-11-06 17:30:10.000000',NULL,'Lanús',2),(142,'2026-11-06 17:30:10.000000',NULL,'La Matanza',2),(143,'2026-11-06 17:30:10.000000',NULL,'Malvinas Argentinas',2),(144,'2026-11-06 17:30:10.000000',NULL,'Merlo',2),(145,'2026-11-06 17:30:10.000000',NULL,'Moreno',2),(146,'2026-11-06 17:30:10.000000',NULL,'Morón',2),(147,'2026-11-06 17:30:10.000000',NULL,'Quilmes',2),(148,'2026-11-06 17:30:10.000000',NULL,'San Fernando',2),(149,'2026-11-06 17:30:10.000000',NULL,'San Isidro',2),(150,'2026-11-06 17:30:10.000000',NULL,'San Martín',2),(151,'2026-11-06 17:30:10.000000',NULL,'San Miguel',2),(152,'2026-11-06 17:30:10.000000',NULL,'Tigre',2),(153,'2026-11-06 17:30:10.000000',NULL,'Tres de Febrero',2),(154,'2026-11-06 17:30:10.000000',NULL,'Vicente López',2),(155,'2026-11-06 17:30:10.000000',NULL,'Agronomía',3),(156,'2026-11-06 17:30:10.000000',NULL,'Almagro',3),(157,'2026-11-06 17:30:10.000000',NULL,'Balvanera',3),(158,'2026-11-06 17:30:10.000000',NULL,'Barracas',3),(159,'2026-11-06 17:30:10.000000',NULL,'Belgrano',3),(160,'2026-11-06 17:30:10.000000',NULL,'Boedo',3),(161,'2026-11-06 17:30:10.000000',NULL,'Caballito',3),(162,'2026-11-06 17:30:10.000000',NULL,'Chacarita',3),(163,'2026-11-06 17:30:10.000000',NULL,'Coghlan',3),(164,'2026-11-06 17:30:10.000000',NULL,'Colegiales',3),(165,'2026-11-06 17:30:10.000000',NULL,'Constitución',3),(166,'2026-11-06 17:30:10.000000',NULL,'Flores',3),(167,'2026-11-06 17:30:10.000000',NULL,'Floresta',3),(168,'2026-11-06 17:30:10.000000',NULL,'La Boca',3),(169,'2026-11-06 17:30:10.000000',NULL,'Liniers',3),(170,'2026-11-06 17:30:10.000000',NULL,'Mataderos',3),(171,'2026-11-06 17:30:10.000000',NULL,'Monserrat',3),(172,'2026-11-06 17:30:10.000000',NULL,'Monte Castro',3),(173,'2026-11-06 17:30:10.000000',NULL,'Nueva Pompeya',3),(174,'2026-11-06 17:30:10.000000',NULL,'Núñez',3),(175,'2026-11-06 17:30:10.000000',NULL,'Palermo',3),(176,'2026-11-06 17:30:10.000000',NULL,'Parque Avellaneda',3),(177,'2026-11-06 17:30:10.000000',NULL,'Parque Chacabuco',3),(178,'2026-11-06 17:30:10.000000',NULL,'Parque Patricios',3),(179,'2026-11-06 17:30:10.000000',NULL,'Paternal',3),(180,'2026-11-06 17:30:10.000000',NULL,'Puerto Madero',3),(181,'2026-11-06 17:30:10.000000',NULL,'Recoleta',3),(182,'2026-11-06 17:30:10.000000',NULL,'Retiro',3),(183,'2026-11-06 17:30:10.000000',NULL,'Saavedra',3),(184,'2026-11-06 17:30:10.000000',NULL,'San Cristóbal',3),(185,'2026-11-06 17:30:10.000000',NULL,'San Nicolás',3),(186,'2026-11-06 17:30:10.000000',NULL,'San Telmo',3),(187,'2026-11-06 17:30:10.000000',NULL,'Versalles',3),(188,'2026-11-06 17:30:10.000000',NULL,'Villa Crespo',3),(189,'2026-11-06 17:30:10.000000',NULL,'Villa del Parque',3),(190,'2026-11-06 17:30:10.000000',NULL,'Villa Devoto',3),(191,'2026-11-06 17:30:10.000000',NULL,'Villa General Mitre',3),(192,'2026-11-06 17:30:10.000000',NULL,'Villa Lugano',3),(193,'2026-11-06 17:30:10.000000',NULL,'Villa Luro',3),(194,'2026-11-06 17:30:10.000000',NULL,'Villa Ortúzar',3),(195,'2026-11-06 17:30:10.000000',NULL,'Villa Pueyrredón',3),(196,'2026-11-06 17:30:10.000000',NULL,'Villa Real',3),(197,'2026-11-06 17:30:10.000000',NULL,'Villa Riachuelo',3),(198,'2026-11-06 17:30:10.000000',NULL,'Villa Santa Rita',3),(199,'2026-11-06 17:30:10.000000',NULL,'Villa Soldati',3),(200,'2026-11-06 17:30:10.000000',NULL,'Villa Urquiza',3),(201,'2026-11-06 17:30:10.000000',NULL,'Andalgalá',4),(202,'2026-11-06 17:30:10.000000',NULL,'Belén',4),(203,'2026-11-06 17:30:10.000000',NULL,'Capayán',4),(204,'2026-11-06 17:30:10.000000',NULL,'Capital',4),(205,'2026-11-06 17:30:10.000000',NULL,'El Alto',4),(206,'2026-11-06 17:30:10.000000',NULL,'Fray Mamerto Esquiú',4),(207,'2026-11-06 17:30:10.000000',NULL,'La Paz',4),(208,'2026-11-06 17:30:10.000000',NULL,'Paclín',4),(209,'2026-11-06 17:30:10.000000',NULL,'Pomán',4),(210,'2026-11-06 17:30:10.000000',NULL,'Santa María',4),(211,'2026-11-06 17:30:10.000000',NULL,'Santa Rosa',4),(212,'2026-11-06 17:30:10.000000',NULL,'Tinogasta',4),(213,'2026-11-06 17:30:10.000000',NULL,'Valle Viejo',4),(214,'2026-11-06 17:30:10.000000',NULL,'Barranqueras',5),(215,'2026-11-06 17:30:10.000000',NULL,'Basail',5),(216,'2026-11-06 17:30:10.000000',NULL,'Campo Largo',5),(217,'2026-11-06 17:30:10.000000',NULL,'Capitán Solari',5),(218,'2026-11-06 17:30:10.000000',NULL,'Charata',5),(219,'2026-11-06 17:30:10.000000',NULL,'Colonia Benítez',5),(220,'2026-11-06 17:30:10.000000',NULL,'Colonia Elisa',5),(221,'2026-11-06 17:30:10.000000',NULL,'Colonia Popular',5),(222,'2026-11-06 17:30:10.000000',NULL,'Colonias Unidas',5),(223,'2026-11-06 17:30:10.000000',NULL,'Concepción del Bermejo',5),(224,'2026-11-06 17:30:10.000000',NULL,'Corrientes',5),(225,'2026-11-06 17:30:10.000000',NULL,'Fontana',5),(226,'2026-11-06 17:30:10.000000',NULL,'Gancedo',5),(227,'2026-11-06 17:30:10.000000',NULL,'General Capdevila',5),(228,'2026-11-06 17:30:10.000000',NULL,'General José de San Martín',5),(229,'2026-11-06 17:30:10.000000',NULL,'General Pinedo',5),(230,'2026-11-06 17:30:10.000000',NULL,'General Vedia',5),(231,'2026-11-06 17:30:10.000000',NULL,'Hermoso Campo',5),(232,'2026-11-06 17:30:10.000000',NULL,'Isla del Cerrito',5),(233,'2026-11-06 17:30:10.000000',NULL,'Juan José Castelli',5),(234,'2026-11-06 17:30:10.000000',NULL,'La Clotilde',5),(235,'2026-11-06 17:30:10.000000',NULL,'La Eduvigis',5),(236,'2026-11-06 17:30:10.000000',NULL,'La Escondida',5),(237,'2026-11-06 17:30:10.000000',NULL,'La Leonesa',5),(238,'2026-11-06 17:30:10.000000',NULL,'La Tigra',5),(239,'2026-11-06 17:30:10.000000',NULL,'La Verde',5),(240,'2026-11-06 17:30:10.000000',NULL,'Laguna Blanca',5),(241,'2026-11-06 17:30:10.000000',NULL,'Laguna Limpia',5),(242,'2026-11-06 17:30:10.000000',NULL,'Lapachito',5),(243,'2026-11-06 17:30:10.000000',NULL,'Las Breñas',5),(244,'2026-11-06 17:30:10.000000',NULL,'Las Garcitas',5),(245,'2026-11-06 17:30:10.000000',NULL,'Las Palmas',5),(246,'2026-11-06 17:30:10.000000',NULL,'Los Frentones',5),(247,'2026-11-06 17:30:10.000000',NULL,'Machagai',5),(248,'2026-11-06 17:30:10.000000',NULL,'Makallé',5),(249,'2026-11-06 17:30:10.000000',NULL,'Margarita Belén',5),(250,'2026-11-06 17:30:10.000000',NULL,'Miraflores',5),(251,'2026-11-06 17:30:10.000000',NULL,'Napenay',5),(252,'2026-11-06 17:30:10.000000',NULL,'Pampa Almirón',5),(253,'2026-11-06 17:30:10.000000',NULL,'Pampa del Indio',5),(254,'2026-11-06 17:30:10.000000',NULL,'Pampa del Infierno',5),(255,'2026-11-06 17:30:10.000000',NULL,'Presidencia de la Plaza',5),(256,'2026-11-06 17:30:10.000000',NULL,'Presidencia Roca',5),(257,'2026-11-06 17:30:10.000000',NULL,'Presidencia Roque Sáenz Peña',5),(258,'2026-11-06 17:30:10.000000',NULL,'Puerto Bermejo',5),(259,'2026-11-06 17:30:10.000000',NULL,'Puerto Eva Perón',5),(260,'2026-11-06 17:30:10.000000',NULL,'Puerto Tirol',5),(261,'2026-11-06 17:30:10.000000',NULL,'Puerto Vilelas',5),(262,'2026-11-06 17:30:10.000000',NULL,'Quitilipi',5),(263,'2026-11-06 17:30:10.000000',NULL,'Resistencia',5),(264,'2026-11-06 17:30:10.000000',NULL,'Sáenz Peña',5),(265,'2026-11-06 17:30:10.000000',NULL,'Samuhú',5),(266,'2026-11-06 17:30:10.000000',NULL,'San Bernardo',5),(267,'2026-11-06 17:30:10.000000',NULL,'Santa Sylvina',5),(268,'2026-11-06 17:30:10.000000',NULL,'Selvas del Río de Oro',5),(269,'2026-11-06 17:30:10.000000',NULL,'Taco Pozo',5),(270,'2026-11-06 17:30:10.000000',NULL,'Tres Isletas',5),(271,'2026-11-06 17:30:10.000000',NULL,'Villa Ángela',5),(272,'2026-11-06 17:30:10.000000',NULL,'Villa Berthet',5),(273,'2026-11-06 17:30:10.000000',NULL,'Villa Río Bermejito',5),(274,'2026-11-06 17:30:10.000000',NULL,'Aldea Apeleg',6),(275,'2026-11-06 17:30:10.000000',NULL,'Aldea Beleiro',6),(276,'2026-11-06 17:30:10.000000',NULL,'Aldea Epulef',6),(277,'2026-11-06 17:30:10.000000',NULL,'Alto Río Senguer',6),(278,'2026-11-06 17:30:10.000000',NULL,'Buen Pasto',6),(279,'2026-11-06 17:30:10.000000',NULL,'Camarones',6),(280,'2026-11-06 17:30:10.000000',NULL,'Carrenleufú',6),(281,'2026-11-06 17:30:10.000000',NULL,'Cholila',6),(282,'2026-11-06 17:30:10.000000',NULL,'Colet',6),(283,'2026-11-06 17:30:10.000000',NULL,'Comodoro Rivadavia',6),(284,'2026-11-06 17:30:10.000000',NULL,'Corcovado',6),(285,'2026-11-06 17:30:10.000000',NULL,'Cushamen',6),(286,'2026-11-06 17:30:10.000000',NULL,'Dique Florentino Ameghino',6),(287,'2026-11-06 17:30:10.000000',NULL,'Dolavon',6),(288,'2026-11-06 17:30:10.000000',NULL,'El Hoyo',6),(289,'2026-11-06 17:30:10.000000',NULL,'El Maitén',6),(290,'2026-11-06 17:30:10.000000',NULL,'Epuyén',6),(291,'2026-11-06 17:30:10.000000',NULL,'Esquel',6),(292,'2026-11-06 17:30:10.000000',NULL,'Facundo',6),(293,'2026-11-06 17:30:10.000000',NULL,'Gaimán',6),(294,'2026-11-06 17:30:10.000000',NULL,'Gan Gan',6),(295,'2026-11-06 17:30:10.000000',NULL,'Gastre',6),(296,'2026-11-06 17:30:10.000000',NULL,'Gobernador Costa',6),(297,'2026-11-06 17:30:10.000000',NULL,'Gualjaina',6),(298,'2026-11-06 17:30:10.000000',NULL,'José de San Martín',6),(299,'2026-11-06 17:30:10.000000',NULL,'Lago Blanco',6),(300,'2026-11-06 17:30:10.000000',NULL,'Lago Puelo',6),(301,'2026-11-06 17:30:10.000000',NULL,'Las Plumas',6),(302,'2026-11-06 17:30:10.000000',NULL,'Paso de Indios',6),(303,'2026-11-06 17:30:10.000000',NULL,'Paso del Sapo',6),(304,'2026-11-06 17:30:10.000000',NULL,'Puerto Madryn',6),(305,'2026-11-06 17:30:10.000000',NULL,'Puerto Pirámides',6),(306,'2026-11-06 17:30:10.000000',NULL,'Rada Tilly',6),(307,'2026-11-06 17:30:10.000000',NULL,'Rawson',6),(308,'2026-11-06 17:30:10.000000',NULL,'Río Mayo',6),(309,'2026-11-06 17:30:10.000000',NULL,'Río Pico',6),(310,'2026-11-06 17:30:10.000000',NULL,'Sarmiento',6),(311,'2026-11-06 17:30:10.000000',NULL,'Tecka',6),(312,'2026-11-06 17:30:10.000000',NULL,'Trelew',6),(313,'2026-11-06 17:30:10.000000',NULL,'Trevelin',6),(314,'2026-11-06 17:30:10.000000',NULL,'Villa Futalaufquen',6),(315,'2026-11-06 17:30:10.000000',NULL,'Alcira Gigena',7),(316,'2026-11-06 17:30:10.000000',NULL,'Alta Gracia',7),(317,'2026-11-06 17:30:10.000000',NULL,'Arroyito',7),(318,'2026-11-06 17:30:10.000000',NULL,'Bell Ville',7),(319,'2026-11-06 17:30:10.000000',NULL,'Brinkmann',7),(320,'2026-11-06 17:30:10.000000',NULL,'Córdoba Capital',7),(321,'2026-11-06 17:30:10.000000',NULL,'Cosquín',7),(322,'2026-11-06 17:30:10.000000',NULL,'Corral de Bustos',7),(323,'2026-11-06 17:30:10.000000',NULL,'Cruz del Eje',7),(324,'2026-11-06 17:30:10.000000',NULL,'Deán Funes',7),(325,'2026-11-06 17:30:10.000000',NULL,'Embalse',7),(326,'2026-11-06 17:30:10.000000',NULL,'Jesús María',7),(327,'2026-11-06 17:30:10.000000',NULL,'La Carlota',7),(328,'2026-11-06 17:30:10.000000',NULL,'La Falda',7),(329,'2026-11-06 17:30:10.000000',NULL,'Laboulaye',7),(330,'2026-11-06 17:30:10.000000',NULL,'Las Varillas',7),(331,'2026-11-06 17:30:10.000000',NULL,'Leones',7),(332,'2026-11-06 17:30:10.000000',NULL,'Marcos Juárez',7),(333,'2026-11-06 17:30:10.000000',NULL,'Minas',7),(334,'2026-11-06 17:30:10.000000',NULL,'Morteros',7),(335,'2026-11-06 17:30:10.000000',NULL,'Oncativo',7),(336,'2026-11-06 17:30:10.000000',NULL,'Río Cuarto',7),(337,'2026-11-06 17:30:10.000000',NULL,'Río Tercero',7),(338,'2026-11-06 17:30:10.000000',NULL,'San Francisco',7),(339,'2026-11-06 17:30:10.000000',NULL,'Salsipuedes',7),(340,'2026-11-06 17:30:10.000000',NULL,'Santa María de Punilla',7),(341,'2026-11-06 17:30:10.000000',NULL,'Tanti',7),(342,'2026-11-06 17:30:10.000000',NULL,'Unquillo',7),(343,'2026-11-06 17:30:10.000000',NULL,'Valle Hermoso',7),(344,'2026-11-06 17:30:10.000000',NULL,'Villa Allende',7),(345,'2026-11-06 17:30:10.000000',NULL,'Villa Carlos Paz',7),(346,'2026-11-06 17:30:10.000000',NULL,'Villa Dolores',7),(347,'2026-11-06 17:30:10.000000',NULL,'Villa María',7),(348,'2026-11-06 17:30:10.000000',NULL,'Villa Nueva',7),(349,'2026-11-06 17:30:10.000000',NULL,'Villa Rumipal',7),(350,'2026-11-06 17:30:10.000000',NULL,'Villa Santa Rosa',7),(351,'2026-11-06 17:30:10.000000',NULL,'Villa del Rosario',7),(352,'2026-11-06 17:30:10.000000',NULL,'Villa General Belgrano',7),(353,'2026-11-06 17:30:10.000000',NULL,'Villa Huidobro',7),(354,'2026-11-06 17:30:10.000000',NULL,'Villa Sarmiento',7),(355,'2026-11-06 17:30:10.000000',NULL,'Villa Valeria',7),(356,'2026-11-06 17:30:10.000000',NULL,'Vicuña Mackenna',7),(357,'2026-11-06 17:30:10.000000',NULL,'Alvear',8),(358,'2026-11-06 17:30:10.000000',NULL,'Bella Vista',8),(359,'2026-11-06 17:30:10.000000',NULL,'Berón de Astrada',8),(360,'2026-11-06 17:30:10.000000',NULL,'Bonpland',8),(361,'2026-11-06 17:30:10.000000',NULL,'Caá Catí',8),(362,'2026-11-06 17:30:10.000000',NULL,'Capital',8),(363,'2026-11-06 17:30:10.000000',NULL,'Colonia Carlos Pellegrini',8),(364,'2026-11-06 17:30:10.000000',NULL,'Concepción',8),(365,'2026-11-06 17:30:10.000000',NULL,'Corrientes',8),(366,'2026-11-06 17:30:10.000000',NULL,'Curuzú Cuatiá',8),(367,'2026-11-06 17:30:10.000000',NULL,'Empedrado',8),(368,'2026-11-06 17:30:10.000000',NULL,'Esquina',8),(369,'2026-11-06 17:30:10.000000',NULL,'Goya',8),(370,'2026-11-06 17:30:10.000000',NULL,'Gobernador Virasoro',8),(371,'2026-11-06 17:30:10.000000',NULL,'Itatí',8),(372,'2026-11-06 17:30:10.000000',NULL,'Ituzaingó',8),(373,'2026-11-06 17:30:10.000000',NULL,'La Cruz',8),(374,'2026-11-06 17:30:10.000000',NULL,'Libertador',8),(375,'2026-11-06 17:30:10.000000',NULL,'Loreto',8),(376,'2026-11-06 17:30:10.000000',NULL,'Mburucuyá',8),(377,'2026-11-06 17:30:10.000000',NULL,'Mercedes',8),(378,'2026-11-06 17:30:10.000000',NULL,'Mocoretá',8),(379,'2026-11-06 17:30:10.000000',NULL,'Monte Caseros',8),(380,'2026-11-06 17:30:10.000000',NULL,'Paso de los Libres',8),(381,'2026-11-06 17:30:10.000000',NULL,'Paso de la Patria',8),(382,'2026-11-06 17:30:10.000000',NULL,'Perugorría',8),(383,'2026-11-06 17:30:10.000000',NULL,'Pueblo Libertador',8),(384,'2026-11-06 17:30:10.000000',NULL,'Riachuelo',8),(385,'2026-11-06 17:30:10.000000',NULL,'Saladas',8),(386,'2026-11-06 17:30:10.000000',NULL,'San Cosme',8),(387,'2026-11-06 17:30:10.000000',NULL,'San Luis del Palmar',8),(388,'2026-11-06 17:30:10.000000',NULL,'San Miguel',8),(389,'2026-11-06 17:30:10.000000',NULL,'San Roque',8),(390,'2026-11-06 17:30:10.000000',NULL,'Santa Ana',8),(391,'2026-11-06 17:30:10.000000',NULL,'Santa Lucía',8),(392,'2026-11-06 17:30:10.000000',NULL,'Santo Tomé',8),(393,'2026-11-06 17:30:10.000000',NULL,'Sauce',8),(394,'2026-11-06 17:30:10.000000',NULL,'Tapebicuá',8),(395,'2026-11-06 17:30:10.000000',NULL,'Basavilbaso',9),(396,'2026-11-06 17:30:10.000000',NULL,'Bovril',9),(397,'2026-11-06 17:30:10.000000',NULL,'Colón',9),(398,'2026-11-06 17:30:10.000000',NULL,'Concepción del Uruguay',9),(399,'2026-11-06 17:30:10.000000',NULL,'Concordia',9),(400,'2026-11-06 17:30:10.000000',NULL,'Crespo',9),(401,'2026-11-06 17:30:10.000000',NULL,'Diamante',9),(402,'2026-11-06 17:30:10.000000',NULL,'Feliciano',9),(403,'2026-11-06 17:30:10.000000',NULL,'Federal',9),(404,'2026-11-06 17:30:10.000000',NULL,'Gualeguay',9),(405,'2026-11-06 17:30:10.000000',NULL,'Gualeguaychú',9),(406,'2026-11-06 17:30:10.000000',NULL,'Hasenkamp',9),(407,'2026-11-06 17:30:10.000000',NULL,'Hernandarias',9),(408,'2026-11-06 17:30:10.000000',NULL,'La Paz',9),(409,'2026-11-06 17:30:10.000000',NULL,'Larroque',9),(410,'2026-11-06 17:30:10.000000',NULL,'Los Charrúas',9),(411,'2026-11-06 17:30:10.000000',NULL,'María Grande',9),(412,'2026-11-06 17:30:10.000000',NULL,'Nogoyá',9),(413,'2026-11-06 17:30:10.000000',NULL,'Paraná',9),(414,'2026-11-06 17:30:10.000000',NULL,'Ramírez',9),(415,'2026-11-06 17:30:10.000000',NULL,'Rosario del Tala',9),(416,'2026-11-06 17:30:10.000000',NULL,'San Benito',9),(417,'2026-11-06 17:30:10.000000',NULL,'San José',9),(418,'2026-11-06 17:30:10.000000',NULL,'San Salvador',9),(419,'2026-11-06 17:30:10.000000',NULL,'Santa Elena',9),(420,'2026-11-06 17:30:10.000000',NULL,'Ubajay',9),(421,'2026-11-06 17:30:10.000000',NULL,'Urdinarrain',9),(422,'2026-11-06 17:30:10.000000',NULL,'Victoria',9),(423,'2026-11-06 17:30:10.000000',NULL,'Villaguay',9),(424,'2026-11-06 17:30:10.000000',NULL,'Villa del Rosario',9),(425,'2026-11-06 17:30:10.000000',NULL,'Villa Elisa',9),(426,'2026-11-06 17:30:10.000000',NULL,'Villa Paranacito',9),(427,'2026-11-06 17:30:10.000000',NULL,'Villa Urquiza',9),(428,'2026-11-06 17:30:10.000000',NULL,'Viale',9),(429,'2026-11-06 17:30:10.000000',NULL,'Buena Vista',10),(430,'2026-11-06 17:30:10.000000',NULL,'Clorinda',10),(431,'2026-11-06 17:30:10.000000',NULL,'Comandante Fontana',10),(432,'2026-11-06 17:30:10.000000',NULL,'El Colorado',10),(433,'2026-11-06 17:30:10.000000',NULL,'Estanislao del Campo',10),(434,'2026-11-06 17:30:10.000000',NULL,'Formosa',10),(435,'2026-11-06 17:30:10.000000',NULL,'General Belgrano',10),(436,'2026-11-06 17:30:10.000000',NULL,'General Güemes',10),(437,'2026-11-06 17:30:10.000000',NULL,'Herradura',10),(438,'2026-11-06 17:30:10.000000',NULL,'Ibarreta',10),(439,'2026-11-06 17:30:10.000000',NULL,'Ingeniero Juárez',10),(440,'2026-11-06 17:30:10.000000',NULL,'Laguna Blanca',10),(441,'2026-11-06 17:30:10.000000',NULL,'Laguna Naick Neck',10),(442,'2026-11-06 17:30:10.000000',NULL,'Laguna Yema',10),(443,'2026-11-06 17:30:10.000000',NULL,'Las Lomitas',10),(444,'2026-11-06 17:30:10.000000',NULL,'Los Chiriguanos',10),(445,'2026-11-06 17:30:10.000000',NULL,'Mayor Villafañe',10),(446,'2026-11-06 17:30:10.000000',NULL,'Misión Tacaaglé',10),(447,'2026-11-06 17:30:10.000000',NULL,'Palo Santo',10),(448,'2026-11-06 17:30:10.000000',NULL,'Pirané',10),(449,'2026-11-06 17:30:10.000000',NULL,'Riacho He Hé',10),(450,'2026-11-06 17:30:10.000000',NULL,'San Francisco de Laishi',10),(451,'2026-11-06 17:30:10.000000',NULL,'San Martín II',10),(452,'2026-11-06 17:30:10.000000',NULL,'Siete Palmas',10),(453,'2026-11-06 17:30:10.000000',NULL,'Subteniente Perin',10),(454,'2026-11-06 17:30:10.000000',NULL,'Villa Dos Trece',10),(455,'2026-11-06 17:30:10.000000',NULL,'Villa Escolar',10),(456,'2026-11-06 17:30:10.000000',NULL,'Abra Pampa',11),(457,'2026-11-06 17:30:10.000000',NULL,'Aguas Calientes',11),(458,'2026-11-06 17:30:10.000000',NULL,'El Carmen',11),(459,'2026-11-06 17:30:10.000000',NULL,'Fraile Pintado',11),(460,'2026-11-06 17:30:10.000000',NULL,'Humahuaca',11),(461,'2026-11-06 17:30:10.000000',NULL,'La Esperanza',11),(462,'2026-11-06 17:30:10.000000',NULL,'La Quiaca',11),(463,'2026-11-06 17:30:10.000000',NULL,'Libertador General San Martín',11),(464,'2026-11-06 17:30:10.000000',NULL,'Maimará',11),(465,'2026-11-06 17:30:10.000000',NULL,'Monterrico',11),(466,'2026-11-06 17:30:10.000000',NULL,'Palpalá',11),(467,'2026-11-06 17:30:10.000000',NULL,'Perico',11),(468,'2026-11-06 17:30:10.000000',NULL,'Puesto Viejo',11),(469,'2026-11-06 17:30:10.000000',NULL,'Purmamarca',11),(470,'2026-11-06 17:30:10.000000',NULL,'San Antonio',11),(471,'2026-11-06 17:30:10.000000',NULL,'San Pedro',11),(472,'2026-11-06 17:30:10.000000',NULL,'San Salvador de Jujuy',11),(473,'2026-11-06 17:30:10.000000',NULL,'Tilcara',11),(474,'2026-11-06 17:30:10.000000',NULL,'Uquía',11),(475,'2026-11-06 17:30:10.000000',NULL,'Yala',11),(476,'2026-11-06 17:30:10.000000',NULL,'Yuto',11),(477,'2026-11-06 17:30:10.000000',NULL,'Alta Italia',12),(478,'2026-11-06 17:30:10.000000',NULL,'Anguil',12),(479,'2026-11-06 17:30:10.000000',NULL,'Arata',12),(480,'2026-11-06 17:30:10.000000',NULL,'Bernasconi',12),(481,'2026-11-06 17:30:10.000000',NULL,'Caleufú',12),(482,'2026-11-06 17:30:10.000000',NULL,'Catriló',12),(483,'2026-11-06 17:30:10.000000',NULL,'Colonia Barón',12),(484,'2026-11-06 17:30:10.000000',NULL,'Doblas',12),(485,'2026-11-06 17:30:10.000000',NULL,'Eduardo Castex',12),(486,'2026-11-06 17:30:10.000000',NULL,'General Acha',12),(487,'2026-11-06 17:30:10.000000',NULL,'General Pico',12),(488,'2026-11-06 17:30:10.000000',NULL,'Guatraché',12),(489,'2026-11-06 17:30:10.000000',NULL,'Ing. Luiggi',12),(490,'2026-11-06 17:30:10.000000',NULL,'Intendente Alvear',12),(491,'2026-11-06 17:30:10.000000',NULL,'Jacinto Arauz',12),(492,'2026-11-06 17:30:10.000000',NULL,'La Maruja',12),(493,'2026-11-06 17:30:10.000000',NULL,'La Reforma',12),(494,'2026-11-06 17:30:10.000000',NULL,'Limay Mahuida',12),(495,'2026-11-06 17:30:10.000000',NULL,'Lonquimay',12),(496,'2026-11-06 17:30:10.000000',NULL,'Macachín',12),(497,'2026-11-06 17:30:10.000000',NULL,'Miguel Riglos',12),(498,'2026-11-06 17:30:10.000000',NULL,'Parera',12),(499,'2026-11-06 17:30:10.000000',NULL,'Quemú Quemú',12),(500,'2026-11-06 17:30:10.000000',NULL,'Quetrequén',12),(501,'2026-11-06 17:30:10.000000',NULL,'Rancul',12),(502,'2026-11-06 17:30:10.000000',NULL,'Realicó',12),(503,'2026-11-06 17:30:10.000000',NULL,'San Martín',12),(504,'2026-11-06 17:30:10.000000',NULL,'Santa Rosa',12),(505,'2026-11-06 17:30:10.000000',NULL,'Toay',12),(506,'2026-11-06 17:30:10.000000',NULL,'Trebolares',12),(507,'2026-11-06 17:30:10.000000',NULL,'Veinticinco de Mayo',12),(508,'2026-11-06 17:30:10.000000',NULL,'Victorica',12),(509,'2026-11-06 17:30:10.000000',NULL,'Winifreda',12),(510,'2026-11-06 17:30:10.000000',NULL,'Arauco',13),(511,'2026-11-06 17:30:10.000000',NULL,'Capital',13),(512,'2026-11-06 17:30:10.000000',NULL,'Castro Barros',13),(513,'2026-11-06 17:30:10.000000',NULL,'Chamical',13),(514,'2026-11-06 17:30:10.000000',NULL,'Chilecito',13),(515,'2026-11-06 17:30:10.000000',NULL,'Coronel Felipe Varela',13),(516,'2026-11-06 17:30:10.000000',NULL,'Famatina',13),(517,'2026-11-06 17:30:10.000000',NULL,'General Ángel Vicente Peñaloza',13),(518,'2026-11-06 17:30:10.000000',NULL,'General Belgrano',13),(519,'2026-11-06 17:30:10.000000',NULL,'General Juan Facundo Quiroga',13),(520,'2026-11-06 17:30:10.000000',NULL,'General Lamadrid',13),(521,'2026-11-06 17:30:10.000000',NULL,'General Ocampo',13),(522,'2026-11-06 17:30:10.000000',NULL,'General San Martín',13),(523,'2026-11-06 17:30:10.000000',NULL,'Independencia',13),(524,'2026-11-06 17:30:10.000000',NULL,'Rosario Vera Peñaloza',13),(525,'2026-11-06 17:30:10.000000',NULL,'San Blas de los Sauces',13),(526,'2026-11-06 17:30:10.000000',NULL,'Sanagasta',13),(527,'2026-11-06 17:30:10.000000',NULL,'Vinchina',13),(528,'2026-11-06 17:30:10.000000',NULL,'Capital',14),(529,'2026-11-06 17:30:10.000000',NULL,'General Alvear',14),(530,'2026-11-06 17:30:10.000000',NULL,'Godoy Cruz',14),(531,'2026-11-06 17:30:10.000000',NULL,'Guaymallén',14),(532,'2026-11-06 17:30:10.000000',NULL,'Junín',14),(533,'2026-11-06 17:30:10.000000',NULL,'La Paz',14),(534,'2026-11-06 17:30:10.000000',NULL,'Las Heras',14),(535,'2026-11-06 17:30:10.000000',NULL,'Lavalle',14),(536,'2026-11-06 17:30:10.000000',NULL,'Luján de Cuyo',14),(537,'2026-11-06 17:30:10.000000',NULL,'Maipú',14),(538,'2026-11-06 17:30:10.000000',NULL,'Malargüe',14),(539,'2026-11-06 17:30:10.000000',NULL,'Rivadavia',14),(540,'2026-11-06 17:30:10.000000',NULL,'San Carlos',14),(541,'2026-11-06 17:30:10.000000',NULL,'San Martín',14),(542,'2026-11-06 17:30:10.000000',NULL,'San Rafael',14),(543,'2026-11-06 17:30:10.000000',NULL,'Santa Rosa',14),(544,'2026-11-06 17:30:10.000000',NULL,'Tunuyán',14),(545,'2026-11-06 17:30:10.000000',NULL,'Tupungato',14),(546,'2026-11-06 17:30:10.000000',NULL,'Apóstoles',15),(547,'2026-11-06 17:30:10.000000',NULL,'Aristóbulo del Valle',15),(548,'2026-11-06 17:30:10.000000',NULL,'Bernardo de Irigoyen',15),(549,'2026-11-06 17:30:10.000000',NULL,'Candelaria',15),(550,'2026-11-06 17:30:10.000000',NULL,'Concepción de la Sierra',15),(551,'2026-11-06 17:30:10.000000',NULL,'Eldorado',15),(552,'2026-11-06 17:30:10.000000',NULL,'Garupá',15),(553,'2026-11-06 17:30:10.000000',NULL,'Gobernador Roca',15),(554,'2026-11-06 17:30:10.000000',NULL,'Jardín América',15),(555,'2026-11-06 17:30:10.000000',NULL,'Leandro N. Alem',15),(556,'2026-11-06 17:30:10.000000',NULL,'Montecarlo',15),(557,'2026-11-06 17:30:10.000000',NULL,'Oberá',15),(558,'2026-11-06 17:30:10.000000',NULL,'Posadas',15),(559,'2026-11-06 17:30:10.000000',NULL,'Puerto Esperanza',15),(560,'2026-11-06 17:30:10.000000',NULL,'Puerto Iguazú',15),(561,'2026-11-06 17:30:10.000000',NULL,'Puerto Libertad',15),(562,'2026-11-06 17:30:10.000000',NULL,'Puerto Rico',15),(563,'2026-11-06 17:30:10.000000',NULL,'San Ignacio',15),(564,'2026-11-06 17:30:10.000000',NULL,'San Javier',15),(565,'2026-11-06 17:30:10.000000',NULL,'San Pedro',15),(566,'2026-11-06 17:30:10.000000',NULL,'San Vicente',15),(567,'2026-11-06 17:30:10.000000',NULL,'Santa Ana',15),(568,'2026-11-06 17:30:10.000000',NULL,'Santo Pipó',15),(569,'2026-11-06 17:30:10.000000',NULL,'Tres Capones',15),(570,'2026-11-06 17:30:10.000000',NULL,'Wanda',15),(571,'2026-11-06 17:30:10.000000',NULL,'Aluminé',16),(572,'2026-11-06 17:30:10.000000',NULL,'Andacollo',16),(573,'2026-11-06 17:30:10.000000',NULL,'Añelo',16),(574,'2026-11-06 17:30:10.000000',NULL,'Barda del Medio',16),(575,'2026-11-06 17:30:10.000000',NULL,'Buta Ranquil',16),(576,'2026-11-06 17:30:10.000000',NULL,'Centenario',16),(577,'2026-11-06 17:30:10.000000',NULL,'Chos Malal',16),(578,'2026-11-06 17:30:10.000000',NULL,'Cinco Saltos',16),(579,'2026-11-06 17:30:10.000000',NULL,'Cipolletti',16),(580,'2026-11-06 17:30:10.000000',NULL,'Cutral Có',16),(581,'2026-11-06 17:30:10.000000',NULL,'El Chocón',16),(582,'2026-11-06 17:30:10.000000',NULL,'El Huecú',16),(583,'2026-11-06 17:30:10.000000',NULL,'El Bolsón',16),(584,'2026-11-06 17:30:10.000000',NULL,'Junín de los Andes',16),(585,'2026-11-06 17:30:10.000000',NULL,'Las Lajas',16),(586,'2026-11-06 17:30:10.000000',NULL,'Las Ovejas',16),(587,'2026-11-06 17:30:10.000000',NULL,'Neuquén',16),(588,'2026-11-06 17:30:10.000000',NULL,'Paso Aguerre',16),(589,'2026-11-06 17:30:10.000000',NULL,'Picún Leufú',16),(590,'2026-11-06 17:30:10.000000',NULL,'Piedra del Águila',16),(591,'2026-11-06 17:30:10.000000',NULL,'Plaza Huincul',16),(592,'2026-11-06 17:30:10.000000',NULL,'Plottier',16),(593,'2026-11-06 17:30:10.000000',NULL,'Rincón de los Sauces',16),(594,'2026-11-06 17:30:10.000000',NULL,'San Martín de los Andes',16),(595,'2026-11-06 17:30:10.000000',NULL,'San Patricio del Chañar',16),(596,'2026-11-06 17:30:10.000000',NULL,'Senillosa',16),(597,'2026-11-06 17:30:10.000000',NULL,'Tierra del Fuego',16),(598,'2026-11-06 17:30:10.000000',NULL,'Tricao Malal',16),(599,'2026-11-06 17:30:10.000000',NULL,'Villa El Chocón',16),(600,'2026-11-06 17:30:10.000000',NULL,'Villa La Angostura',16),(601,'2026-11-06 17:30:10.000000',NULL,'Villa Pehuenia',16),(602,'2026-11-06 17:30:10.000000',NULL,'Villa Traful',16),(603,'2026-11-06 17:30:10.000000',NULL,'Zapala',16),(604,'2026-11-06 17:30:10.000000',NULL,'Allen',17),(605,'2026-11-06 17:30:10.000000',NULL,'Bariloche',17),(606,'2026-11-06 17:30:10.000000',NULL,'Campo Grande',17),(607,'2026-11-06 17:30:10.000000',NULL,'Catriel',17),(608,'2026-11-06 17:30:10.000000',NULL,'Cerro Policía',17),(609,'2026-11-06 17:30:10.000000',NULL,'Chichinales',17),(610,'2026-11-06 17:30:10.000000',NULL,'Chimpay',17),(611,'2026-11-06 17:30:10.000000',NULL,'Choele Choel',17),(612,'2026-11-06 17:30:10.000000',NULL,'Cinco Saltos',17),(613,'2026-11-06 17:30:10.000000',NULL,'Cipolletti',17),(614,'2026-11-06 17:30:10.000000',NULL,'Contralmirante Cordero',17),(615,'2026-11-06 17:30:10.000000',NULL,'Coronel Belisle',17),(616,'2026-11-06 17:30:10.000000',NULL,'Dina Huapi',17),(617,'2026-11-06 17:30:10.000000',NULL,'El Bolsón',17),(618,'2026-11-06 17:30:10.000000',NULL,'El Cuy',17),(619,'2026-11-06 17:30:10.000000',NULL,'General Conesa',17),(620,'2026-11-06 17:30:10.000000',NULL,'General Enrique Godoy',17),(621,'2026-11-06 17:30:10.000000',NULL,'General Fernández Oro',17),(622,'2026-11-06 17:30:10.000000',NULL,'General Roca',17),(623,'2026-11-06 17:30:10.000000',NULL,'Guardia Mitre',17),(624,'2026-11-06 17:30:10.000000',NULL,'Ingeniero Huergo',17),(625,'2026-11-06 17:30:10.000000',NULL,'Ingeniero Jacobacci',17),(626,'2026-11-06 17:30:10.000000',NULL,'Lamarque',17),(627,'2026-11-06 17:30:10.000000',NULL,'Las Grutas',17),(628,'2026-11-06 17:30:10.000000',NULL,'Los Menucos',17),(629,'2026-11-06 17:30:10.000000',NULL,'Luis Beltrán',17),(630,'2026-11-06 17:30:10.000000',NULL,'Mainqué',17),(631,'2026-11-06 17:30:10.000000',NULL,'Maquinchao',17),(632,'2026-11-06 17:30:10.000000',NULL,'Mencué',17),(633,'2026-11-06 17:30:10.000000',NULL,'Ñorquinco',17),(634,'2026-11-06 17:30:10.000000',NULL,'Pilcaniyeu',17),(635,'2026-11-06 17:30:10.000000',NULL,'Pomona',17),(636,'2026-11-06 17:30:10.000000',NULL,'Ramos Mexía',17),(637,'2026-11-06 17:30:10.000000',NULL,'Roca',17),(638,'2026-11-06 17:30:10.000000',NULL,'San Antonio Oeste',17),(639,'2026-11-06 17:30:10.000000',NULL,'Sierra Colorada',17),(640,'2026-11-06 17:30:10.000000',NULL,'Sierra Grande',17),(641,'2026-11-06 17:30:10.000000',NULL,'Sierra Pailemán',17),(642,'2026-11-06 17:30:10.000000',NULL,'Valcheta',17),(643,'2026-11-06 17:30:10.000000',NULL,'Viedma',17),(644,'2026-11-06 17:30:10.000000',NULL,'Villa Regina',17),(645,'2026-11-06 17:30:10.000000',NULL,'Aguaray',18),(646,'2026-11-06 17:30:10.000000',NULL,'Angastaco',18),(647,'2026-11-06 17:30:10.000000',NULL,'Cafayate',18),(648,'2026-11-06 17:30:10.000000',NULL,'Campo Quijano',18),(649,'2026-11-06 17:30:10.000000',NULL,'Campo Santo',18),(650,'2026-11-06 17:30:10.000000',NULL,'Cerrillos',18),(651,'2026-11-06 17:30:10.000000',NULL,'Chicoana',18),(652,'2026-11-06 17:30:10.000000',NULL,'Colonia Santa Rosa',18),(653,'2026-11-06 17:30:10.000000',NULL,'Coronel Moldes',18),(654,'2026-11-06 17:30:10.000000',NULL,'El Bordo',18),(655,'2026-11-06 17:30:10.000000',NULL,'El Carril',18),(656,'2026-11-06 17:30:10.000000',NULL,'El Galpón',18),(657,'2026-11-06 17:30:10.000000',NULL,'El Quebrachal',18),(658,'2026-11-06 17:30:10.000000',NULL,'El Tala',18),(659,'2026-11-06 17:30:10.000000',NULL,'Enrique Mosconi',18),(660,'2026-11-06 17:30:10.000000',NULL,'General Ballivián',18),(661,'2026-11-06 17:30:10.000000',NULL,'General Güemes',18),(662,'2026-11-06 17:30:10.000000',NULL,'General Mosconi',18),(663,'2026-11-06 17:30:10.000000',NULL,'Hipólito Yrigoyen',18),(664,'2026-11-06 17:30:10.000000',NULL,'Iruya',18),(665,'2026-11-06 17:30:10.000000',NULL,'Joaquín V. González',18),(666,'2026-11-06 17:30:10.000000',NULL,'La Caldera',18),(667,'2026-11-06 17:30:10.000000',NULL,'La Candelaria',18),(668,'2026-11-06 17:30:10.000000',NULL,'La Merced',18),(669,'2026-11-06 17:30:10.000000',NULL,'Las Lajitas',18),(670,'2026-11-06 17:30:10.000000',NULL,'Metán',18),(671,'2026-11-06 17:30:10.000000',NULL,'Molinos',18),(672,'2026-11-06 17:30:10.000000',NULL,'Orán',18),(673,'2026-11-06 17:30:10.000000',NULL,'Pichanal',18),(674,'2026-11-06 17:30:10.000000',NULL,'Rivadavia',18),(675,'2026-11-06 17:30:10.000000',NULL,'Rosario de la Frontera',18),(676,'2026-11-06 17:30:10.000000',NULL,'Rosario de Lerma',18),(677,'2026-11-06 17:30:10.000000',NULL,'Salta',18),(678,'2026-11-06 17:30:10.000000',NULL,'San Antonio de los Cobres',18),(679,'2026-11-06 17:30:10.000000',NULL,'San Carlos',18),(680,'2026-11-06 17:30:10.000000',NULL,'San José de Metán',18),(681,'2026-11-06 17:30:10.000000',NULL,'San Ramón de la Nueva Orán',18),(682,'2026-11-06 17:30:10.000000',NULL,'Santa Victoria Este',18),(683,'2026-11-06 17:30:10.000000',NULL,'Seclantás',18),(684,'2026-11-06 17:30:10.000000',NULL,'Tartagal',18),(685,'2026-11-06 17:30:10.000000',NULL,'Urundel',18),(686,'2026-11-06 17:30:10.000000',NULL,'Albardón',19),(687,'2026-11-06 17:30:10.000000',NULL,'Angaco',19),(688,'2026-11-06 17:30:10.000000',NULL,'Calingasta',19),(689,'2026-11-06 17:30:10.000000',NULL,'Capital',19),(690,'2026-11-06 17:30:10.000000',NULL,'Caucete',19),(691,'2026-11-06 17:30:10.000000',NULL,'Chimbas',19),(692,'2026-11-06 17:30:10.000000',NULL,'Jáchal',19),(693,'2026-11-06 17:30:10.000000',NULL,'Nueve de Julio',19),(694,'2026-11-06 17:30:10.000000',NULL,'Pocito',19),(695,'2026-11-06 17:30:10.000000',NULL,'Rawson',19),(696,'2026-11-06 17:30:10.000000',NULL,'Rivadavia',19),(697,'2026-11-06 17:30:10.000000',NULL,'San Martín',19),(698,'2026-11-06 17:30:10.000000',NULL,'Santa Lucía',19),(699,'2026-11-06 17:30:10.000000',NULL,'Sarmiento',19),(700,'2026-11-06 17:30:10.000000',NULL,'Ullum',19),(701,'2026-11-06 17:30:10.000000',NULL,'Valle Fértil',19),(702,'2026-11-06 17:30:10.000000',NULL,'Veinticinco de Mayo',19),(703,'2026-11-06 17:30:10.000000',NULL,'Zonda',19),(704,'2026-11-06 17:30:10.000000',NULL,'Anchorena',20),(705,'2026-11-06 17:30:10.000000',NULL,'Buena Esperanza',20),(706,'2026-11-06 17:30:10.000000',NULL,'Candelaria',20),(707,'2026-11-06 17:30:10.000000',NULL,'Concarán',20),(708,'2026-11-06 17:30:10.000000',NULL,'Cortaderas',20),(709,'2026-11-06 17:30:10.000000',NULL,'El Trapiche',20),(710,'2026-11-06 17:30:10.000000',NULL,'Fortín El Patria',20),(711,'2026-11-06 17:30:10.000000',NULL,'Juana Koslay',20),(712,'2026-11-06 17:30:10.000000',NULL,'Justo Daract',20),(713,'2026-11-06 17:30:10.000000',NULL,'La Punta',20),(714,'2026-11-06 17:30:10.000000',NULL,'Lafinur',20),(715,'2026-11-06 17:30:10.000000',NULL,'Las Aguadas',20),(716,'2026-11-06 17:30:10.000000',NULL,'Los Molles',20),(717,'2026-11-06 17:30:10.000000',NULL,'Luján',20),(718,'2026-11-06 17:30:10.000000',NULL,'Merlo',20),(719,'2026-11-06 17:30:10.000000',NULL,'Naschel',20),(720,'2026-11-06 17:30:10.000000',NULL,'Nueva Galia',20),(721,'2026-11-06 17:30:10.000000',NULL,'Renca',20),(722,'2026-11-06 17:30:10.000000',NULL,'San Francisco',20),(723,'2026-11-06 17:30:10.000000',NULL,'San Luis',20),(724,'2026-11-06 17:30:10.000000',NULL,'Santa Rosa del Conlara',20),(725,'2026-11-06 17:30:10.000000',NULL,'Tilisarao',20),(726,'2026-11-06 17:30:10.000000',NULL,'Unión',20),(727,'2026-11-06 17:30:10.000000',NULL,'Villa de la Quebrada',20),(728,'2026-11-06 17:30:10.000000',NULL,'Villa de Merlo',20),(729,'2026-11-06 17:30:10.000000',NULL,'Villa Mercedes',20),(730,'2026-11-06 17:30:10.000000',NULL,'Caleta Olivia',21),(731,'2026-11-06 17:30:10.000000',NULL,'Cañadón Seco',21),(732,'2026-11-06 17:30:10.000000',NULL,'Comandante Luis Piedra Buena',21),(733,'2026-11-06 17:30:10.000000',NULL,'El Calafate',21),(734,'2026-11-06 17:30:10.000000',NULL,'El Chaltén',21),(735,'2026-11-06 17:30:10.000000',NULL,'Esperanza',21),(736,'2026-11-06 17:30:10.000000',NULL,'Gobernador Gregores',21),(737,'2026-11-06 17:30:10.000000',NULL,'Jaramillo',21),(738,'2026-11-06 17:30:10.000000',NULL,'Koluel Kaike',21),(739,'2026-11-06 17:30:10.000000',NULL,'Las Heras',21),(740,'2026-11-06 17:30:10.000000',NULL,'Los Antiguos',21),(741,'2026-11-06 17:30:10.000000',NULL,'Perito Moreno',21),(742,'2026-11-06 17:30:10.000000',NULL,'Pico Truncado',21),(743,'2026-11-06 17:30:10.000000',NULL,'Puerto Deseado',21),(744,'2026-11-06 17:30:10.000000',NULL,'Puerto San Julián',21),(745,'2026-11-06 17:30:10.000000',NULL,'Puerto Santa Cruz',21),(746,'2026-11-06 17:30:10.000000',NULL,'Río Gallegos',21),(747,'2026-11-06 17:30:10.000000',NULL,'Río Turbio',21),(748,'2026-11-06 17:30:10.000000',NULL,'Tres Lagos',21),(749,'2026-11-06 17:30:10.000000',NULL,'Veintiocho de Noviembre',21),(750,'2026-11-06 17:30:10.000000',NULL,'Arocena',22),(751,'2026-11-06 17:30:10.000000',NULL,'Arroyo Seco',22),(752,'2026-11-06 17:30:10.000000',NULL,'Avellaneda',22),(753,'2026-11-06 17:30:10.000000',NULL,'Barrancas',22),(754,'2026-11-06 17:30:10.000000',NULL,'Cañada de Gómez',22),(755,'2026-11-06 17:30:10.000000',NULL,'Cañada Rosquín',22),(756,'2026-11-06 17:30:10.000000',NULL,'Capital',22),(757,'2026-11-06 17:30:10.000000',NULL,'Casilda',22),(758,'2026-11-06 17:30:10.000000',NULL,'Ceres',22),(759,'2026-11-06 17:30:10.000000',NULL,'Coronda',22),(760,'2026-11-06 17:30:10.000000',NULL,'El Trébol',22),(761,'2026-11-06 17:30:10.000000',NULL,'Esperanza',22),(762,'2026-11-06 17:30:10.000000',NULL,'Funes',22),(763,'2026-11-06 17:30:10.000000',NULL,'Gálvez',22),(764,'2026-11-06 17:30:10.000000',NULL,'Granadero Baigorria',22),(765,'2026-11-06 17:30:10.000000',NULL,'Helvecia',22),(766,'2026-11-06 17:30:10.000000',NULL,'Las Parejas',22),(767,'2026-11-06 17:30:10.000000',NULL,'Las Rosas',22),(768,'2026-11-06 17:30:10.000000',NULL,'Margarita',22),(769,'2026-11-06 17:30:10.000000',NULL,'Melincué',22),(770,'2026-11-06 17:30:10.000000',NULL,'Rafaela',22),(771,'2026-11-06 17:30:10.000000',NULL,'Reconquista',22),(772,'2026-11-06 17:30:10.000000',NULL,'Roldán',22),(773,'2026-11-06 17:30:10.000000',NULL,'Rosario',22),(774,'2026-11-06 17:30:10.000000',NULL,'San Carlos Centro',22),(775,'2026-11-06 17:30:10.000000',NULL,'San Cristóbal',22),(776,'2026-11-06 17:30:10.000000',NULL,'San Genaro',22),(777,'2026-11-06 17:30:10.000000',NULL,'San Javier',22),(778,'2026-11-06 17:30:10.000000',NULL,'San Jorge',22),(779,'2026-11-06 17:30:10.000000',NULL,'San Justo',22),(780,'2026-11-06 17:30:10.000000',NULL,'San Lorenzo',22),(781,'2026-11-06 17:30:10.000000',NULL,'San Vicente',22),(782,'2026-11-06 17:30:10.000000',NULL,'Santa Fe',22),(783,'2026-11-06 17:30:10.000000',NULL,'Santo Tomé',22),(784,'2026-11-06 17:30:10.000000',NULL,'Sunchales',22),(785,'2026-11-06 17:30:10.000000',NULL,'Totoras',22),(786,'2026-11-06 17:30:10.000000',NULL,'Venado Tuerto',22),(787,'2026-11-06 17:30:10.000000',NULL,'Vera',22),(788,'2026-11-06 17:30:10.000000',NULL,'Villa Cañás',22),(789,'2026-11-06 17:30:10.000000',NULL,'Villa Constitución',22),(790,'2026-11-06 17:30:10.000000',NULL,'Añatuya',23),(791,'2026-11-06 17:30:10.000000',NULL,'Bandera',23),(792,'2026-11-06 17:30:10.000000',NULL,'Beltrán',23),(793,'2026-11-06 17:30:10.000000',NULL,'Campo Gallo',23),(794,'2026-11-06 17:30:10.000000',NULL,'Clodomira',23),(795,'2026-11-06 17:30:10.000000',NULL,'Fernández',23),(796,'2026-11-06 17:30:10.000000',NULL,'Frías',23),(797,'2026-11-06 17:30:10.000000',NULL,'La Banda',23),(798,'2026-11-06 17:30:10.000000',NULL,'Las Termas de Río Hondo',23),(799,'2026-11-06 17:30:10.000000',NULL,'Loreto',23),(800,'2026-11-06 17:30:10.000000',NULL,'Monte Quemado',23),(801,'2026-11-06 17:30:10.000000',NULL,'Nueva Esperanza',23),(802,'2026-11-06 17:30:10.000000',NULL,'Pinto',23),(803,'2026-11-06 17:30:10.000000',NULL,'Quimilí',23),(804,'2026-11-06 17:30:10.000000',NULL,'San Pedro de Guasayán',23),(805,'2026-11-06 17:30:10.000000',NULL,'San Ramón',23),(806,'2026-11-06 17:30:10.000000',NULL,'Santiago del Estero',23),(807,'2026-11-06 17:30:10.000000',NULL,'Silipica',23),(808,'2026-11-06 17:30:10.000000',NULL,'Suncho Corral',23),(809,'2026-11-06 17:30:10.000000',NULL,'Villa Atamisqui',23),(810,'2026-11-06 17:30:10.000000',NULL,'Villa Ojo de Agua',23),(811,'2026-11-06 17:30:10.000000',NULL,'Río Grande',24),(812,'2026-11-06 17:30:10.000000',NULL,'Tolhuin',24),(813,'2026-11-06 17:30:10.000000',NULL,'Ushuaia',24),(814,'2026-11-06 17:30:10.000000',NULL,'Aguilares',25),(815,'2026-11-06 17:30:10.000000',NULL,'Alderetes',25),(816,'2026-11-06 17:30:10.000000',NULL,'Banda del Río Salí',25),(817,'2026-11-06 17:30:10.000000',NULL,'Bella Vista',25),(818,'2026-11-06 17:30:10.000000',NULL,'Burruyacú',25),(819,'2026-11-06 17:30:10.000000',NULL,'Concepción',25),(820,'2026-11-06 17:30:10.000000',NULL,'Famaillá',25),(821,'2026-11-06 17:30:10.000000',NULL,'Juan Bautista Alberdi',25),(822,'2026-11-06 17:30:10.000000',NULL,'La Cocha',25),(823,'2026-11-06 17:30:10.000000',NULL,'Lamadrid',25),(824,'2026-11-06 17:30:10.000000',NULL,'Las Talitas',25),(825,'2026-11-06 17:30:10.000000',NULL,'Lules',25),(826,'2026-11-06 17:30:10.000000',NULL,'Monteros',25),(827,'2026-11-06 17:30:10.000000',NULL,'Río Seco',25),(828,'2026-11-06 17:30:10.000000',NULL,'San Miguel de Tucumán',25),(829,'2026-11-06 17:30:10.000000',NULL,'Simoca',25),(830,'2026-11-06 17:30:10.000000',NULL,'Tafí del Valle',25),(831,'2026-11-06 17:30:10.000000',NULL,'Tafí Viejo',25),(832,'2026-11-06 17:30:10.000000',NULL,'Trancas',25),(833,'2026-11-06 17:30:10.000000',NULL,'Villa Alberdi',25),(834,'2026-11-06 17:30:10.000000',NULL,'Villa Belgrano',25),(835,'2026-11-06 17:30:10.000000',NULL,'Yerba Buena',25),(836,'2026-11-06 17:30:10.000000',NULL,'Yerba Buena (S)',25);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKo1gcd4ei09bnb1pth8ecrui2w` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar_caracteristica` (
  `lugar_id` bigint NOT NULL,
  `caracteristica_id` bigint NOT NULL,
  KEY `FKkt5rp2cd7r8gebb1vlutacx5q` (`caracteristica_id`),
  KEY `FKo5ndr9pxdoa1loanawiuyupv8` (`lugar_id`),
  CONSTRAINT `FKkt5rp2cd7r8gebb1vlutacx5q` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`),
  CONSTRAINT `FKo5ndr9pxdoa1loanawiuyupv8` FOREIGN KEY (`lugar_id`) REFERENCES `lugares` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `lugar_caracteristica` VALUES (1,1),(1,2);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar_caracteristica_aud` (
  `rev` int NOT NULL,
  `lugar_id` bigint NOT NULL,
  `caracteristica_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`lugar_id`,`rev`,`caracteristica_id`),
  KEY `FK1w4hrujbhoj0qa7rs9fidaqq3` (`rev`),
  CONSTRAINT `FK1w4hrujbhoj0qa7rs9fidaqq3` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar_evento_soportado_aud` (
  `rev` int NOT NULL,
  `lugar_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`lugar_id`,`rev`,`id`),
  KEY `FKsiajlbdk9e48scqjkf544jb5g` (`rev`),
  CONSTRAINT `FKsiajlbdk9e48scqjkf544jb5g` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar_imagen_aud` (
  `rev` int NOT NULL,
  `lugar_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`lugar_id`,`rev`,`id`),
  KEY `FKsnkmbrt9xc66weiqhtqaujo55` (`rev`),
  CONSTRAINT `FKsnkmbrt9xc66weiqhtqaujo55` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar_lugar_precio_aud` (
  `rev` int NOT NULL,
  `lugar_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`lugar_id`,`rev`,`id`),
  KEY `FKfttiilr3nwftm8dolu9xe8o10` (`rev`),
  CONSTRAINT `FKfttiilr3nwftm8dolu9xe8o10` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar_precio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_desde` datetime(6) NOT NULL,
  `fecha_hasta` datetime(6) DEFAULT NULL,
  `precio` float NOT NULL,
  `lugar_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoerio5kt1rw5tw04h9x8nek4t` (`lugar_id`),
  CONSTRAINT `FKoerio5kt1rw5tw04h9x8nek4t` FOREIGN KEY (`lugar_id`) REFERENCES `lugares` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `lugar_precio` VALUES (1,'2026-11-06 17:30:10.000000',NULL,2000,1),(2,'2026-11-06 17:30:10.000000',NULL,2300,2),(3,'2026-11-06 17:30:10.000000',NULL,2500,3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar_precio_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_desde` datetime(6) DEFAULT NULL,
  `fecha_hasta` datetime(6) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKd6m54xh4npb2ofon3mcup4nqd` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar_reseña_aud` (
  `rev` int NOT NULL,
  `lugar_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`lugar_id`,`rev`,`id`),
  KEY `FK6ihblfqn4reyrja0fyyqahctq` (`rev`),
  CONSTRAINT `FK6ihblfqn4reyrja0fyyqahctq` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `lugar_reseña_aud` VALUES (417,1,9,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar_servicio_soportado_aud` (
  `rev` int NOT NULL,
  `lugar_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`lugar_id`,`rev`,`id`),
  KEY `FKp82fo421yti53fjo5stjo0alq` (`rev`),
  CONSTRAINT `FKp82fo421yti53fjo5stjo0alq` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugares` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `capacidad_personas` int DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `localidad_id` bigint NOT NULL,
  `propietario_id` bigint NOT NULL,
  `tipo_lugar_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmpr2xdcfkk4scnxwau0nmbpdw` (`localidad_id`),
  KEY `FK1kshbyc9sk1vut2i16380vxm8` (`propietario_id`),
  KEY `FKqb0jhuotsluf2wqnmcbl6acm1` (`tipo_lugar_id`),
  CONSTRAINT `FK1kshbyc9sk1vut2i16380vxm8` FOREIGN KEY (`propietario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKmpr2xdcfkk4scnxwau0nmbpdw` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`id`),
  CONSTRAINT `FKqb0jhuotsluf2wqnmcbl6acm1` FOREIGN KEY (`tipo_lugar_id`) REFERENCES `tipos_de_lugares` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `lugares` VALUES (1,200,'lugar ideal para realizar una fiesta a lo grande!','Av. San Martin 3453','2026-11-06 17:30:10.000000',NULL,'Quincho Silva',1,3,1),(2,300,'lugar ideal para realizar una fiesta a lo grande!','Av. San Martin 3453','2026-11-06 17:30:10.000000',NULL,'Bodega Silva',1,3,2),(3,200,'lugar ideal para realizar una fiesta a lo grande!','Av. San Martin 3453','2026-11-06 17:30:10.000000',NULL,'Hotel Silva',1,3,3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugares_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `capacidad_personas` int DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `localidad_id` bigint DEFAULT NULL,
  `propietario_id` bigint DEFAULT NULL,
  `tipo_lugar_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKph060ni6sylrp6g7bn7ljwg7l` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `lugares_aud` VALUES (1,417,1,200,'lugar ideal para realizar una fiesta a lo grande!','Av. San Martin 3453','2026-11-06 17:30:10.000000',NULL,'Quincho Silva',1,3,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios_de_pago` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `es_visible` bit(1) NOT NULL,
  `estado` enum('ACTIVO','INACTIVO','MANTENIMIENTO') DEFAULT NULL,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `fecha_hora_modificacion` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `maximo` decimal(38,2) DEFAULT NULL,
  `minimo` decimal(38,2) DEFAULT NULL,
  `tiempo_acreditacion` int DEFAULT NULL,
  `tipo` enum('BILLETERA_DIGITAL','EFECTIVO','TARJETA_CREDITO','TARJETA_DEBITO','TARJETA_PREPAGA','TRANSFERENCIA') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_p77nftt172lkm3p30gpxv9xhd` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `medios_de_pago` VALUES (1,'diners',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.860120','Diners',15000000.00,15.00,2880,'TARJETA_CREDITO'),(2,'mercadopago_cc',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.873581','Mercado Pago + Banco Patagonia',1500000.00,0.00,0,'TARJETA_CREDITO'),(3,'debvisa',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.904717','Visa Débito',15000000.00,3.00,2880,'TARJETA_DEBITO'),(4,'visa',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.840623','Visa',15000000.00,3.00,2880,'TARJETA_CREDITO'),(5,'amex',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.886766','American Express',15000000.00,3.00,2880,'TARJETA_CREDITO'),(6,'argencard',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.852686','Argencard',15000000.00,15.00,2880,'TARJETA_CREDITO'),(7,'master',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.845943','Mastercard',15000000.00,3.00,2880,'TARJETA_PREPAGA'),(8,'maestro',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.835393','Maestro',15000000.00,3.00,1440,'TARJETA_DEBITO'),(9,'cabal',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.857036','Cabal',15000000.00,15.00,2880,'TARJETA_PREPAGA'),(10,'debin_transfer',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.892338','DEBIN',10000000.00,1.00,0,'TRANSFERENCIA'),(11,'sol',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.868547','Sol',5000000.00,15.00,2880,'TARJETA_CREDITO'),(12,'debcabal',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.808523','Cabal Débito',15000000.00,3.00,1440,'TARJETA_DEBITO'),(13,'debmaster',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.879383','Mastercard Débito',15000000.00,3.00,1440,'TARJETA_DEBITO'),(14,'naranja',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.813824','Naranja',15000000.00,15.00,2880,'TARJETA_CREDITO'),(15,'pagofacil',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.960556','Pago Fácil',1000000.00,50.00,0,'EFECTIVO'),(16,'rapipago',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.985317','Rapipago',1000000.00,50.00,0,'EFECTIVO'),(17,'cobroexpress',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.928556','Cobro Express',200000.00,50.00,0,'EFECTIVO'),(18,'ultra',_binary '','INACTIVO','2026-11-06 17:41:04.999952',NULL,'2026-11-06 17:54:07.791871','ULTRA',700000.00,0.00,0,'TARJETA_CREDITO'),(19,'favacard',_binary '','INACTIVO','2026-11-06 17:41:04.999952',NULL,'2026-11-06 17:54:07.802243','Favacard',700000.00,0.00,0,'TARJETA_CREDITO');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios_de_pago_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `es_visible` bit(1) DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO','MANTENIMIENTO') DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `fecha_hora_modificacion` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `maximo` decimal(38,2) DEFAULT NULL,
  `minimo` decimal(38,2) DEFAULT NULL,
  `tiempo_acreditacion` int DEFAULT NULL,
  `tipo` enum('BILLETERA_DIGITAL','EFECTIVO','TARJETA_CREDITO','TARJETA_DEBITO','TARJETA_PREPAGA','TRANSFERENCIA') DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKhmhf3t0d23d1eumrd41r2hb3h` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `medios_de_pago_aud` VALUES (1,314,1,'diners',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.085048','Diners',15000000.00,15.00,2880,'TARJETA_CREDITO'),(2,314,1,'mercadopago_cc',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.052249','Mercado Pago + Banco Patagonia',1500000.00,0.00,0,'TARJETA_CREDITO'),(3,314,1,'debvisa',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.056788','Visa Débito',15000000.00,3.00,2880,'TARJETA_DEBITO'),(4,314,1,'visa',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.088567','Visa Prepaid',15000000.00,1.00,2880,'TARJETA_CREDITO'),(5,314,1,'amex',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.081042','American Express',15000000.00,3.00,2880,'TARJETA_CREDITO'),(6,314,1,'argencard',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.021566','Argencard',15000000.00,15.00,2880,'TARJETA_CREDITO'),(7,314,1,'master',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.042812','Mastercard',15000000.00,3.00,2880,'TARJETA_PREPAGA'),(8,314,1,'maestro',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.039248','Maestro',15000000.00,3.00,1440,'TARJETA_DEBITO'),(9,314,1,'cabal',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.071851','Cabal',15000000.00,1.00,0,'TARJETA_PREPAGA'),(10,314,1,'debin_transfer',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.064253','DEBIN',10000000.00,1.00,0,'TRANSFERENCIA'),(11,314,1,'sol',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.067680','Sol',5000000.00,15.00,2880,'TARJETA_CREDITO'),(12,314,1,'debcabal',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.075375','Cabal Débito',15000000.00,3.00,1440,'TARJETA_DEBITO'),(13,314,1,'debmaster',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.034632','Mastercard Débito',15000000.00,3.00,1440,'TARJETA_DEBITO'),(14,314,1,'naranja',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.016563','Naranja',15000000.00,15.00,2880,'TARJETA_CREDITO'),(15,314,1,'pagofacil',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.096574','Pago Fácil',1000000.00,50.00,0,'EFECTIVO'),(16,314,1,'rapipago',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.102794','Rapipago',1000000.00,50.00,0,'EFECTIVO'),(17,314,1,'cobroexpress',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:41:05.108124','Cobro Express',200000.00,50.00,0,'EFECTIVO'),(18,314,0,'ultra',_binary '','INACTIVO','2026-11-06 17:41:04.999952',NULL,NULL,'ULTRA',700000.00,0.00,0,'TARJETA_CREDITO'),(19,314,0,'favacard',_binary '','INACTIVO','2026-11-06 17:41:04.999952',NULL,NULL,'Favacard',700000.00,0.00,0,'TARJETA_CREDITO'),(1,345,1,'diners',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.860120','Diners',15000000.00,15.00,2880,'TARJETA_CREDITO'),(2,345,1,'mercadopago_cc',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.873581','Mercado Pago + Banco Patagonia',1500000.00,0.00,0,'TARJETA_CREDITO'),(3,345,1,'debvisa',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.904717','Visa Débito',15000000.00,3.00,2880,'TARJETA_DEBITO'),(4,345,1,'visa',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.840623','Visa',15000000.00,3.00,2880,'TARJETA_CREDITO'),(5,345,1,'amex',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.886766','American Express',15000000.00,3.00,2880,'TARJETA_CREDITO'),(6,345,1,'argencard',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.852686','Argencard',15000000.00,15.00,2880,'TARJETA_CREDITO'),(7,345,1,'master',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.845943','Mastercard',15000000.00,3.00,2880,'TARJETA_PREPAGA'),(8,345,1,'maestro',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.835393','Maestro',15000000.00,3.00,1440,'TARJETA_DEBITO'),(9,345,1,'cabal',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.857036','Cabal',15000000.00,15.00,2880,'TARJETA_PREPAGA'),(10,345,1,'debin_transfer',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.892338','DEBIN',10000000.00,1.00,0,'TRANSFERENCIA'),(11,345,1,'sol',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.868547','Sol',5000000.00,15.00,2880,'TARJETA_CREDITO'),(12,345,1,'debcabal',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.808523','Cabal Débito',15000000.00,3.00,1440,'TARJETA_DEBITO'),(13,345,1,'debmaster',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.879383','Mastercard Débito',15000000.00,3.00,1440,'TARJETA_DEBITO'),(14,345,1,'naranja',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.813824','Naranja',15000000.00,15.00,2880,'TARJETA_CREDITO'),(15,345,1,'pagofacil',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.960556','Pago Fácil',1000000.00,50.00,0,'EFECTIVO'),(16,345,1,'rapipago',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.985317','Rapipago',1000000.00,50.00,0,'EFECTIVO'),(17,345,1,'cobroexpress',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2026-11-06 17:54:07.928556','Cobro Express',200000.00,50.00,0,'EFECTIVO'),(18,345,1,'ultra',_binary '','INACTIVO','2026-11-06 17:41:04.999952',NULL,'2026-11-06 17:54:07.791871','ULTRA',700000.00,0.00,0,'TARJETA_CREDITO'),(19,345,1,'favacard',_binary '','INACTIVO','2026-11-06 17:41:04.999952',NULL,'2026-11-06 17:54:07.802243','Favacard',700000.00,0.00,0,'TARJETA_CREDITO');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime(6) NOT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `usuario_id` bigint NOT NULL,
  `chat_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk3fkiphgt1u3m0klf763x4hdy` (`usuario_id`),
  KEY `FKfopex7lvlrxit1yp536w43hdf` (`chat_id`),
  CONSTRAINT `FKfopex7lvlrxit1yp536w43hdf` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`),
  CONSTRAINT `FKk3fkiphgt1u3m0klf763x4hdy` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `mensajes` VALUES (1,'2026-11-06 17:46:36.975101','hola',5,3),(2,'2026-11-06 17:46:43.015326','hola',2,3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora` datetime(6) DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKr65jb6vkp4nmltsgnhy91nlmk` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `mensajes_aud` VALUES (1,330,0,'2026-11-06 17:46:36.975101','hola',5),(2,333,0,'2026-11-06 17:46:43.015326','hola',2);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metricas_actividad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad_ingresos` int DEFAULT NULL,
  `fecha_ingreso` datetime(6) DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKomr2yd35elo5fxmfmlkcb0yrl` (`usuario_id`),
  CONSTRAINT `FKomr2yd35elo5fxmfmlkcb0yrl` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `metricas_actividad` VALUES (1,3,'2026-11-06 17:37:59.315000',5),(2,2,'2026-11-06 17:40:58.616000',99),(3,1,'2026-11-06 17:45:29.880000',2),(4,1,'2026-11-18 12:17:10.972000',1),(5,2,'2026-11-18 18:57:50.258000',99);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metricas_actividad_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `cantidad_ingresos` int DEFAULT NULL,
  `fecha_ingreso` datetime(6) DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKinh1hvaagnihf5yqq618wrl6l` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `metricas_actividad_aud` VALUES (1,302,0,1,'2026-11-06 17:37:59.315000',5),(2,313,0,1,'2026-11-06 17:40:58.616000',99),(1,315,1,2,'2026-11-06 17:37:59.315000',5),(3,324,0,1,'2026-11-06 17:45:29.880000',2),(2,344,1,2,'2026-11-06 17:40:58.616000',99),(1,347,1,3,'2026-11-06 17:37:59.315000',5),(4,406,0,1,'2026-11-18 12:17:10.972000',1),(5,431,0,1,'2026-11-18 18:57:50.258000',99),(5,452,1,2,'2026-11-18 18:57:50.258000',99);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metricas_vistas_lugar` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad_vistas` int DEFAULT NULL,
  `fecha_vista` datetime(6) DEFAULT NULL,
  `lugar_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKto55d4v8s04rd4idgcagpwolw` (`lugar_id`),
  CONSTRAINT `FKto55d4v8s04rd4idgcagpwolw` FOREIGN KEY (`lugar_id`) REFERENCES `lugares` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `metricas_vistas_lugar` VALUES (1,8,'2026-11-06 17:38:28.098000',1),(2,2,'2026-11-06 17:39:53.927000',2),(3,2,'2026-11-06 17:41:55.118000',3),(4,17,'2026-11-18 12:18:10.575000',1),(5,2,'2026-11-18 12:18:19.064000',2),(6,2,'2026-11-18 12:18:25.774000',3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metricas_vistas_lugar_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `cantidad_vistas` int DEFAULT NULL,
  `fecha_vista` datetime(6) DEFAULT NULL,
  `lugar_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK7fdiw4plvl64q08bs1roy4kty` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `metricas_vistas_lugar_aud` VALUES (1,304,0,1,'2026-11-06 17:38:28.098000',1),(1,305,1,2,'2026-11-06 17:38:28.098000',1),(1,306,1,3,'2026-11-06 17:38:28.098000',1),(1,307,1,4,'2026-11-06 17:38:28.098000',1),(2,308,0,1,'2026-11-06 17:39:53.927000',2),(2,309,1,2,'2026-11-06 17:39:53.927000',2),(3,316,0,1,'2026-11-06 17:41:55.118000',3),(3,317,1,2,'2026-11-06 17:41:55.118000',3),(1,319,1,5,'2026-11-06 17:38:28.098000',1),(1,320,1,6,'2026-11-06 17:38:28.098000',1),(1,340,1,7,'2026-11-06 17:38:28.098000',1),(1,341,1,8,'2026-11-06 17:38:28.098000',1),(4,408,0,1,'2026-11-18 12:18:10.575000',1),(4,409,1,2,'2026-11-18 12:18:10.575000',1),(5,410,0,1,'2026-11-18 12:18:19.064000',2),(5,411,1,2,'2026-11-18 12:18:19.064000',2),(6,412,0,1,'2026-11-18 12:18:25.774000',3),(6,413,1,2,'2026-11-18 12:18:25.774000',3),(4,414,1,3,'2026-11-18 12:18:10.575000',1),(4,415,1,4,'2026-11-18 12:18:10.575000',1),(4,418,1,5,'2026-11-18 12:18:10.575000',1),(4,419,1,6,'2026-11-18 12:18:10.575000',1),(4,420,1,7,'2026-11-18 12:18:10.575000',1),(4,421,1,8,'2026-11-18 12:18:10.575000',1),(4,422,1,9,'2026-11-18 12:18:10.575000',1),(4,423,1,10,'2026-11-18 12:18:10.575000',1),(4,424,1,11,'2026-11-18 12:18:10.575000',1),(4,425,1,12,'2026-11-18 12:18:10.575000',1),(4,426,1,13,'2026-11-18 12:18:10.575000',1),(4,427,1,14,'2026-11-18 12:18:10.575000',1),(4,428,1,15,'2026-11-18 12:18:10.575000',1),(4,429,1,16,'2026-11-18 12:18:10.575000',1),(4,430,1,17,'2026-11-18 12:18:10.575000',1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metricas_vistas_servicio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad_vistas` int DEFAULT NULL,
  `fecha_vista` datetime(6) DEFAULT NULL,
  `servicio_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3lmev0iou4art24fn5iaxwt4s` (`servicio_id`),
  CONSTRAINT `FK3lmev0iou4art24fn5iaxwt4s` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `metricas_vistas_servicio` VALUES (1,2,'2026-11-06 17:45:46.799000',1),(2,2,'2026-11-06 18:11:46.248000',2);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metricas_vistas_servicio_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `cantidad_vistas` int DEFAULT NULL,
  `fecha_vista` datetime(6) DEFAULT NULL,
  `servicio_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKb1b1ltcxed119q8kj91gm49x2` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `metricas_vistas_servicio_aud` VALUES (1,325,0,1,'2026-11-06 17:45:46.799000',1),(1,326,1,2,'2026-11-06 17:45:46.799000',1),(2,351,0,1,'2026-11-06 18:11:46.248000',2),(2,352,1,2,'2026-11-06 18:11:46.248000',2);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `leida` bit(1) NOT NULL,
  `resumen` varchar(500) DEFAULT NULL,
  `tipo_notificacion` enum('Alerta','Mensaje','Propuesta','Recordatorio') DEFAULT NULL,
  `titulo` varchar(255) NOT NULL,
  `url_referencia` varchar(255) DEFAULT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_usuario_fecha` (`usuario_id`,`fecha_hora_alta` DESC),
  KEY `idx_usuario_leida` (`usuario_id`,`leida`),
  CONSTRAINT `FK1mxbjb81ft61gwlh0kabubndc` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `notificaciones` VALUES (1,'2026-11-06 17:46:37.001110',NULL,_binary '','hola','Mensaje','Nuevo mensaje de alejandro arce','/chatear?id=3',2),(2,'2026-11-06 17:46:43.027778',NULL,_binary '','hola','Mensaje','Nuevo mensaje de cristian rosales','/chatear?id=3',5),(3,'2026-11-06 17:58:11.877313',NULL,_binary '\0','Para el día 19/11/2026, el dinero de la seña te será transferido al cbu/alias registrado dentro de las 48 a 72 hs','Recordatorio','¡Tenes una nueva reserva!','/Inicio/mis-reservaciones',3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `leida` bit(1) DEFAULT NULL,
  `resumen` varchar(500) DEFAULT NULL,
  `tipo_notificacion` enum('Alerta','Mensaje','Propuesta','Recordatorio') DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `url_referencia` varchar(255) DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKr45kldlccjvo5kdk98wxsxl4y` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `notificaciones_aud` VALUES (1,331,0,'2026-11-06 17:46:37.001110',NULL,_binary '\0','hola','Mensaje','Nuevo mensaje de alejandro arce','/chatear?id=3',2),(1,332,1,'2026-11-06 17:46:37.001110',NULL,_binary '','hola','Mensaje','Nuevo mensaje de alejandro arce','/chatear?id=3',2),(2,334,0,'2026-11-06 17:46:43.027778',NULL,_binary '\0','hola','Mensaje','Nuevo mensaje de cristian rosales','/chatear?id=3',5),(2,338,1,'2026-11-06 17:46:43.027778',NULL,_binary '','hola','Mensaje','Nuevo mensaje de cristian rosales','/chatear?id=3',5),(3,348,0,'2026-11-06 17:58:11.877313',NULL,_binary '\0','Para el día 19/11/2026, el dinero de la seña te será transferido al cbu/alias registrado dentro de las 48 a 72 hs','Recordatorio','¡Tenes una nueva reserva!','/Inicio/mis-reservaciones',3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametro_comision` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comision_lugar` float NOT NULL,
  `comision_servicio` float NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_desde` datetime(6) DEFAULT NULL,
  `fecha_hasta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `parametro_comision` VALUES (1,0.1,0.05,'Comisión estándar','2024-01-01 00:00:00.000000','2024-12-31 23:59:59.000000',NULL),(2,0.15,0.1,'Comisión especial por temporada alta','2025-01-01 00:00:00.000000','2025-03-31 23:59:59.000000',NULL),(3,0.08,0.04,'Descuento promocional','2025-04-01 00:00:00.000000','2025-06-30 23:59:59.000000',NULL),(4,0.12,0.06,'Comisión intermedia de invierno','2025-07-01 00:00:00.000000','2025-09-30 23:59:59.000000',NULL),(5,0.18,0.12,'Comisión premium fin de año','2025-10-01 00:00:00.000000','2025-12-31 23:59:59.000000',NULL),(6,0.09,0.045,'Comisión promocional verano','2026-01-01 00:00:00.000000','2026-03-31 23:59:59.000000',NULL),(7,0.11,0.055,'Comisión regular primavera','2026-04-01 00:00:00.000000','2026-06-30 23:59:59.000000',NULL),(8,0.13,0.07,'Comisión especial por eventos','2026-07-01 00:00:00.000000','2026-09-30 23:59:59.000000',NULL),(9,0.14,0.08,'Comisión de cierre de año','2026-10-01 00:00:00.000000','2026-12-31 23:59:59.000000',NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametro_comision_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `comision_lugar` float DEFAULT NULL,
  `comision_servicio` float DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_desde` datetime(6) DEFAULT NULL,
  `fecha_hasta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK2pyu8vx6viyh7lfe8wa8249vb` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `metodo_http` tinyint NOT NULL,
  `ruta` varchar(255) DEFAULT NULL,
  `tipo_permiso` enum('API','PANTALLA') DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `permisos_chk_1` CHECK ((`metodo_http` between 0 and 3))
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `permisos` VALUES (1,'','2026-11-06 17:29:58.420071',NULL,3,'/api/resena','API'),(2,'','2026-11-06 17:29:58.491459',NULL,3,'/api/estados-servicio/todos','API'),(3,'','2026-11-06 17:29:58.505363',NULL,0,'/api/factura/crear','API'),(4,'','2026-11-06 17:29:58.515026',NULL,3,'/api/reservas/mis-reservas-lugar','API'),(5,'','2026-11-06 17:29:58.522541',NULL,3,'/api/reportes/vistasPorServicio','API'),(6,'','2026-11-06 17:29:58.530671',NULL,0,'/api/seguridad/usuarios/registrarse','API'),(7,'','2026-11-06 17:29:58.538263',NULL,3,'/api/tipo-de-lugar','API'),(8,'','2026-11-06 17:29:58.545855',NULL,1,'/api/backups/baja-logica-backup/{idBackup}','API'),(9,'','2026-11-06 17:29:58.553884',NULL,1,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(10,'','2026-11-06 17:29:58.562044',NULL,3,'/api/tipo-de-lugar/obtenerDtosTipoLugar','API'),(11,'','2026-11-06 17:29:58.569557',NULL,1,'/api/provincias/actualizar/{idProvincia}','API'),(12,'','2026-11-06 17:29:58.578688',NULL,2,'/api/seguridad/grupos/{id}','API'),(13,'','2026-11-06 17:29:58.586799',NULL,0,'/api/tipo-de-lugar','API'),(14,'','2026-11-06 17:29:58.595756',NULL,1,'/api/provincias/baja/{id}','API'),(15,'','2026-11-06 17:29:58.604535',NULL,1,'/api/seguridad/grupos/permiso/quitar','API'),(16,'','2026-11-06 17:29:58.613962',NULL,3,'/api/reportes/vistasPorServicio/obtener','API'),(17,'','2026-11-06 17:29:58.622525',NULL,0,'/api/seguridad/grupos/permiso/agregar','API'),(18,'','2026-11-06 17:29:58.631266',NULL,0,'/api/resena/getResenaPorUsuario','API'),(19,'','2026-11-06 17:29:58.638863',NULL,3,'/api/reportes/financiero/get','API'),(20,'','2026-11-06 17:29:58.648639',NULL,3,'/api/seguridad/usuarios/{id}','API'),(21,'','2026-11-06 17:29:58.656307',NULL,2,'/api/reportes/vistasPorServicio/{id}','API'),(22,'','2026-11-06 17:29:58.664900',NULL,1,'/api/caracteristicas-de-lugar/baja/{id}','API'),(23,'','2026-11-06 17:29:58.674261',NULL,3,'/api/reportes/vistasPorLugar/obtener','API'),(24,'','2026-11-06 17:29:58.681766',NULL,3,'/api/backups/{id}','API'),(25,'','2026-11-06 17:29:58.688776',NULL,2,'/api/resena/delete/{idReseña}','API'),(26,'','2026-11-06 17:29:58.696368',NULL,3,'/api/reportes/vistasPorLugar/{id}','API'),(27,'','2026-11-06 17:29:58.705794',NULL,1,'/api/estado-backup/baja/{id}','API'),(28,'','2026-11-06 17:29:58.713371',NULL,0,'/api/seguridad/usuarios','API'),(29,'','2026-11-06 17:29:58.720873',NULL,1,'/api/seguridad/grupos/baja','API'),(30,'','2026-11-06 17:29:58.730401',NULL,3,'/api/tipo-de-servicio','API'),(31,'','2026-11-06 17:29:58.739716',NULL,2,'/api/lugares/{id}','API'),(32,'','2026-11-06 17:29:58.749289',NULL,3,'/api/pagos','API'),(33,'','2026-11-06 17:29:58.757275',NULL,3,'/api/reportes/vistasPorLugar','API'),(34,'','2026-11-06 17:29:58.766527',NULL,3,'/api/estados-servicio','API'),(35,'','2026-11-06 17:29:58.773530',NULL,3,'/api/pagos/get','API'),(36,'','2026-11-06 17:29:58.783178',NULL,3,'/api/seguridad/usuarios/foto','API'),(37,'','2026-11-06 17:29:58.790845',NULL,3,'/api/reportes/serviciosMasSolicitados/global/provincias','API'),(38,'','2026-11-06 17:29:58.800427',NULL,0,'/api/reservas','API'),(39,'','2026-11-06 17:29:58.807574',NULL,3,'/api/backups','API'),(40,'','2026-11-06 17:29:58.816769',NULL,3,'/api/seguridad/permisos/pantallas','API'),(41,'','2026-11-06 17:29:58.823319',NULL,1,'/api/seguridad/usuarios/baja/{id}','API'),(42,'','2026-11-06 17:29:58.834836',NULL,0,'/api/estados-servicio','API'),(43,'','2026-11-06 17:29:58.896003',NULL,3,'/api/servicios/getMisServicios','API'),(44,'','2026-11-06 17:29:58.911423',NULL,3,'/api/provincias','API'),(45,'','2026-11-06 17:29:58.924459',NULL,1,'/api/seguridad/permisos/{id}','API'),(46,'','2026-11-06 17:29:58.933992',NULL,1,'/api/backups/baja/{id}','API'),(47,'','2026-11-06 17:29:58.955045',NULL,0,'/api/backups','API'),(48,'','2026-11-06 17:29:58.964862',NULL,2,'/api/provincias/dardebaja/{id}','API'),(49,'','2026-11-06 17:29:58.972560',NULL,3,'/api/lugares/obtenerDtoLugares','API'),(50,'','2026-11-06 17:29:58.982073',NULL,2,'/api/reservas/{id}','API'),(51,'','2026-11-06 17:29:58.990589',NULL,1,'/api/provincias/{id}','API'),(52,'','2026-11-06 17:29:59.001110',NULL,3,'/api/parametro-comision','API'),(53,'','2026-11-06 17:29:59.023128',NULL,3,'/api/reportes/vistasPorServicio/get','API'),(54,'','2026-11-06 17:29:59.032644',NULL,1,'/api/estado-del-evento/{id}','API'),(55,'','2026-11-06 17:29:59.040426',NULL,1,'/api/servicios/iniciarChat','API'),(56,'','2026-11-06 17:29:59.052103',NULL,0,'/api/provincias','API'),(57,'','2026-11-06 17:29:59.058633',NULL,3,'/api/parametro-comision/vigente','API'),(58,'','2026-11-06 17:29:59.066636',NULL,0,'/api/seguridad/usuarios/validar-codigo','API'),(59,'','2026-11-06 17:29:59.073148',NULL,3,'/api/caracteristicas-de-lugar/{id}','API'),(60,'','2026-11-06 17:29:59.081206',NULL,0,'/api/lugares/modificarLugar','API'),(61,'','2026-11-06 17:29:59.087215',NULL,3,'/api/provincias/obtenerDtosProvincia','API'),(62,'','2026-11-06 17:29:59.095132',NULL,0,'/api/notificaciones/test/mensaje/{usuarioId}','API'),(63,'','2026-11-06 17:29:59.102252',NULL,0,'/api/servicios/crearServicio','API'),(64,'','2026-11-06 17:29:59.111307',NULL,1,'/api/tipo-de-evento/baja/{id}','API'),(65,'','2026-11-06 17:29:59.119237',NULL,0,'/api/resena/crear','API'),(66,'','2026-11-06 17:29:59.125330',NULL,3,'/api/parametro-comision/{id}','API'),(67,'','2026-11-06 17:29:59.132875',NULL,0,'/api/pagos/sincronizar','API'),(68,'','2026-11-06 17:29:59.139542',NULL,1,'/api/seguridad/permisos/actualizar/{id}','API'),(69,'','2026-11-06 17:29:59.146945',NULL,3,'/api/auditoriaTransaccion/transferencias-pendientes','API'),(70,'','2026-11-06 17:29:59.152982',NULL,0,'/api/seguridad/usuarios/login','API'),(71,'','2026-11-06 17:29:59.160164',NULL,3,'/api/notificaciones/{id}','API'),(72,'','2026-11-06 17:29:59.169262',NULL,0,'/api/backups/limpiar-retencion','API'),(73,'','2026-11-06 17:29:59.175811',NULL,3,'/api/chat','API'),(74,'','2026-11-06 17:29:59.183365',NULL,1,'/api/eventos/{id}','API'),(75,'','2026-11-06 17:29:59.190052',NULL,3,'/api/reservas/mis-reservas-servicio','API'),(76,'','2026-11-06 17:29:59.198842',NULL,1,'/api/parametro-comision/baja/{id}','API'),(77,'','2026-11-06 17:29:59.204965',NULL,3,'/api/estados-servicio/{id}','API'),(78,'','2026-11-06 17:29:59.213093',NULL,3,'/api/resena/get','API'),(79,'','2026-11-06 17:29:59.219793',NULL,2,'/api/seguridad/usuarios/{id}','API'),(80,'','2026-11-06 17:29:59.225966',NULL,3,'/api/tipo-de-lugar/{id}','API'),(81,'','2026-11-06 17:29:59.232581',NULL,2,'/api/backups/{id}','API'),(82,'','2026-11-06 17:29:59.237971',NULL,2,'/api/reportes/vistasPorLugar/{id}','API'),(83,'','2026-11-06 17:29:59.243950',NULL,1,'/api/reservas/confirmar-reserva','API'),(84,'','2026-11-06 17:29:59.250970',NULL,0,'/api/notificaciones/crear','API'),(85,'','2026-11-06 17:29:59.257495',NULL,3,'/api/caracteristicas-de-lugar','API'),(86,'','2026-11-06 17:29:59.266422',NULL,3,'/api/reportes/CantidadUsuariosActivos/obtener','API'),(87,'','2026-11-06 17:29:59.274432',NULL,1,'/api/tipo-de-evento/{id}','API'),(88,'','2026-11-06 17:29:59.282562',NULL,0,'/api/seguridad/usuarios/recuperar','API'),(89,'','2026-11-06 17:29:59.360506',NULL,3,'/api/reportes/vistasPorLugar/get','API'),(90,'','2026-11-06 17:29:59.371566',NULL,3,'/api/caracteristicas-de-lugar/get','API'),(91,'','2026-11-06 17:29:59.387024',NULL,1,'/api/pagos/{id}/cambiar-visibilidad','API'),(92,'','2026-11-06 17:29:59.396371',NULL,0,'/api/seguridad/grupos','API'),(93,'','2026-11-06 17:29:59.406831',NULL,3,'/api/seguridad/roles/mis-reportes','API'),(94,'','2026-11-06 17:29:59.415710',NULL,3,'/api/estado-del-evento','API'),(95,'','2026-11-06 17:29:59.424359',NULL,1,'/api/provincias/darDeAltaAgain/{idProvincia}','API'),(96,'','2026-11-06 17:29:59.434743',NULL,3,'/api/seguridad/usuarios','API'),(97,'','2026-11-06 17:29:59.443607',NULL,3,'/api/servicios/obtenerDtosServicio','API'),(98,'','2026-11-06 17:29:59.451726',NULL,0,'/api/caracteristicas-de-lugar','API'),(99,'','2026-11-06 17:29:59.459358',NULL,0,'/api/estado-backup','API'),(100,'','2026-11-06 17:29:59.468282',NULL,0,'/api/servicios/modificarServicio','API'),(101,'','2026-11-06 17:29:59.475576',NULL,3,'/api/tipo-de-servicio/{id}','API'),(102,'','2026-11-06 17:29:59.483123',NULL,1,'/api/seguridad/permisos/baja/{id}','API'),(103,'','2026-11-06 17:29:59.491123',NULL,3,'/api/reservas','API'),(104,'','2026-11-06 17:29:59.497254',NULL,0,'/api/estado-del-evento','API'),(105,'','2026-11-06 17:29:59.503951',NULL,1,'/api/eventos/cancelar/{idEvento}','API'),(106,'','2026-11-06 17:29:59.512082',NULL,1,'/api/reportes/financiero/{id}','API'),(107,'','2026-11-06 17:29:59.519817',NULL,3,'/api/eventos','API'),(108,'','2026-11-06 17:29:59.525934',NULL,3,'/api/eventos/obtenerLugar/{idEvento}','API'),(109,'','2026-11-06 17:29:59.534659',NULL,2,'/api/caracteristicas-de-lugar/{id}','API'),(110,'','2026-11-06 17:29:59.543937',NULL,3,'/api/parametro-comision/get','API'),(111,'','2026-11-06 17:29:59.550055',NULL,1,'/api/resena/{id}','API'),(112,'','2026-11-06 17:29:59.556159',NULL,1,'/api/servicios/{id}','API'),(113,'','2026-11-06 17:29:59.562764',NULL,1,'/api/reportes/vistasPorServicio/baja/{id}','API'),(114,'','2026-11-06 17:29:59.569282',NULL,0,'/api/eventos','API'),(115,'','2026-11-06 17:29:59.575426',NULL,3,'/api/lugares/get','API'),(116,'','2026-11-06 17:29:59.582443',NULL,1,'/api/estado-del-evento/baja-estadoevento/{id}','API'),(117,'','2026-11-06 17:29:59.588151',NULL,1,'/api/chat/propuestas/eliminar','API'),(118,'','2026-11-06 17:29:59.593805',NULL,1,'/api/reportes/financiero/baja/{id}','API'),(119,'','2026-11-06 17:29:59.600321',NULL,2,'/api/parametro-comision/{id}','API'),(120,'','2026-11-06 17:29:59.605466',NULL,1,'/api/pagos/{id}','API'),(121,'','2026-11-06 17:29:59.612511',NULL,3,'/api/servicios/obtenerEventosDisponibles/{fecha}/{idServicio}','API'),(122,'','2026-11-06 17:29:59.618047',NULL,3,'/api/servicios','API'),(123,'','2026-11-06 17:29:59.623434',NULL,1,'/api/estado-del-evento/baja/{id}','API'),(124,'','2026-11-06 17:29:59.629953',NULL,3,'/api/tipo-de-evento/get','API'),(125,'','2026-11-06 17:29:59.635956',NULL,2,'/api/notificaciones/{id}','API'),(126,'','2026-11-06 17:29:59.644540',NULL,3,'/api/servicios/verDetalleServicio/{idServicio}','API'),(127,'','2026-11-06 17:29:59.651052',NULL,1,'/api/resena/update/{idReseña}','API'),(128,'','2026-11-06 17:29:59.658957',NULL,2,'/api/tipo-de-lugar/{id}','API'),(129,'','2026-11-06 17:29:59.669549',NULL,2,'/api/estados-servicio/{id}','API'),(130,'','2026-11-06 17:29:59.677575',NULL,1,'/api/tipo-de-servicio/baja/{id}','API'),(131,'','2026-11-06 17:29:59.683834',NULL,3,'/api/tipo-de-servicio/obtenerDtosTipoServicio','API'),(132,'','2026-11-06 17:29:59.689307',NULL,1,'/api/seguridad/roles/{id}/estado','API'),(133,'','2026-11-06 17:29:59.696233',NULL,0,'/api/servicios','API'),(134,'','2026-11-06 17:29:59.701909',NULL,3,'/api/pagos/disponibles','API'),(135,'','2026-11-06 17:29:59.707004',NULL,1,'/api/reservas/reservaAPagar','API'),(136,'','2026-11-06 17:29:59.714130',NULL,1,'/api/datos-bancarios/{id}','API'),(137,'','2026-11-06 17:29:59.719843',NULL,3,'/api/servicios/getMisNombresServicio','API'),(138,'','2026-11-06 17:29:59.726609',NULL,3,'/api/lugares/getMisLugares','API'),(139,'','2026-11-06 17:29:59.732524',NULL,1,'/api/estado-backup/baja-estadobackup/{id}','API'),(140,'','2026-11-06 17:29:59.737540',NULL,1,'/api/localidades/{id}','API'),(141,'','2026-11-06 17:29:59.743412',NULL,3,'/api/seguridad/permisos/{id}','API'),(142,'','2026-11-06 17:29:59.749420',NULL,3,'/api/reservas/estados-reserva','API'),(143,'','2026-11-06 17:29:59.754967',NULL,3,'/api/estado-del-evento/{id}','API'),(144,'','2026-11-06 17:29:59.759589',NULL,3,'/api/seguridad/grupos','API'),(145,'','2026-11-06 17:29:59.765352',NULL,1,'/api/estado-backup/{id}','API'),(146,'','2026-11-06 17:29:59.770332',NULL,2,'/api/tipo-de-servicio/{id}','API'),(147,'','2026-11-06 17:29:59.776027',NULL,1,'/api/backups/update/{id}','API'),(148,'','2026-11-06 17:29:59.782541',NULL,2,'/api/seguridad/roles/{id}','API'),(149,'','2026-11-06 17:29:59.787382',NULL,3,'/api/localidades/get','API'),(150,'','2026-11-06 17:29:59.793497',NULL,1,'/api/seguridad/grupos/permisos/quitar-multiple','API'),(151,'','2026-11-06 17:29:59.799493',NULL,1,'/api/estado-backup/rehabilitar-estadobackup/{id}','API'),(152,'','2026-11-06 17:29:59.805482',NULL,3,'/api/estado-backup','API'),(153,'','2026-11-06 17:29:59.813986',NULL,3,'/api/lugares','API'),(154,'','2026-11-06 17:29:59.819790',NULL,1,'/api/reservas/baja/{id}','API'),(155,'','2026-11-06 17:29:59.824978',NULL,0,'/api/pagos/procesar-pago','API'),(156,'','2026-11-06 17:29:59.831125',NULL,0,'/api/seguridad/usuarios/cambiar-contrasena','API'),(157,'','2026-11-06 17:29:59.837235',NULL,0,'/api/lugares','API'),(158,'','2026-11-06 17:29:59.842235',NULL,1,'/api/tipo-de-lugar/baja/{id}','API'),(159,'','2026-11-06 17:29:59.848524',NULL,3,'/api/reportes/CantidadUsuariosActivos','API'),(160,'','2026-11-06 17:29:59.854633',NULL,1,'/api/estados-servicio/baja/{id}','API'),(161,'','2026-11-06 17:29:59.860638',NULL,3,'/api/reportes/serviciosMasSolicitados/global/servicios','API'),(162,'','2026-11-06 17:29:59.867439',NULL,0,'/api/reportes/CantidadUsuariosActivos','API'),(163,'','2026-11-06 17:29:59.872665',NULL,1,'/api/auditoriaTransaccion/confirmar-transferencia/{id}','API'),(164,'','2026-11-06 17:29:59.880166',NULL,1,'/api/eventos/editar/{idEvento}','API'),(165,'','2026-11-06 17:29:59.885395',NULL,3,'/api/eventos/{id}','API'),(166,'','2026-11-06 17:29:59.891854',NULL,0,'/api/notificaciones/test/alerta/{usuarioId}','API'),(167,'','2026-11-06 17:29:59.899475',NULL,3,'/api/seguridad/grupos/get','API'),(168,'','2026-11-06 17:29:59.931664',NULL,1,'/api/reportes/vistasPorLugar/{id}','API'),(169,'','2026-11-06 17:29:59.959426',NULL,1,'/api/seguridad/grupos/{id}','API'),(170,'','2026-11-06 17:29:59.966509',NULL,3,'/api/reservas/datosFormularioReserva/{idReserva}','API'),(171,'','2026-11-06 17:29:59.981113',NULL,3,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(172,'','2026-11-06 17:29:59.989117',NULL,3,'/api/seguridad/roles/sin-privilegios','API'),(173,'','2026-11-06 17:29:59.996646',NULL,0,'/api/backups/restaurar/{idBackup}','API'),(174,'','2026-11-06 17:30:00.003168',NULL,1,'/api/localidades/darDeAltaAgain/{idLocalidad}','API'),(175,'','2026-11-06 17:30:00.013407',NULL,3,'/api/seguridad/usuarios/perfil','API'),(176,'','2026-11-06 17:30:00.020657',NULL,3,'/api/tipo-de-evento/{id}','API'),(177,'','2026-11-06 17:30:00.027209',NULL,0,'/api/seguridad/usuarios/reenviar-codigo','API'),(178,'','2026-11-06 17:30:00.034291',NULL,1,'/api/reportes/vistasPorServicio/{id}','API'),(179,'','2026-11-06 17:30:00.040309',NULL,3,'/api/datos-bancarios/get','API'),(180,'','2026-11-06 17:30:00.047822',NULL,3,'/api/eventos/obtenerServicios/{idEvento}','API'),(181,'','2026-11-06 17:30:00.054902',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles-por-grupos','API'),(182,'','2026-11-06 17:30:00.060906',NULL,3,'/api/servicios/get','API'),(183,'','2026-11-06 17:30:00.068012',NULL,0,'/api/seguridad/usuarios/perfil','API'),(184,'','2026-11-06 17:30:00.072898',NULL,1,'/api/localidades/dardebaja/{id}','API'),(185,'','2026-11-06 17:30:00.081241',NULL,0,'/api/pagos/crear-preferencia','API'),(186,'','2026-11-06 17:30:00.087381',NULL,1,'/api/notificaciones/{notificacionId}/leer','API'),(187,'','2026-11-06 17:30:00.097424',NULL,1,'/api/seguridad/roles/{id}/actualizar','API'),(188,'','2026-11-06 17:30:00.105252',NULL,1,'/api/lugares/{id}','API'),(189,'','2026-11-06 17:30:00.115191',NULL,2,'/api/seguridad/permisos/{id}','API'),(190,'','2026-11-06 17:30:00.123195',NULL,3,'/api/provincias/TODAS','API'),(191,'','2026-11-06 17:30:00.132481',NULL,3,'/oauth2/callback','API'),(192,'','2026-11-06 17:30:00.139997',NULL,3,'/api/reportes/solicitudesPorLugar/obtener','API'),(193,'','2026-11-06 17:30:00.153863',NULL,3,'/api/reportes/CantidadUsuariosActivos/get','API'),(194,'','2026-11-06 17:30:00.163023',NULL,3,'/api/reportes/financiero/{id}','API'),(195,'','2026-11-06 17:30:00.169681',NULL,3,'/api/localidades','API'),(196,'','2026-11-06 17:30:00.181567',NULL,1,'/api/caracteristicas-de-lugar/{id}','API'),(197,'','2026-11-06 17:30:00.189591',NULL,2,'/api/estado-del-evento/{id}','API'),(198,'','2026-11-06 17:30:00.196237',NULL,1,'/api/eventos/baja/{id}','API'),(199,'','2026-11-06 17:30:00.203290',NULL,3,'/api/eventos/mis-eventos','API'),(200,'','2026-11-06 17:30:00.214425',NULL,3,'/api/lugares/verDetalleLugar/{idLugar}','API'),(201,'','2026-11-06 17:30:00.224278',NULL,3,'/api/resena/{id}','API'),(202,'','2026-11-06 17:30:00.233442',NULL,3,'/api/servicios/{id}','API'),(203,'','2026-11-06 17:30:00.244646',NULL,3,'/api/eventos/get','API'),(204,'','2026-11-06 17:30:00.252323',NULL,0,'/api/localidades','API'),(205,'','2026-11-06 17:30:00.260373',NULL,3,'/api/estado-backup/get','API'),(206,'','2026-11-06 17:30:00.267535',NULL,1,'/api/reservas/{id}','API'),(207,'','2026-11-06 17:30:00.276066',NULL,3,'/api/reportes/financiero','API'),(208,'','2026-11-06 17:30:00.286132',NULL,1,'/api/lugares/baja/{id}','API'),(209,'','2026-11-06 17:30:00.295994',NULL,3,'/api/provincias/{id}','API'),(210,'','2026-11-06 17:30:00.306630',NULL,3,'/api/notificaciones/mias','API'),(211,'','2026-11-06 17:30:00.316976',NULL,3,'/api/pagos/{id}','API'),(212,'','2026-11-06 17:30:00.323977',NULL,1,'/api/notificaciones/{id}','API'),(213,'','2026-11-06 17:30:00.334243',NULL,0,'/api/notificaciones/test/propuesta/{usuarioId}','API'),(214,'','2026-11-06 17:30:00.343443',NULL,3,'/api/reportes/financiero/obtener','API'),(215,'','2026-11-06 17:30:00.355925',NULL,0,'/api/tipo-de-evento','API'),(216,'','2026-11-06 17:30:00.367141',NULL,0,'/api/reportes/financiero','API'),(217,'','2026-11-06 17:30:00.376296',NULL,3,'/api/lugares/getMisNombresLugar','API'),(218,'','2026-11-06 17:30:00.386793',NULL,0,'/api/backups/create','API'),(219,'','2026-11-06 17:30:00.396591',NULL,2,'/api/eventos/{id}','API'),(220,'','2026-11-06 17:30:00.404680',NULL,1,'/api/pagos/baja/{id}','API'),(221,'','2026-11-06 17:30:00.413936',NULL,1,'/api/servicios/baja/{id}','API'),(222,'','2026-11-06 17:30:00.420710',NULL,0,'/api/seguridad/grupos/nuevo','API'),(223,'','2026-11-06 17:30:00.430644',NULL,3,'/api/seguridad/permisos/get','API'),(224,'','2026-11-06 17:30:00.439209',NULL,0,'/api/seguridad/permisos','API'),(225,'','2026-11-06 17:30:00.449204',NULL,2,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(226,'','2026-11-06 17:30:00.458301',NULL,3,'/api/datos-bancarios/{id}','API'),(227,'','2026-11-06 17:30:00.468874',NULL,0,'/api/eventos/nuevo','API'),(228,'','2026-11-06 17:30:00.478963',NULL,1,'/api/chat/propuestas/aceptar','API'),(229,'','2026-11-06 17:30:00.488004',NULL,0,'/api/seguridad/roles/nuevo','API'),(230,'','2026-11-06 17:30:00.501162',NULL,2,'/api/tipo-de-evento/{id}','API'),(231,'','2026-11-06 17:30:00.510515',NULL,1,'/api/seguridad/grupos/permisos/agregar','API'),(232,'','2026-11-06 17:30:00.593641',NULL,1,'/api/servicios/bajaServicio/{idServicio}','API'),(233,'','2026-11-06 17:30:00.603387',NULL,3,'/api/localidades/{id}','API'),(234,'','2026-11-06 17:30:00.622963',NULL,1,'/api/seguridad/usuarios/{id}','API'),(235,'','2026-11-06 17:30:00.632197',NULL,0,'/api/backups/rehabilitar/{idBackup}','API'),(236,'','2026-11-06 17:30:00.641383',NULL,1,'/api/backups/{id}','API'),(237,'','2026-11-06 17:30:00.650915',NULL,3,'/api/reservas/get','API'),(238,'','2026-11-06 17:30:00.662589',NULL,1,'/api/reportes/CantidadUsuariosActivos/baja/{id}','API'),(239,'','2026-11-06 17:30:00.672857',NULL,0,'/api/notificaciones','API'),(240,'','2026-11-06 17:30:00.681634',NULL,3,'/api/reportes/serviciosMasSolicitados/filtros','API'),(241,'','2026-11-06 17:30:00.690297',NULL,3,'/api/estado-backup/{id}','API'),(242,'','2026-11-06 17:30:00.699903',NULL,1,'/api/datos-bancarios/baja/{id}','API'),(243,'','2026-11-06 17:30:00.713470',NULL,3,'/api/seguridad/roles','API'),(244,'','2026-11-06 17:30:00.724722',NULL,1,'/api/localidades/baja/{id}','API'),(245,'','2026-11-06 17:30:00.736903',NULL,0,'/api/notificaciones/test/recordatorio/{usuarioId}','API'),(246,'','2026-11-06 17:30:00.748879',NULL,2,'/api/reportes/financiero/{id}','API'),(247,'','2026-11-06 17:30:00.761478',NULL,3,'/api/tipo-de-servicio/get','API'),(248,'','2026-11-06 17:30:00.772155',NULL,3,'/api/estado-del-evento/get','API'),(249,'','2026-11-06 17:30:00.785393',NULL,0,'/api/resena','API'),(250,'','2026-11-06 17:30:00.796150',NULL,0,'/mail/test','API'),(251,'','2026-11-06 17:30:00.811966',NULL,0,'/api/reportes/vistasPorServicio','API'),(252,'','2026-11-06 17:30:00.826236',NULL,1,'/api/notificaciones/baja/{id}','API'),(253,'','2026-11-06 17:30:00.846407',NULL,3,'/api/provincias/get','API'),(254,'','2026-11-06 17:30:00.862280',NULL,0,'/api/chat/propuesta','API'),(255,'','2026-11-06 17:30:00.873925',NULL,2,'/api/resena/{id}','API'),(256,'','2026-11-06 17:30:00.885657',NULL,2,'/api/servicios/{id}','API'),(257,'','2026-11-06 17:30:00.903121',NULL,1,'/api/reportes/vistasPorLugar/baja/{id}','API'),(258,'','2026-11-06 17:30:00.914442',NULL,1,'/api/notificaciones/leer-todas','API'),(259,'','2026-11-06 17:30:00.923152',NULL,3,'/api/seguridad/usuarios/get','API'),(260,'','2026-11-06 17:30:00.934266',NULL,1,'/api/resena/baja/{id}','API'),(261,'','2026-11-06 17:30:00.944996',NULL,3,'/api/backups/mis-backups','API'),(262,'','2026-11-06 17:30:00.953793',NULL,3,'/api/estados-servicio/get','API'),(263,'','2026-11-06 17:30:00.962868',NULL,2,'/api/pagos/{id}','API'),(264,'','2026-11-06 17:30:00.971533',NULL,0,'/api/backups/realizar-backups','API'),(265,'','2026-11-06 17:30:00.981090',NULL,2,'/api/provincias/{id}','API'),(266,'','2026-11-06 17:30:00.990150',NULL,3,'/api/tipo-de-lugar/get','API'),(267,'','2026-11-06 17:30:00.999273',NULL,3,'/api/seguridad/grupos/{id}','API'),(268,'','2026-11-06 17:30:01.007652',NULL,3,'/api/datos-bancarios','API'),(269,'','2026-11-06 17:30:01.017112',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles','API'),(270,'','2026-11-06 17:30:01.027242',NULL,2,'/api/notificaciones/{notificacionId}','API'),(271,'','2026-11-06 17:30:01.035300',NULL,1,'/api/parametro-comision/{id}','API'),(272,'','2026-11-06 17:30:01.045536',NULL,3,'/api/reportes/serviciosMasSolicitados','API'),(273,'','2026-11-06 17:30:01.053591',NULL,3,'/api/tipo-de-evento','API'),(274,'','2026-11-06 17:30:01.063815',NULL,3,'/api/reportes/historial-de-eventos/obtener','API'),(275,'','2026-11-06 17:30:01.071870',NULL,3,'/api/reportes/vistasPorServicio/{id}','API'),(276,'','2026-11-06 17:30:01.082564',NULL,0,'/api/datos-bancarios','API'),(277,'','2026-11-06 17:30:01.094757',NULL,2,'/api/datos-bancarios/{id}','API'),(278,'','2026-11-06 17:30:01.102679',NULL,0,'/api/tipo-de-servicio','API'),(279,'','2026-11-06 17:30:01.149505',NULL,3,'/api/notificaciones/get','API'),(280,'','2026-11-06 17:30:01.198204',NULL,3,'/api/notificaciones/count','API'),(281,'','2026-11-06 17:30:01.217026',NULL,0,'/api/pagos','API'),(282,'','2026-11-06 17:30:01.225095',NULL,0,'/api/reportes/vistasPorLugar','API'),(283,'','2026-11-06 17:30:01.236740',NULL,1,'/api/estados-servicio/{id}','API'),(284,'','2026-11-06 17:30:01.246802',NULL,1,'/api/tipo-de-lugar/{id}','API'),(285,'','2026-11-06 17:30:01.256049',NULL,3,'/api/seguridad/permisos','API'),(286,'','2026-11-06 17:30:01.264383',NULL,2,'/api/localidades/{id}','API'),(287,'','2026-11-06 17:30:01.273450',NULL,3,'/api/lugares/{id}','API'),(288,'','2026-11-06 17:30:01.282993',NULL,1,'/api/lugares/iniciarReserva','API'),(289,'','2026-11-06 17:30:01.290926',NULL,3,'/api/lugares/obtenerEventosDisponibles/{fecha}/{idLugar}','API'),(290,'','2026-11-06 17:30:01.300367',NULL,1,'/api/estado-del-evento/habilitar-estadoevento/{id}','API'),(291,'','2026-11-06 17:30:01.309141',NULL,1,'/api/seguridad/grupos/baja/{id}','API'),(292,'','2026-11-06 17:30:01.319750',NULL,1,'/api/lugares/bajaLugar/{idLugar}','API'),(293,'','2026-11-06 17:30:01.329304',NULL,2,'/api/estado-backup/{id}','API'),(294,'','2026-11-06 17:30:01.338413',NULL,0,'/api/parametro-comision','API'),(295,'','2026-11-06 17:30:01.346616',NULL,3,'/api/notificaciones','API'),(296,'','2026-11-06 17:30:01.354489',NULL,3,'/api/backups/get','API'),(297,'','2026-11-06 17:30:01.362745',NULL,3,'/api/reservas/{id}','API'),(298,'','2026-11-06 17:30:01.370921',NULL,0,'/api/eventos/actualizar-realizados','API'),(299,'','2026-11-06 17:30:01.380359',NULL,1,'/api/tipo-de-servicio/{id}','API'),(300,'','2026-11-06 17:30:01.387278',NULL,0,'/api/lugares/crearLugar','API'),(301,'','2026-11-06 17:30:01.395867',NULL,1,'/api/provincias/{idProvincia}/localidad/{idLocalidad}','API'),(302,'Acceso a ABM Backups','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/ABMBackups','PANTALLA'),(303,'Contrataciones de un evento','2026-11-06 17:30:10.764095',NULL,3,'Inicio/mis-eventos/contrataciones/:eventoId','PANTALLA'),(304,'Buscar lugares','2026-11-06 17:30:10.764095',NULL,3,'/buscar-lugares','PANTALLA'),(305,'Mis reservaciones','2026-11-06 17:30:10.764095',NULL,3,'Inicio/mis-reservaciones','PANTALLA'),(306,'Mis lugares','2026-11-06 17:30:10.764095',NULL,3,'Inicio/mis-lugares','PANTALLA'),(307,'Ver detalle de lugar','2026-11-06 17:30:10.764095',NULL,3,'/ver-detalle-lugar/:idLugar','PANTALLA'),(308,'Buscar lugares + detalle','2026-11-06 17:30:10.764095',NULL,3,'/buscar-lugares/ver-detalle-lugar/:idLugar','PANTALLA'),(309,'Configuraciones de propietario','2026-11-06 17:30:10.764095',NULL,3,'/configuracionesPropietario','PANTALLA'),(310,'Reservar','2026-11-06 17:30:10.764095',NULL,3,'/Reservar','PANTALLA'),(311,'Medio de pago','2026-11-06 17:30:10.764095',NULL,3,'/MedioPago','PANTALLA'),(312,'Descargar factura','2026-11-06 17:30:10.764095',NULL,3,'/DescargarFactura','PANTALLA'),(313,'Éxito en el pago','2026-11-06 17:30:10.764095',NULL,3,'/ExitoPago','PANTALLA'),(314,'Fallo en el pago','2026-11-06 17:30:10.764095',NULL,3,'/FalloPago','PANTALLA'),(315,'Pago pendiente','2026-11-06 17:30:10.764095',NULL,3,'/PendientePago','PANTALLA'),(316,'Usuarios activos','2026-11-06 17:30:10.764095',NULL,3,'/administracion/usuariosactivos','PANTALLA'),(317,'Buscar servicios','2026-11-06 17:30:10.764095',NULL,3,'/buscar-servicios','PANTALLA'),(318,'Mis servicios','2026-11-06 17:30:10.764095',NULL,3,'inicio/mis-servicios','PANTALLA'),(319,'Ver detalle de servicio','2026-11-06 17:30:10.764095',NULL,3,'/buscar-servicios/ver-detalle-servicio/:idServicio','PANTALLA'),(320,'Detalle de servicio','2026-11-06 17:30:10.764095',NULL,3,'/ver-detalle-servicio','PANTALLA'),(321,'Chatear','2026-11-06 17:30:10.764095',NULL,3,'/chatear','PANTALLA'),(322,'Configuraciones del Sistema','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones','PANTALLA'),(323,'Configuraciones de prestador','2026-11-06 17:30:10.764095',NULL,3,'/ConfiguracionesPrestador','PANTALLA'),(324,'Config. provincias','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/provincias','PANTALLA'),(325,'Config. localidades','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/localidades','PANTALLA'),(326,'Config. parámetro comisión','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/parametroComision','PANTALLA'),(327,'Config. estados backup','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/estadosBackup','PANTALLA'),(328,'Config. medios de pago','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/MediosDePago','PANTALLA'),(329,'Config. estado servicio','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/estadoServicio','PANTALLA'),(330,'Config. permisos','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/permisos','PANTALLA'),(331,'Config. roles','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/roles','PANTALLA'),(332,'Config. tipo de evento','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/tipo-de-evento','PANTALLA'),(333,'Config. tipo de servicio','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/tipo-de-servicio','PANTALLA'),(334,'Config. tipo de lugar','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/tipo-de-lugar','PANTALLA'),(335,'Config. características del lugar','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/caracteristicas-del-lugar','PANTALLA'),(336,'Config. estado del evento','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/estado-del-evento','PANTALLA'),(337,'Recuperar contraseña','2026-11-06 17:30:10.764095',NULL,3,'/recuperar-contraseña','PANTALLA'),(338,'Login y register','2026-11-06 17:30:10.764095',NULL,3,'/Login_y_register','PANTALLA'),(339,'Ver mis Eventos','2026-11-06 17:30:10.764095',NULL,3,'Inicio/mis-eventos','PANTALLA'),(340,'Ver mi perfil','2026-11-06 17:30:10.764095',NULL,3,'Inicio/mi-perfil','PANTALLA'),(341,'Home','2026-11-06 17:30:10.764095',NULL,3,'/Inicio','PANTALLA'),(342,'Reporte de vistas por servicio para el prestador','2026-11-06 17:30:10.764095',NULL,3,'/reportes/vistas-por-servicio','PANTALLA'),(343,'Reporte de vistas por lugar para el propietario','2026-11-06 17:30:10.764095',NULL,3,'/reportes/vistas-por-lugar','PANTALLA'),(344,'Conf. para confirmar las transferencias que ya se realizaron de manera manual','2026-11-06 17:30:10.764095',NULL,3,'/configuraciones/transferencias-pendientes','PANTALLA'),(345,'Reporte de usuarios activos','2026-11-06 17:30:10.764095',NULL,3,'/reportes/usuariosactivos','PANTALLA'),(346,'Reporte de servicios más solicitados para el prestador','2026-11-06 17:30:10.764095',NULL,3,'/reportes/servicios-mas-solicitados','PANTALLA'),(347,'Reporte de cuanto es lo que va a ganar el prestador','2026-11-06 17:30:10.764095',NULL,3,'/reportes/reporte-financiero','PANTALLA'),(348,'Reporte de cuantas veces fue reservado cada lugar de un propietario en un periodo de tiempo','2026-11-06 17:30:10.764095',NULL,3,'/reportes/solicitudes-por-lugar','PANTALLA'),(349,'Reporte de cuanto es lo q gasto un organizador en un periodo de tiempo','2026-11-06 17:30:10.764095',NULL,3,'/reportes/historial-de-eventos','PANTALLA');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `metodo_http` tinyint DEFAULT NULL,
  `ruta` varchar(255) DEFAULT NULL,
  `tipo_permiso` enum('API','PANTALLA') DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKcobc486q8flvyd7y2otsq0da1` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`),
  CONSTRAINT `permisos_aud_chk_1` CHECK ((`metodo_http` between 0 and 3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `permisos_aud` VALUES (1,1,0,'','2026-11-06 17:29:58.420071',NULL,3,'/api/resena','API'),(2,2,0,'','2026-11-06 17:29:58.491459',NULL,3,'/api/estados-servicio/todos','API'),(3,3,0,'','2026-11-06 17:29:58.505363',NULL,0,'/api/factura/crear','API'),(4,4,0,'','2026-11-06 17:29:58.515026',NULL,3,'/api/reservas/mis-reservas-lugar','API'),(5,5,0,'','2026-11-06 17:29:58.522541',NULL,3,'/api/reportes/vistasPorServicio','API'),(6,6,0,'','2026-11-06 17:29:58.530671',NULL,0,'/api/seguridad/usuarios/registrarse','API'),(7,7,0,'','2026-11-06 17:29:58.538263',NULL,3,'/api/tipo-de-lugar','API'),(8,8,0,'','2026-11-06 17:29:58.545855',NULL,1,'/api/backups/baja-logica-backup/{idBackup}','API'),(9,9,0,'','2026-11-06 17:29:58.553884',NULL,1,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(10,10,0,'','2026-11-06 17:29:58.562044',NULL,3,'/api/tipo-de-lugar/obtenerDtosTipoLugar','API'),(11,11,0,'','2026-11-06 17:29:58.569557',NULL,1,'/api/provincias/actualizar/{idProvincia}','API'),(12,12,0,'','2026-11-06 17:29:58.578688',NULL,2,'/api/seguridad/grupos/{id}','API'),(13,13,0,'','2026-11-06 17:29:58.586799',NULL,0,'/api/tipo-de-lugar','API'),(14,14,0,'','2026-11-06 17:29:58.595756',NULL,1,'/api/provincias/baja/{id}','API'),(15,15,0,'','2026-11-06 17:29:58.604535',NULL,1,'/api/seguridad/grupos/permiso/quitar','API'),(16,16,0,'','2026-11-06 17:29:58.613962',NULL,3,'/api/reportes/vistasPorServicio/obtener','API'),(17,17,0,'','2026-11-06 17:29:58.622525',NULL,0,'/api/seguridad/grupos/permiso/agregar','API'),(18,18,0,'','2026-11-06 17:29:58.631266',NULL,0,'/api/resena/getResenaPorUsuario','API'),(19,19,0,'','2026-11-06 17:29:58.638863',NULL,3,'/api/reportes/financiero/get','API'),(20,20,0,'','2026-11-06 17:29:58.648639',NULL,3,'/api/seguridad/usuarios/{id}','API'),(21,21,0,'','2026-11-06 17:29:58.656307',NULL,2,'/api/reportes/vistasPorServicio/{id}','API'),(22,22,0,'','2026-11-06 17:29:58.664900',NULL,1,'/api/caracteristicas-de-lugar/baja/{id}','API'),(23,23,0,'','2026-11-06 17:29:58.674261',NULL,3,'/api/reportes/vistasPorLugar/obtener','API'),(24,24,0,'','2026-11-06 17:29:58.681766',NULL,3,'/api/backups/{id}','API'),(25,25,0,'','2026-11-06 17:29:58.688776',NULL,2,'/api/resena/delete/{idReseña}','API'),(26,26,0,'','2026-11-06 17:29:58.696368',NULL,3,'/api/reportes/vistasPorLugar/{id}','API'),(27,27,0,'','2026-11-06 17:29:58.705794',NULL,1,'/api/estado-backup/baja/{id}','API'),(28,28,0,'','2026-11-06 17:29:58.713371',NULL,0,'/api/seguridad/usuarios','API'),(29,29,0,'','2026-11-06 17:29:58.720873',NULL,1,'/api/seguridad/grupos/baja','API'),(30,30,0,'','2026-11-06 17:29:58.730401',NULL,3,'/api/tipo-de-servicio','API'),(31,31,0,'','2026-11-06 17:29:58.739716',NULL,2,'/api/lugares/{id}','API'),(32,32,0,'','2026-11-06 17:29:58.749289',NULL,3,'/api/pagos','API'),(33,33,0,'','2026-11-06 17:29:58.757275',NULL,3,'/api/reportes/vistasPorLugar','API'),(34,34,0,'','2026-11-06 17:29:58.766527',NULL,3,'/api/estados-servicio','API'),(35,35,0,'','2026-11-06 17:29:58.773530',NULL,3,'/api/pagos/get','API'),(36,36,0,'','2026-11-06 17:29:58.783178',NULL,3,'/api/seguridad/usuarios/foto','API'),(37,37,0,'','2026-11-06 17:29:58.790845',NULL,3,'/api/reportes/serviciosMasSolicitados/global/provincias','API'),(38,38,0,'','2026-11-06 17:29:58.800427',NULL,0,'/api/reservas','API'),(39,39,0,'','2026-11-06 17:29:58.807574',NULL,3,'/api/backups','API'),(40,40,0,'','2026-11-06 17:29:58.816769',NULL,3,'/api/seguridad/permisos/pantallas','API'),(41,41,0,'','2026-11-06 17:29:58.823319',NULL,1,'/api/seguridad/usuarios/baja/{id}','API'),(42,42,0,'','2026-11-06 17:29:58.834836',NULL,0,'/api/estados-servicio','API'),(43,43,0,'','2026-11-06 17:29:58.896003',NULL,3,'/api/servicios/getMisServicios','API'),(44,44,0,'','2026-11-06 17:29:58.911423',NULL,3,'/api/provincias','API'),(45,45,0,'','2026-11-06 17:29:58.924459',NULL,1,'/api/seguridad/permisos/{id}','API'),(46,46,0,'','2026-11-06 17:29:58.933992',NULL,1,'/api/backups/baja/{id}','API'),(47,47,0,'','2026-11-06 17:29:58.955045',NULL,0,'/api/backups','API'),(48,48,0,'','2026-11-06 17:29:58.964862',NULL,2,'/api/provincias/dardebaja/{id}','API'),(49,49,0,'','2026-11-06 17:29:58.972560',NULL,3,'/api/lugares/obtenerDtoLugares','API'),(50,50,0,'','2026-11-06 17:29:58.982073',NULL,2,'/api/reservas/{id}','API'),(51,51,0,'','2026-11-06 17:29:58.990589',NULL,1,'/api/provincias/{id}','API'),(52,52,0,'','2026-11-06 17:29:59.001110',NULL,3,'/api/parametro-comision','API'),(53,53,0,'','2026-11-06 17:29:59.023128',NULL,3,'/api/reportes/vistasPorServicio/get','API'),(54,54,0,'','2026-11-06 17:29:59.032644',NULL,1,'/api/estado-del-evento/{id}','API'),(55,55,0,'','2026-11-06 17:29:59.040426',NULL,1,'/api/servicios/iniciarChat','API'),(56,56,0,'','2026-11-06 17:29:59.052103',NULL,0,'/api/provincias','API'),(57,57,0,'','2026-11-06 17:29:59.058633',NULL,3,'/api/parametro-comision/vigente','API'),(58,58,0,'','2026-11-06 17:29:59.066636',NULL,0,'/api/seguridad/usuarios/validar-codigo','API'),(59,59,0,'','2026-11-06 17:29:59.073148',NULL,3,'/api/caracteristicas-de-lugar/{id}','API'),(60,60,0,'','2026-11-06 17:29:59.081206',NULL,0,'/api/lugares/modificarLugar','API'),(61,61,0,'','2026-11-06 17:29:59.087215',NULL,3,'/api/provincias/obtenerDtosProvincia','API'),(62,62,0,'','2026-11-06 17:29:59.095132',NULL,0,'/api/notificaciones/test/mensaje/{usuarioId}','API'),(63,63,0,'','2026-11-06 17:29:59.102252',NULL,0,'/api/servicios/crearServicio','API'),(64,64,0,'','2026-11-06 17:29:59.111307',NULL,1,'/api/tipo-de-evento/baja/{id}','API'),(65,65,0,'','2026-11-06 17:29:59.119237',NULL,0,'/api/resena/crear','API'),(66,66,0,'','2026-11-06 17:29:59.125330',NULL,3,'/api/parametro-comision/{id}','API'),(67,67,0,'','2026-11-06 17:29:59.132875',NULL,0,'/api/pagos/sincronizar','API'),(68,68,0,'','2026-11-06 17:29:59.139542',NULL,1,'/api/seguridad/permisos/actualizar/{id}','API'),(69,69,0,'','2026-11-06 17:29:59.146945',NULL,3,'/api/auditoriaTransaccion/transferencias-pendientes','API'),(70,70,0,'','2026-11-06 17:29:59.152982',NULL,0,'/api/seguridad/usuarios/login','API'),(71,71,0,'','2026-11-06 17:29:59.160164',NULL,3,'/api/notificaciones/{id}','API'),(72,72,0,'','2026-11-06 17:29:59.169262',NULL,0,'/api/backups/limpiar-retencion','API'),(73,73,0,'','2026-11-06 17:29:59.175811',NULL,3,'/api/chat','API'),(74,74,0,'','2026-11-06 17:29:59.183365',NULL,1,'/api/eventos/{id}','API'),(75,75,0,'','2026-11-06 17:29:59.190052',NULL,3,'/api/reservas/mis-reservas-servicio','API'),(76,76,0,'','2026-11-06 17:29:59.198842',NULL,1,'/api/parametro-comision/baja/{id}','API'),(77,77,0,'','2026-11-06 17:29:59.204965',NULL,3,'/api/estados-servicio/{id}','API'),(78,78,0,'','2026-11-06 17:29:59.213093',NULL,3,'/api/resena/get','API'),(79,79,0,'','2026-11-06 17:29:59.219793',NULL,2,'/api/seguridad/usuarios/{id}','API'),(80,80,0,'','2026-11-06 17:29:59.225966',NULL,3,'/api/tipo-de-lugar/{id}','API'),(81,81,0,'','2026-11-06 17:29:59.232581',NULL,2,'/api/backups/{id}','API'),(82,82,0,'','2026-11-06 17:29:59.237971',NULL,2,'/api/reportes/vistasPorLugar/{id}','API'),(83,83,0,'','2026-11-06 17:29:59.243950',NULL,1,'/api/reservas/confirmar-reserva','API'),(84,84,0,'','2026-11-06 17:29:59.250970',NULL,0,'/api/notificaciones/crear','API'),(85,85,0,'','2026-11-06 17:29:59.257495',NULL,3,'/api/caracteristicas-de-lugar','API'),(86,86,0,'','2026-11-06 17:29:59.266422',NULL,3,'/api/reportes/CantidadUsuariosActivos/obtener','API'),(87,87,0,'','2026-11-06 17:29:59.274432',NULL,1,'/api/tipo-de-evento/{id}','API'),(88,88,0,'','2026-11-06 17:29:59.282562',NULL,0,'/api/seguridad/usuarios/recuperar','API'),(89,89,0,'','2026-11-06 17:29:59.360506',NULL,3,'/api/reportes/vistasPorLugar/get','API'),(90,90,0,'','2026-11-06 17:29:59.371566',NULL,3,'/api/caracteristicas-de-lugar/get','API'),(91,91,0,'','2026-11-06 17:29:59.387024',NULL,1,'/api/pagos/{id}/cambiar-visibilidad','API'),(92,92,0,'','2026-11-06 17:29:59.396371',NULL,0,'/api/seguridad/grupos','API'),(93,93,0,'','2026-11-06 17:29:59.406831',NULL,3,'/api/seguridad/roles/mis-reportes','API'),(94,94,0,'','2026-11-06 17:29:59.415710',NULL,3,'/api/estado-del-evento','API'),(95,95,0,'','2026-11-06 17:29:59.424359',NULL,1,'/api/provincias/darDeAltaAgain/{idProvincia}','API'),(96,96,0,'','2026-11-06 17:29:59.434743',NULL,3,'/api/seguridad/usuarios','API'),(97,97,0,'','2026-11-06 17:29:59.443607',NULL,3,'/api/servicios/obtenerDtosServicio','API'),(98,98,0,'','2026-11-06 17:29:59.451726',NULL,0,'/api/caracteristicas-de-lugar','API'),(99,99,0,'','2026-11-06 17:29:59.459358',NULL,0,'/api/estado-backup','API'),(100,100,0,'','2026-11-06 17:29:59.468282',NULL,0,'/api/servicios/modificarServicio','API'),(101,101,0,'','2026-11-06 17:29:59.475576',NULL,3,'/api/tipo-de-servicio/{id}','API'),(102,102,0,'','2026-11-06 17:29:59.483123',NULL,1,'/api/seguridad/permisos/baja/{id}','API'),(103,103,0,'','2026-11-06 17:29:59.491123',NULL,3,'/api/reservas','API'),(104,104,0,'','2026-11-06 17:29:59.497254',NULL,0,'/api/estado-del-evento','API'),(105,105,0,'','2026-11-06 17:29:59.503951',NULL,1,'/api/eventos/cancelar/{idEvento}','API'),(106,106,0,'','2026-11-06 17:29:59.512082',NULL,1,'/api/reportes/financiero/{id}','API'),(107,107,0,'','2026-11-06 17:29:59.519817',NULL,3,'/api/eventos','API'),(108,108,0,'','2026-11-06 17:29:59.525934',NULL,3,'/api/eventos/obtenerLugar/{idEvento}','API'),(109,109,0,'','2026-11-06 17:29:59.534659',NULL,2,'/api/caracteristicas-de-lugar/{id}','API'),(110,110,0,'','2026-11-06 17:29:59.543937',NULL,3,'/api/parametro-comision/get','API'),(111,111,0,'','2026-11-06 17:29:59.550055',NULL,1,'/api/resena/{id}','API'),(112,112,0,'','2026-11-06 17:29:59.556159',NULL,1,'/api/servicios/{id}','API'),(113,113,0,'','2026-11-06 17:29:59.562764',NULL,1,'/api/reportes/vistasPorServicio/baja/{id}','API'),(114,114,0,'','2026-11-06 17:29:59.569282',NULL,0,'/api/eventos','API'),(115,115,0,'','2026-11-06 17:29:59.575426',NULL,3,'/api/lugares/get','API'),(116,116,0,'','2026-11-06 17:29:59.582443',NULL,1,'/api/estado-del-evento/baja-estadoevento/{id}','API'),(117,117,0,'','2026-11-06 17:29:59.588151',NULL,1,'/api/chat/propuestas/eliminar','API'),(118,118,0,'','2026-11-06 17:29:59.593805',NULL,1,'/api/reportes/financiero/baja/{id}','API'),(119,119,0,'','2026-11-06 17:29:59.600321',NULL,2,'/api/parametro-comision/{id}','API'),(120,120,0,'','2026-11-06 17:29:59.605466',NULL,1,'/api/pagos/{id}','API'),(121,121,0,'','2026-11-06 17:29:59.612511',NULL,3,'/api/servicios/obtenerEventosDisponibles/{fecha}/{idServicio}','API'),(122,122,0,'','2026-11-06 17:29:59.618047',NULL,3,'/api/servicios','API'),(123,123,0,'','2026-11-06 17:29:59.623434',NULL,1,'/api/estado-del-evento/baja/{id}','API'),(124,124,0,'','2026-11-06 17:29:59.629953',NULL,3,'/api/tipo-de-evento/get','API'),(125,125,0,'','2026-11-06 17:29:59.635956',NULL,2,'/api/notificaciones/{id}','API'),(126,126,0,'','2026-11-06 17:29:59.644540',NULL,3,'/api/servicios/verDetalleServicio/{idServicio}','API'),(127,127,0,'','2026-11-06 17:29:59.651052',NULL,1,'/api/resena/update/{idReseña}','API'),(128,128,0,'','2026-11-06 17:29:59.658957',NULL,2,'/api/tipo-de-lugar/{id}','API'),(129,129,0,'','2026-11-06 17:29:59.669549',NULL,2,'/api/estados-servicio/{id}','API'),(130,130,0,'','2026-11-06 17:29:59.677575',NULL,1,'/api/tipo-de-servicio/baja/{id}','API'),(131,131,0,'','2026-11-06 17:29:59.683834',NULL,3,'/api/tipo-de-servicio/obtenerDtosTipoServicio','API'),(132,132,0,'','2026-11-06 17:29:59.689307',NULL,1,'/api/seguridad/roles/{id}/estado','API'),(133,133,0,'','2026-11-06 17:29:59.696233',NULL,0,'/api/servicios','API'),(134,134,0,'','2026-11-06 17:29:59.701909',NULL,3,'/api/pagos/disponibles','API'),(135,135,0,'','2026-11-06 17:29:59.707004',NULL,1,'/api/reservas/reservaAPagar','API'),(136,136,0,'','2026-11-06 17:29:59.714130',NULL,1,'/api/datos-bancarios/{id}','API'),(137,137,0,'','2026-11-06 17:29:59.719843',NULL,3,'/api/servicios/getMisNombresServicio','API'),(138,138,0,'','2026-11-06 17:29:59.726609',NULL,3,'/api/lugares/getMisLugares','API'),(139,139,0,'','2026-11-06 17:29:59.732524',NULL,1,'/api/estado-backup/baja-estadobackup/{id}','API'),(140,140,0,'','2026-11-06 17:29:59.737540',NULL,1,'/api/localidades/{id}','API'),(141,141,0,'','2026-11-06 17:29:59.743412',NULL,3,'/api/seguridad/permisos/{id}','API'),(142,142,0,'','2026-11-06 17:29:59.749420',NULL,3,'/api/reservas/estados-reserva','API'),(143,143,0,'','2026-11-06 17:29:59.754967',NULL,3,'/api/estado-del-evento/{id}','API'),(144,144,0,'','2026-11-06 17:29:59.759589',NULL,3,'/api/seguridad/grupos','API'),(145,145,0,'','2026-11-06 17:29:59.765352',NULL,1,'/api/estado-backup/{id}','API'),(146,146,0,'','2026-11-06 17:29:59.770332',NULL,2,'/api/tipo-de-servicio/{id}','API'),(147,147,0,'','2026-11-06 17:29:59.776027',NULL,1,'/api/backups/update/{id}','API'),(148,148,0,'','2026-11-06 17:29:59.782541',NULL,2,'/api/seguridad/roles/{id}','API'),(149,149,0,'','2026-11-06 17:29:59.787382',NULL,3,'/api/localidades/get','API'),(150,150,0,'','2026-11-06 17:29:59.793497',NULL,1,'/api/seguridad/grupos/permisos/quitar-multiple','API'),(151,151,0,'','2026-11-06 17:29:59.799493',NULL,1,'/api/estado-backup/rehabilitar-estadobackup/{id}','API'),(152,152,0,'','2026-11-06 17:29:59.805482',NULL,3,'/api/estado-backup','API'),(153,153,0,'','2026-11-06 17:29:59.813986',NULL,3,'/api/lugares','API'),(154,154,0,'','2026-11-06 17:29:59.819790',NULL,1,'/api/reservas/baja/{id}','API'),(155,155,0,'','2026-11-06 17:29:59.824978',NULL,0,'/api/pagos/procesar-pago','API'),(156,156,0,'','2026-11-06 17:29:59.831125',NULL,0,'/api/seguridad/usuarios/cambiar-contrasena','API'),(157,157,0,'','2026-11-06 17:29:59.837235',NULL,0,'/api/lugares','API'),(158,158,0,'','2026-11-06 17:29:59.842235',NULL,1,'/api/tipo-de-lugar/baja/{id}','API'),(159,159,0,'','2026-11-06 17:29:59.848524',NULL,3,'/api/reportes/CantidadUsuariosActivos','API'),(160,160,0,'','2026-11-06 17:29:59.854633',NULL,1,'/api/estados-servicio/baja/{id}','API'),(161,161,0,'','2026-11-06 17:29:59.860638',NULL,3,'/api/reportes/serviciosMasSolicitados/global/servicios','API'),(162,162,0,'','2026-11-06 17:29:59.867439',NULL,0,'/api/reportes/CantidadUsuariosActivos','API'),(163,163,0,'','2026-11-06 17:29:59.872665',NULL,1,'/api/auditoriaTransaccion/confirmar-transferencia/{id}','API'),(164,164,0,'','2026-11-06 17:29:59.880166',NULL,1,'/api/eventos/editar/{idEvento}','API'),(165,165,0,'','2026-11-06 17:29:59.885395',NULL,3,'/api/eventos/{id}','API'),(166,166,0,'','2026-11-06 17:29:59.891854',NULL,0,'/api/notificaciones/test/alerta/{usuarioId}','API'),(167,167,0,'','2026-11-06 17:29:59.899475',NULL,3,'/api/seguridad/grupos/get','API'),(168,168,0,'','2026-11-06 17:29:59.931664',NULL,1,'/api/reportes/vistasPorLugar/{id}','API'),(169,169,0,'','2026-11-06 17:29:59.959426',NULL,1,'/api/seguridad/grupos/{id}','API'),(170,170,0,'','2026-11-06 17:29:59.966509',NULL,3,'/api/reservas/datosFormularioReserva/{idReserva}','API'),(171,171,0,'','2026-11-06 17:29:59.981113',NULL,3,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(172,172,0,'','2026-11-06 17:29:59.989117',NULL,3,'/api/seguridad/roles/sin-privilegios','API'),(173,173,0,'','2026-11-06 17:29:59.996646',NULL,0,'/api/backups/restaurar/{idBackup}','API'),(174,174,0,'','2026-11-06 17:30:00.003168',NULL,1,'/api/localidades/darDeAltaAgain/{idLocalidad}','API'),(175,175,0,'','2026-11-06 17:30:00.013407',NULL,3,'/api/seguridad/usuarios/perfil','API'),(176,176,0,'','2026-11-06 17:30:00.020657',NULL,3,'/api/tipo-de-evento/{id}','API'),(177,177,0,'','2026-11-06 17:30:00.027209',NULL,0,'/api/seguridad/usuarios/reenviar-codigo','API'),(178,178,0,'','2026-11-06 17:30:00.034291',NULL,1,'/api/reportes/vistasPorServicio/{id}','API'),(179,179,0,'','2026-11-06 17:30:00.040309',NULL,3,'/api/datos-bancarios/get','API'),(180,180,0,'','2026-11-06 17:30:00.047822',NULL,3,'/api/eventos/obtenerServicios/{idEvento}','API'),(181,181,0,'','2026-11-06 17:30:00.054902',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles-por-grupos','API'),(182,182,0,'','2026-11-06 17:30:00.060906',NULL,3,'/api/servicios/get','API'),(183,183,0,'','2026-11-06 17:30:00.068012',NULL,0,'/api/seguridad/usuarios/perfil','API'),(184,184,0,'','2026-11-06 17:30:00.072898',NULL,1,'/api/localidades/dardebaja/{id}','API'),(185,185,0,'','2026-11-06 17:30:00.081241',NULL,0,'/api/pagos/crear-preferencia','API'),(186,186,0,'','2026-11-06 17:30:00.087381',NULL,1,'/api/notificaciones/{notificacionId}/leer','API'),(187,187,0,'','2026-11-06 17:30:00.097424',NULL,1,'/api/seguridad/roles/{id}/actualizar','API'),(188,188,0,'','2026-11-06 17:30:00.105252',NULL,1,'/api/lugares/{id}','API'),(189,189,0,'','2026-11-06 17:30:00.115191',NULL,2,'/api/seguridad/permisos/{id}','API'),(190,190,0,'','2026-11-06 17:30:00.123195',NULL,3,'/api/provincias/TODAS','API'),(191,191,0,'','2026-11-06 17:30:00.132481',NULL,3,'/oauth2/callback','API'),(192,192,0,'','2026-11-06 17:30:00.139997',NULL,3,'/api/reportes/solicitudesPorLugar/obtener','API'),(193,193,0,'','2026-11-06 17:30:00.153863',NULL,3,'/api/reportes/CantidadUsuariosActivos/get','API'),(194,194,0,'','2026-11-06 17:30:00.163023',NULL,3,'/api/reportes/financiero/{id}','API'),(195,195,0,'','2026-11-06 17:30:00.169681',NULL,3,'/api/localidades','API'),(196,196,0,'','2026-11-06 17:30:00.181567',NULL,1,'/api/caracteristicas-de-lugar/{id}','API'),(197,197,0,'','2026-11-06 17:30:00.189591',NULL,2,'/api/estado-del-evento/{id}','API'),(198,198,0,'','2026-11-06 17:30:00.196237',NULL,1,'/api/eventos/baja/{id}','API'),(199,199,0,'','2026-11-06 17:30:00.203290',NULL,3,'/api/eventos/mis-eventos','API'),(200,200,0,'','2026-11-06 17:30:00.214425',NULL,3,'/api/lugares/verDetalleLugar/{idLugar}','API'),(201,201,0,'','2026-11-06 17:30:00.224278',NULL,3,'/api/resena/{id}','API'),(202,202,0,'','2026-11-06 17:30:00.233442',NULL,3,'/api/servicios/{id}','API'),(203,203,0,'','2026-11-06 17:30:00.244646',NULL,3,'/api/eventos/get','API'),(204,204,0,'','2026-11-06 17:30:00.252323',NULL,0,'/api/localidades','API'),(205,205,0,'','2026-11-06 17:30:00.260373',NULL,3,'/api/estado-backup/get','API'),(206,206,0,'','2026-11-06 17:30:00.267535',NULL,1,'/api/reservas/{id}','API'),(207,207,0,'','2026-11-06 17:30:00.276066',NULL,3,'/api/reportes/financiero','API'),(208,208,0,'','2026-11-06 17:30:00.286132',NULL,1,'/api/lugares/baja/{id}','API'),(209,209,0,'','2026-11-06 17:30:00.295994',NULL,3,'/api/provincias/{id}','API'),(210,210,0,'','2026-11-06 17:30:00.306630',NULL,3,'/api/notificaciones/mias','API'),(211,211,0,'','2026-11-06 17:30:00.316976',NULL,3,'/api/pagos/{id}','API'),(212,212,0,'','2026-11-06 17:30:00.323977',NULL,1,'/api/notificaciones/{id}','API'),(213,213,0,'','2026-11-06 17:30:00.334243',NULL,0,'/api/notificaciones/test/propuesta/{usuarioId}','API'),(214,214,0,'','2026-11-06 17:30:00.343443',NULL,3,'/api/reportes/financiero/obtener','API'),(215,215,0,'','2026-11-06 17:30:00.355925',NULL,0,'/api/tipo-de-evento','API'),(216,216,0,'','2026-11-06 17:30:00.367141',NULL,0,'/api/reportes/financiero','API'),(217,217,0,'','2026-11-06 17:30:00.376296',NULL,3,'/api/lugares/getMisNombresLugar','API'),(218,218,0,'','2026-11-06 17:30:00.386793',NULL,0,'/api/backups/create','API'),(219,219,0,'','2026-11-06 17:30:00.396591',NULL,2,'/api/eventos/{id}','API'),(220,220,0,'','2026-11-06 17:30:00.404680',NULL,1,'/api/pagos/baja/{id}','API'),(221,221,0,'','2026-11-06 17:30:00.413936',NULL,1,'/api/servicios/baja/{id}','API'),(222,222,0,'','2026-11-06 17:30:00.420710',NULL,0,'/api/seguridad/grupos/nuevo','API'),(223,223,0,'','2026-11-06 17:30:00.430644',NULL,3,'/api/seguridad/permisos/get','API'),(224,224,0,'','2026-11-06 17:30:00.439209',NULL,0,'/api/seguridad/permisos','API'),(225,225,0,'','2026-11-06 17:30:00.449204',NULL,2,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(226,226,0,'','2026-11-06 17:30:00.458301',NULL,3,'/api/datos-bancarios/{id}','API'),(227,227,0,'','2026-11-06 17:30:00.468874',NULL,0,'/api/eventos/nuevo','API'),(228,228,0,'','2026-11-06 17:30:00.478963',NULL,1,'/api/chat/propuestas/aceptar','API'),(229,229,0,'','2026-11-06 17:30:00.488004',NULL,0,'/api/seguridad/roles/nuevo','API'),(230,230,0,'','2026-11-06 17:30:00.501162',NULL,2,'/api/tipo-de-evento/{id}','API'),(231,231,0,'','2026-11-06 17:30:00.510515',NULL,1,'/api/seguridad/grupos/permisos/agregar','API'),(232,232,0,'','2026-11-06 17:30:00.593641',NULL,1,'/api/servicios/bajaServicio/{idServicio}','API'),(233,233,0,'','2026-11-06 17:30:00.603387',NULL,3,'/api/localidades/{id}','API'),(234,234,0,'','2026-11-06 17:30:00.622963',NULL,1,'/api/seguridad/usuarios/{id}','API'),(235,235,0,'','2026-11-06 17:30:00.632197',NULL,0,'/api/backups/rehabilitar/{idBackup}','API'),(236,236,0,'','2026-11-06 17:30:00.641383',NULL,1,'/api/backups/{id}','API'),(237,237,0,'','2026-11-06 17:30:00.650915',NULL,3,'/api/reservas/get','API'),(238,238,0,'','2026-11-06 17:30:00.662589',NULL,1,'/api/reportes/CantidadUsuariosActivos/baja/{id}','API'),(239,239,0,'','2026-11-06 17:30:00.672857',NULL,0,'/api/notificaciones','API'),(240,240,0,'','2026-11-06 17:30:00.681634',NULL,3,'/api/reportes/serviciosMasSolicitados/filtros','API'),(241,241,0,'','2026-11-06 17:30:00.690297',NULL,3,'/api/estado-backup/{id}','API'),(242,242,0,'','2026-11-06 17:30:00.699903',NULL,1,'/api/datos-bancarios/baja/{id}','API'),(243,243,0,'','2026-11-06 17:30:00.713470',NULL,3,'/api/seguridad/roles','API'),(244,244,0,'','2026-11-06 17:30:00.724722',NULL,1,'/api/localidades/baja/{id}','API'),(245,245,0,'','2026-11-06 17:30:00.736903',NULL,0,'/api/notificaciones/test/recordatorio/{usuarioId}','API'),(246,246,0,'','2026-11-06 17:30:00.748879',NULL,2,'/api/reportes/financiero/{id}','API'),(247,247,0,'','2026-11-06 17:30:00.761478',NULL,3,'/api/tipo-de-servicio/get','API'),(248,248,0,'','2026-11-06 17:30:00.772155',NULL,3,'/api/estado-del-evento/get','API'),(249,249,0,'','2026-11-06 17:30:00.785393',NULL,0,'/api/resena','API'),(250,250,0,'','2026-11-06 17:30:00.796150',NULL,0,'/mail/test','API'),(251,251,0,'','2026-11-06 17:30:00.811966',NULL,0,'/api/reportes/vistasPorServicio','API'),(252,252,0,'','2026-11-06 17:30:00.826236',NULL,1,'/api/notificaciones/baja/{id}','API'),(253,253,0,'','2026-11-06 17:30:00.846407',NULL,3,'/api/provincias/get','API'),(254,254,0,'','2026-11-06 17:30:00.862280',NULL,0,'/api/chat/propuesta','API'),(255,255,0,'','2026-11-06 17:30:00.873925',NULL,2,'/api/resena/{id}','API'),(256,256,0,'','2026-11-06 17:30:00.885657',NULL,2,'/api/servicios/{id}','API'),(257,257,0,'','2026-11-06 17:30:00.903121',NULL,1,'/api/reportes/vistasPorLugar/baja/{id}','API'),(258,258,0,'','2026-11-06 17:30:00.914442',NULL,1,'/api/notificaciones/leer-todas','API'),(259,259,0,'','2026-11-06 17:30:00.923152',NULL,3,'/api/seguridad/usuarios/get','API'),(260,260,0,'','2026-11-06 17:30:00.934266',NULL,1,'/api/resena/baja/{id}','API'),(261,261,0,'','2026-11-06 17:30:00.944996',NULL,3,'/api/backups/mis-backups','API'),(262,262,0,'','2026-11-06 17:30:00.953793',NULL,3,'/api/estados-servicio/get','API'),(263,263,0,'','2026-11-06 17:30:00.962868',NULL,2,'/api/pagos/{id}','API'),(264,264,0,'','2026-11-06 17:30:00.971533',NULL,0,'/api/backups/realizar-backups','API'),(265,265,0,'','2026-11-06 17:30:00.981090',NULL,2,'/api/provincias/{id}','API'),(266,266,0,'','2026-11-06 17:30:00.990150',NULL,3,'/api/tipo-de-lugar/get','API'),(267,267,0,'','2026-11-06 17:30:00.999273',NULL,3,'/api/seguridad/grupos/{id}','API'),(268,268,0,'','2026-11-06 17:30:01.007652',NULL,3,'/api/datos-bancarios','API'),(269,269,0,'','2026-11-06 17:30:01.017112',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles','API'),(270,270,0,'','2026-11-06 17:30:01.027242',NULL,2,'/api/notificaciones/{notificacionId}','API'),(271,271,0,'','2026-11-06 17:30:01.035300',NULL,1,'/api/parametro-comision/{id}','API'),(272,272,0,'','2026-11-06 17:30:01.045536',NULL,3,'/api/reportes/serviciosMasSolicitados','API'),(273,273,0,'','2026-11-06 17:30:01.053591',NULL,3,'/api/tipo-de-evento','API'),(274,274,0,'','2026-11-06 17:30:01.063815',NULL,3,'/api/reportes/historial-de-eventos/obtener','API'),(275,275,0,'','2026-11-06 17:30:01.071870',NULL,3,'/api/reportes/vistasPorServicio/{id}','API'),(276,276,0,'','2026-11-06 17:30:01.082564',NULL,0,'/api/datos-bancarios','API'),(277,277,0,'','2026-11-06 17:30:01.094757',NULL,2,'/api/datos-bancarios/{id}','API'),(278,278,0,'','2026-11-06 17:30:01.102679',NULL,0,'/api/tipo-de-servicio','API'),(279,279,0,'','2026-11-06 17:30:01.149505',NULL,3,'/api/notificaciones/get','API'),(280,280,0,'','2026-11-06 17:30:01.198204',NULL,3,'/api/notificaciones/count','API'),(281,281,0,'','2026-11-06 17:30:01.217026',NULL,0,'/api/pagos','API'),(282,282,0,'','2026-11-06 17:30:01.225095',NULL,0,'/api/reportes/vistasPorLugar','API'),(283,283,0,'','2026-11-06 17:30:01.236740',NULL,1,'/api/estados-servicio/{id}','API'),(284,284,0,'','2026-11-06 17:30:01.246802',NULL,1,'/api/tipo-de-lugar/{id}','API'),(285,285,0,'','2026-11-06 17:30:01.256049',NULL,3,'/api/seguridad/permisos','API'),(286,286,0,'','2026-11-06 17:30:01.264383',NULL,2,'/api/localidades/{id}','API'),(287,287,0,'','2026-11-06 17:30:01.273450',NULL,3,'/api/lugares/{id}','API'),(288,288,0,'','2026-11-06 17:30:01.282993',NULL,1,'/api/lugares/iniciarReserva','API'),(289,289,0,'','2026-11-06 17:30:01.290926',NULL,3,'/api/lugares/obtenerEventosDisponibles/{fecha}/{idLugar}','API'),(290,290,0,'','2026-11-06 17:30:01.300367',NULL,1,'/api/estado-del-evento/habilitar-estadoevento/{id}','API'),(291,291,0,'','2026-11-06 17:30:01.309141',NULL,1,'/api/seguridad/grupos/baja/{id}','API'),(292,292,0,'','2026-11-06 17:30:01.319750',NULL,1,'/api/lugares/bajaLugar/{idLugar}','API'),(293,293,0,'','2026-11-06 17:30:01.329304',NULL,2,'/api/estado-backup/{id}','API'),(294,294,0,'','2026-11-06 17:30:01.338413',NULL,0,'/api/parametro-comision','API'),(295,295,0,'','2026-11-06 17:30:01.346616',NULL,3,'/api/notificaciones','API'),(296,296,0,'','2026-11-06 17:30:01.354489',NULL,3,'/api/backups/get','API'),(297,297,0,'','2026-11-06 17:30:01.362745',NULL,3,'/api/reservas/{id}','API'),(298,298,0,'','2026-11-06 17:30:01.370921',NULL,0,'/api/eventos/actualizar-realizados','API'),(299,299,0,'','2026-11-06 17:30:01.380359',NULL,1,'/api/tipo-de-servicio/{id}','API'),(300,300,0,'','2026-11-06 17:30:01.387278',NULL,0,'/api/lugares/crearLugar','API'),(301,301,0,'','2026-11-06 17:30:01.395867',NULL,1,'/api/provincias/{idProvincia}/localidad/{idLocalidad}','API');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propuestas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `presupuesto_total` float NOT NULL,
  `seña` float NOT NULL,
  `chat_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkvpikyxi6brcmkdh4airmrh24` (`chat_id`),
  CONSTRAINT `FKkvpikyxi6brcmkdh4airmrh24` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `propuestas` VALUES (1,'aaaaaaaaaaaaaaaaa','2026-11-06 17:30:10.000000',NULL,10000,2000,1),(2,'bbbbbbbbbbbbbb','2026-11-06 17:30:10.000000',NULL,20000,4000,2),(3,'safdasdasdasdas','2026-11-06 17:47:00.593552','2026-11-06 17:47:29.209120',1988,0,3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propuestas_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `presupuesto_total` float DEFAULT NULL,
  `seña` float DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKefeueyc4k2y2k2e2bfiovi31p` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `propuestas_aud` VALUES (3,335,0,'safdasdasdasdas','2026-11-06 17:46:54.017279',NULL,1988,0),(3,336,1,'safdasdasdasdas','2026-11-06 17:47:00.593552',NULL,1988,0),(3,339,1,'safdasdasdasdas','2026-11-06 17:47:00.593552','2026-11-06 17:47:29.209120',1988,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia_localidad_aud` (
  `rev` int NOT NULL,
  `provincia_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`provincia_id`,`rev`,`id`),
  KEY `FK7o98avbg1uclgnc164og4dl53` (`rev`),
  CONSTRAINT `FK7o98avbg1uclgnc164og4dl53` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_otj7kmq4jxw8xre8265k3tvxj` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `provincias` VALUES (1,'2026-11-06 17:30:10.000000',NULL,'Buenos Aires'),(2,'2026-11-06 17:30:10.000000',NULL,'Buenos Aires-GBA'),(3,'2026-11-06 17:30:10.000000',NULL,'Capital Federal'),(4,'2026-11-06 17:30:10.000000',NULL,'Catamarca'),(5,'2026-11-06 17:30:10.000000',NULL,'Chaco'),(6,'2026-11-06 17:30:10.000000',NULL,'Chubut'),(7,'2026-11-06 17:30:10.000000',NULL,'Córdoba'),(8,'2026-11-06 17:30:10.000000',NULL,'Corrientes'),(9,'2026-11-06 17:30:10.000000',NULL,'Entre Ríos'),(10,'2026-11-06 17:30:10.000000',NULL,'Formosa'),(11,'2026-11-06 17:30:10.000000',NULL,'Jujuy'),(12,'2026-11-06 17:30:10.000000',NULL,'La Pampa'),(13,'2026-11-06 17:30:10.000000',NULL,'La Rioja'),(14,'2026-11-06 17:30:10.000000',NULL,'Mendoza'),(15,'2026-11-06 17:30:10.000000',NULL,'Misiones'),(16,'2026-11-06 17:30:10.000000',NULL,'Neuquén'),(17,'2026-11-06 17:30:10.000000',NULL,'Río Negro'),(18,'2026-11-06 17:30:10.000000',NULL,'Salta'),(19,'2026-11-06 17:30:10.000000',NULL,'San Juan'),(20,'2026-11-06 17:30:10.000000',NULL,'San Luis'),(21,'2026-11-06 17:30:10.000000',NULL,'Santa Cruz'),(22,'2026-11-06 17:30:10.000000',NULL,'Santa Fe'),(23,'2026-11-06 17:30:10.000000',NULL,'Santiago del Estero'),(24,'2026-11-06 17:30:10.000000',NULL,'Tierra del Fuego'),(25,'2026-11-06 17:30:10.000000',NULL,'Tucumán');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK4itx9de6ov3aixllbcs46381y` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recuperaciones_password` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `expiracion` datetime(6) DEFAULT NULL,
  `intentos` int DEFAULT NULL,
  `ultimo_intento` datetime(6) DEFAULT NULL,
  `usado` bit(1) DEFAULT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKijxfh8ra6uhfbm1w7c6hp119x` (`usuario_id`),
  CONSTRAINT `FKijxfh8ra6uhfbm1w7c6hp119x` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `recuperaciones_password` VALUES (1,'2993','2026-11-18 12:26:13.682276',1,'2026-11-18 12:16:13.682276',_binary '',1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recuperaciones_password_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `expiracion` datetime(6) DEFAULT NULL,
  `intentos` int DEFAULT NULL,
  `ultimo_intento` datetime(6) DEFAULT NULL,
  `usado` bit(1) DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKkgq9phf3inx67duxrsi9fbwrj` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `recuperaciones_password_aud` VALUES (1,403,0,'2993','2026-11-18 12:26:13.682276',1,'2026-11-18 12:16:13.682276',_binary '\0',1),(1,405,1,'2993','2026-11-18 12:26:13.682276',1,'2026-11-18 12:16:13.682276',_binary '',1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `cuit` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `estado_reserva` enum('CANCELADA','COMPLETO','EN_CHAT','PARCIAL') NOT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `fecha_hora_pago` datetime(6) DEFAULT NULL,
  `fecha_reserva` datetime(6) DEFAULT NULL,
  `id_pago` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `precio_reserva` double DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `tipo_factura` enum('A','B','C','E','M') DEFAULT NULL,
  `evento_id` bigint DEFAULT NULL,
  `factura_id` bigint DEFAULT NULL,
  `localidad_id` bigint DEFAULT NULL,
  `lugar_id` bigint DEFAULT NULL,
  `medio_de_pago_id` bigint DEFAULT NULL,
  `organizador_id` bigint NOT NULL,
  `prestador_id` bigint NOT NULL,
  `propuesta_id` bigint DEFAULT NULL,
  `servicio_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ci31i3f33s8aq8jpjy5rr4wvn` (`factura_id`),
  UNIQUE KEY `UK_b2r3gypxuq8xn1lgo77pkj4u3` (`propuesta_id`),
  KEY `FKmt6vcdg69jdxl44bk21wwf1e7` (`evento_id`),
  KEY `FKbbrgmc6jwdi0d4nxnsnhhc0l2` (`localidad_id`),
  KEY `FKaj8ftmadnsml4385mahiensx6` (`lugar_id`),
  KEY `FK7c1gvrr77l2i9g05m36ltiqtv` (`medio_de_pago_id`),
  KEY `FK3lw59l89yb5egmhyurgtw7eq3` (`organizador_id`),
  KEY `FKikcadym0qx5umqxwx6yoeekg0` (`prestador_id`),
  KEY `FK4ko05njxmb92d79kfql8vc4bs` (`servicio_id`),
  CONSTRAINT `FK3lw59l89yb5egmhyurgtw7eq3` FOREIGN KEY (`organizador_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FK3o0h281a65fgn356ka5ynvj6y` FOREIGN KEY (`propuesta_id`) REFERENCES `propuestas` (`id`),
  CONSTRAINT `FK4ko05njxmb92d79kfql8vc4bs` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
  CONSTRAINT `FK7c1gvrr77l2i9g05m36ltiqtv` FOREIGN KEY (`medio_de_pago_id`) REFERENCES `medios_de_pago` (`id`),
  CONSTRAINT `FKaj8ftmadnsml4385mahiensx6` FOREIGN KEY (`lugar_id`) REFERENCES `lugares` (`id`),
  CONSTRAINT `FKbbrgmc6jwdi0d4nxnsnhhc0l2` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`id`),
  CONSTRAINT `FKikcadym0qx5umqxwx6yoeekg0` FOREIGN KEY (`prestador_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKmt6vcdg69jdxl44bk21wwf1e7` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`),
  CONSTRAINT `FKteaa0xj748aqhtpptpk3ufqnn` FOREIGN KEY (`factura_id`) REFERENCES `base_factura_entity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `reservas` VALUES (1,'arce',NULL,'alear123@gial.cm','COMPLETO','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','2026-11-06 17:30:10.000000',NULL,'Ale',2000,'234567237','A',1,NULL,NULL,1,1,1,3,NULL,NULL),(2,'arce',NULL,'alear123@gial.cm','COMPLETO','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','2026-11-06 17:30:10.000000',NULL,'Ale',2000,'234567237','A',1,NULL,NULL,2,2,1,3,NULL,NULL),(3,'arce',NULL,'alear123@gial.cm','COMPLETO','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','2026-11-06 17:30:10.000000',NULL,'Ale',2000,'234567237','A',1,NULL,NULL,NULL,2,1,3,1,1),(4,'arce',NULL,'alear123@gial.cm','EN_CHAT','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','2026-11-06 17:30:10.000000',NULL,'Ale',2000,'234567237','A',1,NULL,NULL,NULL,2,1,3,2,1),(5,'arce',NULL,'alear123@gial.cm','COMPLETO','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','2026-11-06 17:30:10.000000',NULL,'Ale',2000,'234567237','A',3,NULL,NULL,3,1,1,3,NULL,NULL),(6,'arce',NULL,'alear123@gial.cm','COMPLETO','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','2026-11-06 17:30:10.000000',NULL,'Ale',2000,'234567237','A',3,NULL,NULL,3,1,1,3,NULL,NULL),(7,'Arce',NULL,'alear12373@gmail.com','COMPLETO','2025-11-01 11:00:00.000000',NULL,'2025-11-01 12:00:00.000000','2025-11-01 00:00:00.000000',NULL,'Alejandro',21000,'02617233183','A',4,NULL,NULL,1,1,1,3,NULL,NULL),(8,'Arce',NULL,'alear12373@gmail.com','COMPLETO','2025-11-01 12:30:00.000000',NULL,'2025-11-01 13:00:00.000000','2025-11-01 00:00:00.000000',NULL,'Alejandro',230000,'02617233183','A',5,NULL,NULL,2,2,1,3,NULL,NULL),(9,'Arce',NULL,'alear12373@gmail.com','COMPLETO','2025-11-10 09:00:00.000000',NULL,'2025-11-10 09:15:00.000000','2025-11-10 00:00:00.000000',NULL,'Alejandro',2250,'02617233183','A',6,NULL,NULL,3,3,1,3,NULL,NULL),(10,'Arce',NULL,'alear12373@gmail.com','COMPLETO','2025-11-11 15:00:00.000000',NULL,'2025-11-11 15:10:00.000000','2025-11-11 00:00:00.000000',NULL,'Alejandro',2500,'02617233183','A',7,NULL,NULL,NULL,4,1,2,NULL,1),(11,'Arce',NULL,'alear12373@gmail.com','COMPLETO','2025-10-21 08:00:00.000000',NULL,'2025-10-21 08:25:00.000000','2025-10-21 00:00:00.000000',NULL,'Alejandro',2000,'02617233183','A',8,NULL,NULL,NULL,5,1,2,NULL,2),(12,'Arce',NULL,'alear12373@gmail.com','COMPLETO','2025-10-23 19:00:00.000000',NULL,'2025-10-23 19:40:00.000000','2025-10-23 00:00:00.000000',NULL,'Alejandro',2150,'02617233183','A',4,NULL,NULL,NULL,1,1,2,NULL,3),(13,'Arce',NULL,'alear12373@gmail.com','COMPLETO','2025-12-01 16:00:00.000000',NULL,'2025-12-01 16:10:00.000000','2025-11-01 00:00:00.000000',NULL,'Alejandro',2225,'02617233183','A',5,NULL,NULL,2,2,1,3,NULL,NULL),(14,'Arce',NULL,'alear12373@gmail.com','COMPLETO','2025-12-02 17:00:00.000000',NULL,'2025-12-02 17:20:00.000000','2025-11-02 00:00:00.000000',NULL,'Alejandro',1980,'02617233183','A',6,NULL,NULL,1,3,1,3,NULL,NULL),(15,'Arce',NULL,'alear12373@gmail.com','COMPLETO','2025-12-09 10:00:00.000000',NULL,'2025-12-09 10:15:00.000000','2025-11-09 00:00:00.000000',NULL,'Alejandro',2050,'02617233183','A',7,NULL,NULL,3,4,1,3,NULL,NULL),(16,'Arce',NULL,'alear12373@gmail.com','COMPLETO','2025-12-10 12:00:00.000000',NULL,'2025-12-10 12:15:00.000000','2025-11-10 00:00:00.000000',NULL,'Alejandro',2175,'02617233183','A',8,NULL,NULL,1,1,1,3,NULL,NULL),(17,'asdasd','21-21211212-1','root@example.com','PARCIAL','2026-11-06 17:40:12.641125',NULL,NULL,'2026-11-18 00:00:00.000000',NULL,'Conferencia Tech',2300,'2613004548',NULL,10,NULL,1,2,NULL,5,3,NULL,NULL),(18,'Arce','21-21211212-1','aleaceeeee12373@gmail.com','PARCIAL','2026-11-06 17:43:41.648878',NULL,NULL,'2026-11-16 00:00:00.000000',NULL,'Conferencia Tech',2000,'2613004548',NULL,11,NULL,1,1,NULL,5,3,NULL,NULL),(19,'Arce','21-21211212-1','alear12373@gmail.com','EN_CHAT','2026-11-06 17:46:34.001421',NULL,NULL,'2026-11-19 00:00:00.000000',NULL,'Conferencia Tech',1988,'2613004548',NULL,12,NULL,2,NULL,NULL,5,2,3,1),(20,'Arce','21-21211212-1','alear12373@gmail.com','COMPLETO','2026-11-06 17:52:29.668959',NULL,'2026-11-06 20:58:11.935000','2026-11-19 00:00:00.000000','1354925959','Casamiento Jorge',2000,'2613004548','A',12,1,1,1,4,5,3,NULL,NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `cuit` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `estado_reserva` enum('CANCELADA','COMPLETO','EN_CHAT','PARCIAL') DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `fecha_hora_pago` datetime(6) DEFAULT NULL,
  `fecha_reserva` datetime(6) DEFAULT NULL,
  `id_pago` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `precio_reserva` double DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `tipo_factura` enum('A','B','C','E','M') DEFAULT NULL,
  `evento_id` bigint DEFAULT NULL,
  `factura_id` bigint DEFAULT NULL,
  `localidad_id` bigint DEFAULT NULL,
  `lugar_id` bigint DEFAULT NULL,
  `medio_de_pago_id` bigint DEFAULT NULL,
  `organizador_id` bigint DEFAULT NULL,
  `prestador_id` bigint DEFAULT NULL,
  `propuesta_id` bigint DEFAULT NULL,
  `servicio_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKegewpg70354n1avn6eexg1vld` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `reservas_aud` VALUES (17,311,0,NULL,NULL,NULL,'PARCIAL','2026-11-06 17:40:12.641125',NULL,NULL,'2026-11-18 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,5,3,NULL,NULL),(17,312,1,'asdasd','21-21211212-1','root@example.com','PARCIAL','2026-11-06 17:40:12.641125',NULL,NULL,'2026-11-18 00:00:00.000000',NULL,'Conferencia Tech',2300,'2613004548',NULL,10,NULL,1,2,NULL,5,3,NULL,NULL),(18,321,0,NULL,NULL,NULL,'PARCIAL','2026-11-06 17:43:41.648878',NULL,NULL,'2026-11-16 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,5,3,NULL,NULL),(18,322,1,'Arce','21-21211212-1','alear12373@gmail.com','PARCIAL','2026-11-06 17:43:41.648878',NULL,NULL,'2026-11-16 00:00:00.000000',NULL,'Conferencia Tech',2000,'2613004548',NULL,11,NULL,1,1,NULL,5,3,NULL,NULL),(18,323,1,'Arce','21-21211212-1','aleaceeeee12373@gmail.com','PARCIAL','2026-11-06 17:43:41.648878',NULL,NULL,'2026-11-16 00:00:00.000000',NULL,'Conferencia Tech',2000,'2613004548',NULL,11,NULL,1,1,NULL,5,3,NULL,NULL),(19,328,0,NULL,NULL,NULL,'EN_CHAT','2026-11-06 17:46:34.001421',NULL,NULL,'2026-11-19 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,2,NULL,1),(19,336,1,NULL,NULL,NULL,'EN_CHAT','2026-11-06 17:46:34.001421',NULL,NULL,'2026-11-19 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,5,2,3,1),(19,337,1,'Arce','21-21211212-1','alear12373@gmail.com','EN_CHAT','2026-11-06 17:46:34.001421',NULL,NULL,'2026-11-19 00:00:00.000000',NULL,'Conferencia Tech',1988,'2613004548',NULL,12,NULL,2,NULL,NULL,5,2,3,1),(20,342,0,NULL,NULL,NULL,'PARCIAL','2026-11-06 17:52:29.668959',NULL,NULL,'2026-11-19 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,5,3,NULL,NULL),(20,343,1,'Arce','21-21211212-1','alear12373@gmail.com','PARCIAL','2026-11-06 17:52:29.668959',NULL,NULL,'2026-11-19 00:00:00.000000',NULL,'Conferencia Tech',2000,'2613004548',NULL,12,NULL,1,1,NULL,5,3,NULL,NULL),(20,346,1,'Arce','21-21211212-1','alear12373@gmail.com','PARCIAL','2026-11-06 17:52:29.668959',NULL,NULL,'2026-11-19 00:00:00.000000',NULL,'Casamiento Jorge',2000,'2613004548',NULL,12,NULL,1,1,NULL,5,3,NULL,NULL),(20,349,1,'Arce','21-21211212-1','alear12373@gmail.com','COMPLETO','2026-11-06 17:52:29.668959',NULL,'2026-11-06 20:58:11.935000','2026-11-19 00:00:00.000000','1354925959','Casamiento Jorge',2000,'2613004548','A',12,NULL,1,1,4,5,3,NULL,NULL),(20,350,1,'Arce','21-21211212-1','alear12373@gmail.com','COMPLETO','2026-11-06 17:52:29.668959',NULL,'2026-11-06 20:58:11.935000','2026-11-19 00:00:00.000000','1354925959','Casamiento Jorge',2000,'2613004548','A',12,1,1,1,4,5,3,NULL,NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseña` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `estrellas` int NOT NULL,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `fecha_hora_modificacion` datetime(6) DEFAULT NULL,
  `usuario_id` bigint NOT NULL,
  `servicio_id` bigint DEFAULT NULL,
  `lugar_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7lsflsdcxr9g6ene7xlvdj6l0` (`usuario_id`),
  KEY `FK7i8owcs2ilj7wsn66g5f132jy` (`servicio_id`),
  KEY `FKs0s82cel63ptacp0h188gpvv6` (`lugar_id`),
  CONSTRAINT `FK7i8owcs2ilj7wsn66g5f132jy` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
  CONSTRAINT `FK7lsflsdcxr9g6ene7xlvdj6l0` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKs0s82cel63ptacp0h188gpvv6` FOREIGN KEY (`lugar_id`) REFERENCES `lugares` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `reseña` VALUES (1,'muy buen servicio',3,'2026-11-06 17:30:10.000000',NULL,NULL,1,1,NULL),(2,'muy mal servicio',4,'2026-11-06 17:30:10.000000',NULL,NULL,2,1,NULL),(3,'muy buen servicio',5,'2026-11-06 17:30:10.000000',NULL,NULL,3,1,NULL),(4,'excelente servicio',3,'2026-11-06 17:30:10.000000',NULL,NULL,4,1,NULL),(5,'muy buen servicio',3,'2026-11-06 17:30:10.000000','2026-11-18 12:18:53.380363',NULL,1,NULL,1),(6,'muy mal servicio',4,'2026-11-06 17:30:10.000000',NULL,NULL,2,NULL,1),(7,'muy buen servicio',5,'2026-11-06 17:30:10.000000',NULL,NULL,3,NULL,1),(8,'excelente servicio',3,'2026-11-06 17:30:10.000000',NULL,NULL,4,NULL,1),(9,'buen servicio',4,'2026-11-18 12:19:04.833229',NULL,NULL,1,NULL,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseña_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estrellas` int DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `fecha_hora_modificacion` datetime(6) DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKccbspuy47uo28pnw127g7mggj` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `reseña_aud` VALUES (5,416,1,'muy buen servicio',3,'2026-11-06 17:30:10.000000','2026-11-18 12:18:53.380363',NULL,1),(9,417,0,'buen servicio',4,'2026-11-18 12:19:04.833229',NULL,NULL,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision` (
  `id` int NOT NULL,
  `timestamp` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_hora` datetime(6) DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `revision` VALUES (1,1793996998468,NULL,'2026-11-06 17:29:58.470174',NULL),(2,1793996998493,NULL,'2026-11-06 17:29:58.494459',NULL),(3,1793996998506,NULL,'2026-11-06 17:29:58.506861',NULL),(4,1793996998516,NULL,'2026-11-06 17:29:58.516531',NULL),(5,1793996998524,NULL,'2026-11-06 17:29:58.524541',NULL),(6,1793996998532,NULL,'2026-11-06 17:29:58.532669',NULL),(7,1793996998539,NULL,'2026-11-06 17:29:58.539264',NULL),(8,1793996998548,NULL,'2026-11-06 17:29:58.548370',NULL),(9,1793996998554,NULL,'2026-11-06 17:29:58.554891',NULL),(10,1793996998564,NULL,'2026-11-06 17:29:58.564069',NULL),(11,1793996998571,NULL,'2026-11-06 17:29:58.571557',NULL),(12,1793996998580,NULL,'2026-11-06 17:29:58.580693',NULL),(13,1793996998588,NULL,'2026-11-06 17:29:58.588802',NULL),(14,1793996998597,NULL,'2026-11-06 17:29:58.597767',NULL),(15,1793996998607,NULL,'2026-11-06 17:29:58.607120',NULL),(16,1793996998616,NULL,'2026-11-06 17:29:58.616970',NULL),(17,1793996998624,NULL,'2026-11-06 17:29:58.624528',NULL),(18,1793996998633,NULL,'2026-11-06 17:29:58.633270',NULL),(19,1793996998641,NULL,'2026-11-06 17:29:58.641385',NULL),(20,1793996998650,NULL,'2026-11-06 17:29:58.650686',NULL),(21,1793996998658,NULL,'2026-11-06 17:29:58.658410',NULL),(22,1793996998668,NULL,'2026-11-06 17:29:58.668481',NULL),(23,1793996998676,NULL,'2026-11-06 17:29:58.676262',NULL),(24,1793996998683,NULL,'2026-11-06 17:29:58.683773',NULL),(25,1793996998689,NULL,'2026-11-06 17:29:58.689842',NULL),(26,1793996998700,NULL,'2026-11-06 17:29:58.700114',NULL),(27,1793996998706,NULL,'2026-11-06 17:29:58.706799',NULL),(28,1793996998715,NULL,'2026-11-06 17:29:58.715383',NULL),(29,1793996998723,NULL,'2026-11-06 17:29:58.723385',NULL),(30,1793996998733,NULL,'2026-11-06 17:29:58.733930',NULL),(31,1793996998741,NULL,'2026-11-06 17:29:58.741717',NULL),(32,1793996998751,NULL,'2026-11-06 17:29:58.751237',NULL),(33,1793996998759,NULL,'2026-11-06 17:29:58.759275',NULL),(34,1793996998768,NULL,'2026-11-06 17:29:58.768527',NULL),(35,1793996998777,NULL,'2026-11-06 17:29:58.777046',NULL),(36,1793996998785,NULL,'2026-11-06 17:29:58.785176',NULL),(37,1793996998794,NULL,'2026-11-06 17:29:58.794338',NULL),(38,1793996998802,NULL,'2026-11-06 17:29:58.802428',NULL),(39,1793996998809,NULL,'2026-11-06 17:29:58.809574',NULL),(40,1793996998818,NULL,'2026-11-06 17:29:58.818316',NULL),(41,1793996998825,NULL,'2026-11-06 17:29:58.825827',NULL),(42,1793996998868,NULL,'2026-11-06 17:29:58.868362',NULL),(43,1793996998900,NULL,'2026-11-06 17:29:58.900914',NULL),(44,1793996998917,NULL,'2026-11-06 17:29:58.917463',NULL),(45,1793996998927,NULL,'2026-11-06 17:29:58.927997',NULL),(46,1793996998946,NULL,'2026-11-06 17:29:58.946515',NULL),(47,1793996998958,NULL,'2026-11-06 17:29:58.958063',NULL),(48,1793996998966,NULL,'2026-11-06 17:29:58.966564',NULL),(49,1793996998975,NULL,'2026-11-06 17:29:58.975066',NULL),(50,1793996998984,NULL,'2026-11-06 17:29:58.984072',NULL),(51,1793996998992,NULL,'2026-11-06 17:29:58.992586',NULL),(52,1793996999005,NULL,'2026-11-06 17:29:59.005385',NULL),(53,1793996999026,NULL,'2026-11-06 17:29:59.026127',NULL),(54,1793996999034,NULL,'2026-11-06 17:29:59.034646',NULL),(55,1793996999042,NULL,'2026-11-06 17:29:59.042428',NULL),(56,1793996999054,NULL,'2026-11-06 17:29:59.054103',NULL),(57,1793996999060,NULL,'2026-11-06 17:29:59.061662',NULL),(58,1793996999068,NULL,'2026-11-06 17:29:59.068636',NULL),(59,1793996999075,NULL,'2026-11-06 17:29:59.075148',NULL),(60,1793996999083,NULL,'2026-11-06 17:29:59.083211',NULL),(61,1793996999089,NULL,'2026-11-06 17:29:59.089215',NULL),(62,1793996999097,NULL,'2026-11-06 17:29:59.097160',NULL),(63,1793996999104,NULL,'2026-11-06 17:29:59.104252',NULL),(64,1793996999113,NULL,'2026-11-06 17:29:59.113318',NULL),(65,1793996999120,NULL,'2026-11-06 17:29:59.120742',NULL),(66,1793996999127,NULL,'2026-11-06 17:29:59.127332',NULL),(67,1793996999133,NULL,'2026-11-06 17:29:59.134880',NULL),(68,1793996999140,NULL,'2026-11-06 17:29:59.140526',NULL),(69,1793996999147,NULL,'2026-11-06 17:29:59.147947',NULL),(70,1793996999153,NULL,'2026-11-06 17:29:59.153601',NULL),(71,1793996999163,NULL,'2026-11-06 17:29:59.163680',NULL),(72,1793996999170,NULL,'2026-11-06 17:29:59.170273',NULL),(73,1793996999178,NULL,'2026-11-06 17:29:59.178829',NULL),(74,1793996999186,NULL,'2026-11-06 17:29:59.186046',NULL),(75,1793996999192,NULL,'2026-11-06 17:29:59.192826',NULL),(76,1793996999200,NULL,'2026-11-06 17:29:59.200439',NULL),(77,1793996999206,NULL,'2026-11-06 17:29:59.206969',NULL),(78,1793996999214,NULL,'2026-11-06 17:29:59.214747',NULL),(79,1793996999221,NULL,'2026-11-06 17:29:59.221410',NULL),(80,1793996999227,NULL,'2026-11-06 17:29:59.227959',NULL),(81,1793996999233,NULL,'2026-11-06 17:29:59.233579',NULL),(82,1793996999239,NULL,'2026-11-06 17:29:59.239952',NULL),(83,1793996999246,NULL,'2026-11-06 17:29:59.246379',NULL),(84,1793996999252,NULL,'2026-11-06 17:29:59.252978',NULL),(85,1793996999259,NULL,'2026-11-06 17:29:59.259820',NULL),(86,1793996999268,NULL,'2026-11-06 17:29:59.268431',NULL),(87,1793996999275,NULL,'2026-11-06 17:29:59.275942',NULL),(88,1793996999283,NULL,'2026-11-06 17:29:59.283557',NULL),(89,1793996999364,NULL,'2026-11-06 17:29:59.364047',NULL),(90,1793996999378,NULL,'2026-11-06 17:29:59.378647',NULL),(91,1793996999390,NULL,'2026-11-06 17:29:59.390180',NULL),(92,1793996999398,NULL,'2026-11-06 17:29:59.398366',NULL),(93,1793996999408,NULL,'2026-11-06 17:29:59.408616',NULL),(94,1793996999418,NULL,'2026-11-06 17:29:59.418302',NULL),(95,1793996999427,NULL,'2026-11-06 17:29:59.427570',NULL),(96,1793996999436,NULL,'2026-11-06 17:29:59.436857',NULL),(97,1793996999446,NULL,'2026-11-06 17:29:59.446350',NULL),(98,1793996999453,NULL,'2026-11-06 17:29:59.453286',NULL),(99,1793996999462,NULL,'2026-11-06 17:29:59.462022',NULL),(100,1793996999470,NULL,'2026-11-06 17:29:59.470415',NULL),(101,1793996999477,NULL,'2026-11-06 17:29:59.477587',NULL),(102,1793996999484,NULL,'2026-11-06 17:29:59.484123',NULL),(103,1793996999493,NULL,'2026-11-06 17:29:59.493662',NULL),(104,1793996999499,NULL,'2026-11-06 17:29:59.499794',NULL),(105,1793996999506,NULL,'2026-11-06 17:29:59.506951',NULL),(106,1793996999513,NULL,'2026-11-06 17:29:59.514111',NULL),(107,1793996999520,NULL,'2026-11-06 17:29:59.520813',NULL),(108,1793996999529,NULL,'2026-11-06 17:29:59.529135',NULL),(109,1793996999536,NULL,'2026-11-06 17:29:59.536885',NULL),(110,1793996999546,NULL,'2026-11-06 17:29:59.546059',NULL),(111,1793996999552,NULL,'2026-11-06 17:29:59.552055',NULL),(112,1793996999557,NULL,'2026-11-06 17:29:59.557756',NULL),(113,1793996999565,NULL,'2026-11-06 17:29:59.565284',NULL),(114,1793996999570,NULL,'2026-11-06 17:29:59.570287',NULL),(115,1793996999578,NULL,'2026-11-06 17:29:59.578447',NULL),(116,1793996999583,NULL,'2026-11-06 17:29:59.583448',NULL),(117,1793996999589,NULL,'2026-11-06 17:29:59.589770',NULL),(118,1793996999596,NULL,'2026-11-06 17:29:59.596321',NULL),(119,1793996999601,NULL,'2026-11-06 17:29:59.601321',NULL),(120,1793996999607,NULL,'2026-11-06 17:29:59.607475',NULL),(121,1793996999613,NULL,'2026-11-06 17:29:59.613508',NULL),(122,1793996999619,NULL,'2026-11-06 17:29:59.619046',NULL),(123,1793996999625,NULL,'2026-11-06 17:29:59.625435',NULL),(124,1793996999630,NULL,'2026-11-06 17:29:59.630955',NULL),(125,1793996999638,NULL,'2026-11-06 17:29:59.638743',NULL),(126,1793996999646,NULL,'2026-11-06 17:29:59.646550',NULL),(127,1793996999652,NULL,'2026-11-06 17:29:59.652711',NULL),(128,1793996999663,NULL,'2026-11-06 17:29:59.663050',NULL),(129,1793996999671,NULL,'2026-11-06 17:29:59.672556',NULL),(130,1793996999678,NULL,'2026-11-06 17:29:59.678578',NULL),(131,1793996999684,NULL,'2026-11-06 17:29:59.684834',NULL),(132,1793996999691,NULL,'2026-11-06 17:29:59.691102',NULL),(133,1793996999697,NULL,'2026-11-06 17:29:59.697932',NULL),(134,1793996999703,NULL,'2026-11-06 17:29:59.703996',NULL),(135,1793996999708,NULL,'2026-11-06 17:29:59.708005',NULL),(136,1793996999716,NULL,'2026-11-06 17:29:59.716131',NULL),(137,1793996999721,NULL,'2026-11-06 17:29:59.721891',NULL),(138,1793996999728,NULL,'2026-11-06 17:29:59.728242',NULL),(139,1793996999733,NULL,'2026-11-06 17:29:59.733525',NULL),(140,1793996999739,NULL,'2026-11-06 17:29:59.739523',NULL),(141,1793996999745,NULL,'2026-11-06 17:29:59.745514',NULL),(142,1793996999750,NULL,'2026-11-06 17:29:59.750943',NULL),(143,1793996999755,NULL,'2026-11-06 17:29:59.755965',NULL),(144,1793996999762,NULL,'2026-11-06 17:29:59.762106',NULL),(145,1793996999766,NULL,'2026-11-06 17:29:59.766332',NULL),(146,1793996999771,NULL,'2026-11-06 17:29:59.771333',NULL),(147,1793996999778,NULL,'2026-11-06 17:29:59.778026',NULL),(148,1793996999783,NULL,'2026-11-06 17:29:59.783553',NULL),(149,1793996999788,NULL,'2026-11-06 17:29:59.788966',NULL),(150,1793996999795,NULL,'2026-11-06 17:29:59.795498',NULL),(151,1793996999800,NULL,'2026-11-06 17:29:59.801513',NULL),(152,1793996999806,NULL,'2026-11-06 17:29:59.806464',NULL),(153,1793996999815,NULL,'2026-11-06 17:29:59.815517',NULL),(154,1793996999820,NULL,'2026-11-06 17:29:59.820361',NULL),(155,1793996999826,NULL,'2026-11-06 17:29:59.826881',NULL),(156,1793996999832,NULL,'2026-11-06 17:29:59.832106',NULL),(157,1793996999838,NULL,'2026-11-06 17:29:59.838247',NULL),(158,1793996999844,NULL,'2026-11-06 17:29:59.844750',NULL),(159,1793996999850,NULL,'2026-11-06 17:29:59.850504',NULL),(160,1793996999855,NULL,'2026-11-06 17:29:59.855638',NULL),(161,1793996999862,NULL,'2026-11-06 17:29:59.862636',NULL),(162,1793996999869,NULL,'2026-11-06 17:29:59.869380',NULL),(163,1793996999873,NULL,'2026-11-06 17:29:59.873646',NULL),(164,1793996999881,NULL,'2026-11-06 17:29:59.881798',NULL),(165,1793996999887,NULL,'2026-11-06 17:29:59.887498',NULL),(166,1793996999893,NULL,'2026-11-06 17:29:59.893854',NULL),(167,1793996999900,NULL,'2026-11-06 17:29:59.900489',NULL),(168,1793996999939,NULL,'2026-11-06 17:29:59.939096',NULL),(169,1793996999961,NULL,'2026-11-06 17:29:59.961428',NULL),(170,1793996999969,NULL,'2026-11-06 17:29:59.969072',NULL),(171,1793996999983,NULL,'2026-11-06 17:29:59.983113',NULL),(172,1793996999990,NULL,'2026-11-06 17:29:59.990635',NULL),(173,1793996999998,NULL,'2026-11-06 17:29:59.998655',NULL),(174,1793997000005,NULL,'2026-11-06 17:30:00.005888',NULL),(175,1793997000014,NULL,'2026-11-06 17:30:00.014405',NULL),(176,1793997000022,NULL,'2026-11-06 17:30:00.022207',NULL),(177,1793997000029,NULL,'2026-11-06 17:30:00.029205',NULL),(178,1793997000035,NULL,'2026-11-06 17:30:00.035855',NULL),(179,1793997000041,NULL,'2026-11-06 17:30:00.041817',NULL),(180,1793997000048,NULL,'2026-11-06 17:30:00.048824',NULL),(181,1793997000055,NULL,'2026-11-06 17:30:00.055900',NULL),(182,1793997000063,NULL,'2026-11-06 17:30:00.063451',NULL),(183,1793997000069,NULL,'2026-11-06 17:30:00.069012',NULL),(184,1793997000075,NULL,'2026-11-06 17:30:00.076243',NULL),(185,1793997000083,NULL,'2026-11-06 17:30:00.083349',NULL),(186,1793997000089,NULL,'2026-11-06 17:30:00.089303',NULL),(187,1793997000099,NULL,'2026-11-06 17:30:00.099064',NULL),(188,1793997000107,NULL,'2026-11-06 17:30:00.107569',NULL),(189,1793997000117,NULL,'2026-11-06 17:30:00.117191',NULL),(190,1793997000125,NULL,'2026-11-06 17:30:00.125713',NULL),(191,1793997000134,NULL,'2026-11-06 17:30:00.134481',NULL),(192,1793997000141,NULL,'2026-11-06 17:30:00.141995',NULL),(193,1793997000155,NULL,'2026-11-06 17:30:00.155854',NULL),(194,1793997000165,NULL,'2026-11-06 17:30:00.165024',NULL),(195,1793997000171,NULL,'2026-11-06 17:30:00.172683',NULL),(196,1793997000183,NULL,'2026-11-06 17:30:00.183563',NULL),(197,1793997000191,NULL,'2026-11-06 17:30:00.191257',NULL),(198,1793997000198,NULL,'2026-11-06 17:30:00.198242',NULL),(199,1793997000205,NULL,'2026-11-06 17:30:00.205294',NULL),(200,1793997000217,NULL,'2026-11-06 17:30:00.217949',NULL),(201,1793997000226,NULL,'2026-11-06 17:30:00.226846',NULL),(202,1793997000235,NULL,'2026-11-06 17:30:00.235418',NULL),(203,1793997000246,NULL,'2026-11-06 17:30:00.246643',NULL),(204,1793997000254,NULL,'2026-11-06 17:30:00.254336',NULL),(205,1793997000261,NULL,'2026-11-06 17:30:00.261882',NULL),(206,1793997000269,NULL,'2026-11-06 17:30:00.269549',NULL),(207,1793997000278,NULL,'2026-11-06 17:30:00.278590',NULL),(208,1793997000287,NULL,'2026-11-06 17:30:00.287652',NULL),(209,1793997000298,NULL,'2026-11-06 17:30:00.299657',NULL),(210,1793997000309,NULL,'2026-11-06 17:30:00.309630',NULL),(211,1793997000318,NULL,'2026-11-06 17:30:00.318977',NULL),(212,1793997000326,NULL,'2026-11-06 17:30:00.326046',NULL),(213,1793997000336,NULL,'2026-11-06 17:30:00.336769',NULL),(214,1793997000346,NULL,'2026-11-06 17:30:00.346587',NULL),(215,1793997000359,NULL,'2026-11-06 17:30:00.359453',NULL),(216,1793997000369,NULL,'2026-11-06 17:30:00.369741',NULL),(217,1793997000380,NULL,'2026-11-06 17:30:00.380794',NULL),(218,1793997000388,NULL,'2026-11-06 17:30:00.388306',NULL),(219,1793997000398,NULL,'2026-11-06 17:30:00.398614',NULL),(220,1793997000406,NULL,'2026-11-06 17:30:00.406680',NULL),(221,1793997000416,NULL,'2026-11-06 17:30:00.416074',NULL),(222,1793997000422,NULL,'2026-11-06 17:30:00.422723',NULL),(223,1793997000432,NULL,'2026-11-06 17:30:00.432813',NULL),(224,1793997000441,NULL,'2026-11-06 17:30:00.441411',NULL),(225,1793997000451,NULL,'2026-11-06 17:30:00.451737',NULL),(226,1793997000461,NULL,'2026-11-06 17:30:00.462345',NULL),(227,1793997000470,NULL,'2026-11-06 17:30:00.470385',NULL),(228,1793997000482,NULL,'2026-11-06 17:30:00.482035',NULL),(229,1793997000490,NULL,'2026-11-06 17:30:00.490001',NULL),(230,1793997000503,NULL,'2026-11-06 17:30:00.504118',NULL),(231,1793997000513,NULL,'2026-11-06 17:30:00.513193',NULL),(232,1793997000596,NULL,'2026-11-06 17:30:00.596112',NULL),(233,1793997000607,NULL,'2026-11-06 17:30:00.607907',NULL),(234,1793997000625,NULL,'2026-11-06 17:30:00.625664',NULL),(235,1793997000633,NULL,'2026-11-06 17:30:00.634740',NULL),(236,1793997000643,NULL,'2026-11-06 17:30:00.643906',NULL),(237,1793997000653,NULL,'2026-11-06 17:30:00.653960',NULL),(238,1793997000666,NULL,'2026-11-06 17:30:00.666721',NULL),(239,1793997000674,NULL,'2026-11-06 17:30:00.674866',NULL),(240,1793997000684,NULL,'2026-11-06 17:30:00.684634',NULL),(241,1793997000692,NULL,'2026-11-06 17:30:00.692852',NULL),(242,1793997000703,NULL,'2026-11-06 17:30:00.703415',NULL),(243,1793997000718,NULL,'2026-11-06 17:30:00.718345',NULL),(244,1793997000729,NULL,'2026-11-06 17:30:00.729257',NULL),(245,1793997000739,NULL,'2026-11-06 17:30:00.739427',NULL),(246,1793997000751,NULL,'2026-11-06 17:30:00.751416',NULL),(247,1793997000764,NULL,'2026-11-06 17:30:00.764622',NULL),(248,1793997000774,NULL,'2026-11-06 17:30:00.774153',NULL),(249,1793997000788,NULL,'2026-11-06 17:30:00.788391',NULL),(250,1793997000799,NULL,'2026-11-06 17:30:00.799969',NULL),(251,1793997000816,NULL,'2026-11-06 17:30:00.816485',NULL),(252,1793997000829,NULL,'2026-11-06 17:30:00.829536',NULL),(253,1793997000851,NULL,'2026-11-06 17:30:00.851421',NULL),(254,1793997000865,NULL,'2026-11-06 17:30:00.865325',NULL),(255,1793997000877,NULL,'2026-11-06 17:30:00.877209',NULL),(256,1793997000891,NULL,'2026-11-06 17:30:00.891466',NULL),(257,1793997000906,NULL,'2026-11-06 17:30:00.906397',NULL),(258,1793997000916,NULL,'2026-11-06 17:30:00.916969',NULL),(259,1793997000927,NULL,'2026-11-06 17:30:00.927245',NULL),(260,1793997000936,NULL,'2026-11-06 17:30:00.936344',NULL),(261,1793997000947,NULL,'2026-11-06 17:30:00.947625',NULL),(262,1793997000955,NULL,'2026-11-06 17:30:00.955786',NULL),(263,1793997000964,NULL,'2026-11-06 17:30:00.964893',NULL),(264,1793997000974,NULL,'2026-11-06 17:30:00.974059',NULL),(265,1793997000983,NULL,'2026-11-06 17:30:00.983628',NULL),(266,1793997000992,NULL,'2026-11-06 17:30:00.992673',NULL),(267,1793997001000,NULL,'2026-11-06 17:30:01.000279',NULL),(268,1793997001011,NULL,'2026-11-06 17:30:01.011177',NULL),(269,1793997001019,NULL,'2026-11-06 17:30:01.019131',NULL),(270,1793997001029,NULL,'2026-11-06 17:30:01.029750',NULL),(271,1793997001036,NULL,'2026-11-06 17:30:01.036818',NULL),(272,1793997001048,NULL,'2026-11-06 17:30:01.048066',NULL),(273,1793997001054,NULL,'2026-11-06 17:30:01.054605',NULL),(274,1793997001065,NULL,'2026-11-06 17:30:01.065353',NULL),(275,1793997001075,NULL,'2026-11-06 17:30:01.075398',NULL),(276,1793997001085,NULL,'2026-11-06 17:30:01.085079',NULL),(277,1793997001097,NULL,'2026-11-06 17:30:01.097769',NULL),(278,1793997001105,NULL,'2026-11-06 17:30:01.105101',NULL),(279,1793997001190,NULL,'2026-11-06 17:30:01.190671',NULL),(280,1793997001201,NULL,'2026-11-06 17:30:01.201324',NULL),(281,1793997001219,NULL,'2026-11-06 17:30:01.219539',NULL),(282,1793997001228,NULL,'2026-11-06 17:30:01.228896',NULL),(283,1793997001239,NULL,'2026-11-06 17:30:01.239270',NULL),(284,1793997001248,NULL,'2026-11-06 17:30:01.248984',NULL),(285,1793997001257,NULL,'2026-11-06 17:30:01.257043',NULL),(286,1793997001267,NULL,'2026-11-06 17:30:01.267927',NULL),(287,1793997001276,NULL,'2026-11-06 17:30:01.276970',NULL),(288,1793997001285,NULL,'2026-11-06 17:30:01.285006',NULL),(289,1793997001294,NULL,'2026-11-06 17:30:01.294304',NULL),(290,1793997001301,NULL,'2026-11-06 17:30:01.301371',NULL),(291,1793997001312,NULL,'2026-11-06 17:30:01.312688',NULL),(292,1793997001322,NULL,'2026-11-06 17:30:01.322265',NULL),(293,1793997001331,NULL,'2026-11-06 17:30:01.332838',NULL),(294,1793997001339,NULL,'2026-11-06 17:30:01.339999',NULL),(295,1793997001348,NULL,'2026-11-06 17:30:01.348135',NULL),(296,1793997001356,NULL,'2026-11-06 17:30:01.356138',NULL),(297,1793997001363,NULL,'2026-11-06 17:30:01.363746',NULL),(298,1793997001372,NULL,'2026-11-06 17:30:01.372453',NULL),(299,1793997001381,NULL,'2026-11-06 17:30:01.381663',NULL),(300,1793997001388,NULL,'2026-11-06 17:30:01.388338',NULL),(301,1793997001398,NULL,'2026-11-06 17:30:01.398396',NULL),(302,1793997479321,NULL,'2026-11-06 17:37:59.321061',NULL),(303,1793997501636,'arce123@gmail.com','2026-11-06 17:38:21.636345',5),(304,1793997508102,NULL,'2026-11-06 17:38:28.102796',NULL),(305,1793997508209,NULL,'2026-11-06 17:38:28.209601',NULL),(306,1793997538959,NULL,'2026-11-06 17:38:58.959434',NULL),(307,1793997539011,NULL,'2026-11-06 17:38:59.011155',NULL),(308,1793997593934,NULL,'2026-11-06 17:39:53.934123',NULL),(309,1793997593979,NULL,'2026-11-06 17:39:53.979672',NULL),(310,1793997611310,'arce123@gmail.com','2026-11-06 17:40:11.310668',5),(311,1793997612657,'arce123@gmail.com','2026-11-06 17:40:12.657610',5),(312,1793997630227,'arce123@gmail.com','2026-11-06 17:40:30.227327',5),(313,1793997658616,NULL,'2026-11-06 17:40:58.616343',NULL),(314,1793997665111,'weventlyempresa@gmail.com','2026-11-06 17:41:05.111762',99),(315,1793997690023,NULL,'2026-11-06 17:41:30.023150',NULL),(316,1793997715124,NULL,'2026-11-06 17:41:55.124293',NULL),(317,1793997715173,NULL,'2026-11-06 17:41:55.173882',NULL),(318,1793997795682,'arce123@gmail.com','2026-11-06 17:43:15.682971',5),(319,1793997809931,NULL,'2026-11-06 17:43:29.931486',NULL),(320,1793997810002,NULL,'2026-11-06 17:43:30.002021',NULL),(321,1793997821657,'arce123@gmail.com','2026-11-06 17:43:41.657676',5),(322,1793997832123,'arce123@gmail.com','2026-11-06 17:43:52.123286',5),(323,1793997877752,'arce123@gmail.com','2026-11-06 17:44:37.752207',5),(324,1793997929883,NULL,'2026-11-06 17:45:29.883278',NULL),(325,1793997946803,NULL,'2026-11-06 17:45:46.803806',NULL),(326,1793997946847,NULL,'2026-11-06 17:45:46.847091',NULL),(327,1793997992158,'arce123@gmail.com','2026-11-06 17:46:32.158227',5),(328,1793997994009,'arce123@gmail.com','2026-11-06 17:46:34.009641',5),(329,1793997994023,'arce123@gmail.com','2026-11-06 17:46:34.023421',5),(330,1793997996997,NULL,'2026-11-06 17:46:36.997093',NULL),(331,1793997997014,NULL,'2026-11-06 17:46:37.014510',NULL),(332,1793998000986,'cristian123@gmail.com','2026-11-06 17:46:40.986883',2),(333,1793998003024,NULL,'2026-11-06 17:46:43.024093',NULL),(334,1793998003030,NULL,'2026-11-06 17:46:43.030931',NULL),(335,1793998014029,'cristian123@gmail.com','2026-11-06 17:46:54.029238',2),(336,1793998020598,'arce123@gmail.com','2026-11-06 17:47:00.598392',5),(337,1793998039638,'arce123@gmail.com','2026-11-06 17:47:19.638704',5),(338,1793998044042,'arce123@gmail.com','2026-11-06 17:47:24.042592',5),(339,1793998049209,'arce123@gmail.com','2026-11-06 17:47:29.209120',5),(340,1793998345027,NULL,'2026-11-06 17:52:25.027403',NULL),(341,1793998345076,NULL,'2026-11-06 17:52:25.076135',NULL),(342,1793998349683,'arce123@gmail.com','2026-11-06 17:52:29.683997',5),(343,1793998359490,'arce123@gmail.com','2026-11-06 17:52:39.490123',5),(344,1793998442018,NULL,'2026-11-06 17:54:02.018580',NULL),(345,1793998447999,'weventlyempresa@gmail.com','2026-11-06 17:54:08.000243',99),(346,1793998464811,'arce123@gmail.com','2026-11-06 17:54:24.811245',5),(347,1793998510516,NULL,'2026-11-06 17:55:10.516262',NULL),(348,1793998691883,NULL,'2026-11-06 17:58:11.883573',NULL),(349,1793998691896,'arce123@gmail.com','2026-11-06 17:58:11.896611',5),(350,1793998694203,NULL,'2026-11-06 17:58:14.203286',NULL),(351,1793999506255,NULL,'2026-11-06 18:11:46.255082',NULL),(352,1793999506311,NULL,'2026-11-06 18:11:46.311763',NULL),(402,1795013537718,NULL,'2026-11-18 11:52:17.723473',NULL),(403,1795014973691,NULL,'2026-11-18 12:16:13.691954',NULL),(404,1795015019918,NULL,'2026-11-18 12:16:59.918699',NULL),(405,1795015019941,NULL,'2026-11-18 12:16:59.941111',NULL),(406,1795015030972,NULL,'2026-11-18 12:17:10.972004',NULL),(407,1795015077713,'alear12373@gmail.com','2026-11-18 12:17:57.713587',1),(408,1795015090580,NULL,'2026-11-18 12:18:10.580291',NULL),(409,1795015090752,NULL,'2026-11-18 12:18:10.752376',NULL),(410,1795015099067,NULL,'2026-11-18 12:18:19.067227',NULL),(411,1795015099134,NULL,'2026-11-18 12:18:19.134491',NULL),(412,1795015105779,NULL,'2026-11-18 12:18:25.780282',NULL),(413,1795015105837,NULL,'2026-11-18 12:18:25.837133',NULL),(414,1795015115059,NULL,'2026-11-18 12:18:35.059786',NULL),(415,1795015115116,NULL,'2026-11-18 12:18:35.116946',NULL),(416,1795015133380,'alear12373@gmail.com','2026-11-18 12:18:53.380363',1),(417,1795015144853,'alear12373@gmail.com','2026-11-18 12:19:04.853364',1),(418,1795015150981,NULL,'2026-11-18 12:19:10.981406',NULL),(419,1795015151038,NULL,'2026-11-18 12:19:11.038434',NULL),(420,1795021766004,NULL,'2026-11-18 14:09:26.007957',NULL),(421,1795023840195,NULL,'2026-11-18 14:44:00.195004',NULL),(422,1795023840304,NULL,'2026-11-18 14:44:00.304270',NULL),(423,1795023845431,NULL,'2026-11-18 14:44:05.431752',NULL),(424,1795023845557,NULL,'2026-11-18 14:44:05.557126',NULL),(425,1795030208606,NULL,'2026-11-18 16:30:08.608531',NULL),(426,1795030208779,NULL,'2026-11-18 16:30:08.779491',NULL),(427,1795035935185,NULL,'2026-11-18 18:05:35.185080',NULL),(428,1795035935292,NULL,'2026-11-18 18:05:35.292403',NULL),(429,1795037953618,NULL,'2026-11-18 18:39:13.619332',NULL),(430,1795037953829,NULL,'2026-11-18 18:39:13.829665',NULL),(431,1795039070353,NULL,'2026-11-18 18:57:50.353366',NULL),(432,1795039105607,'weventlyempresa@gmail.com','2026-11-18 18:58:25.607739',99),(452,1795042101611,NULL,'2026-11-18 19:48:21.615335',NULL),(502,1795043219527,'weventlyempresa@gmail.com','2026-11-18 20:06:59.535005',99);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `revision_seq` VALUES (601);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_grupo` (
  `rol_id` bigint NOT NULL,
  `grupo_id` bigint NOT NULL,
  KEY `FK1h9cngmn52qnym3ylodrqebcx` (`grupo_id`),
  KEY `FKn716jy6gb0q1rb4av7rrkhdqx` (`rol_id`),
  CONSTRAINT `FK1h9cngmn52qnym3ylodrqebcx` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`),
  CONSTRAINT `FKn716jy6gb0q1rb4av7rrkhdqx` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `rol_grupo` VALUES (4,1),(1,2),(1,4),(1,5),(1,3),(2,2),(2,4),(2,5),(2,3),(3,2),(3,4),(3,5),(3,3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_grupo_aud` (
  `rev` int NOT NULL,
  `rol_id` bigint NOT NULL,
  `grupo_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`rol_id`,`grupo_id`),
  CONSTRAINT `FKf22o8bljh7xqk725tivnk6cku` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activo` bit(1) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `pantalla_inicio` varchar(255) DEFAULT NULL,
  `tiene_privilegios` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ldv0v52e0udsh2h1rs0r0gw1n` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `roles` VALUES (1,_binary '','Usuario que crea y gestiona eventos dentro de la plataforma','2026-11-06 17:30:10.000000',NULL,'Organizador','Inicio',_binary '\0'),(2,_binary '','Usuario que ofrece servicios para los eventos','2026-11-06 17:30:10.000000',NULL,'Prestador','Inicio',_binary '\0'),(3,_binary '','Usuario que registra y administra lugares en la plataforma','2026-11-06 17:30:10.000000',NULL,'Propietario','Inicio',_binary '\0'),(4,_binary '','Usuario que tiene privilegios','2026-11-06 17:30:10.000000',NULL,'Admin','Inicio',_binary '');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `activo` bit(1) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pantalla_inicio` varchar(255) DEFAULT NULL,
  `tiene_privilegios` bit(1) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKqw2bty0n1tq1wrasuujp6oyge` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_imagen_aud` (
  `rev` int NOT NULL,
  `servicio_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`servicio_id`,`id`),
  CONSTRAINT `FKup9wbqwclu0x64269mvjn4v7` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_reseña_aud` (
  `rev` int NOT NULL,
  `servicio_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`servicio_id`,`id`),
  CONSTRAINT `FKhrjhbjir9vjb27vwbqm3c8dt` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `estado_servicio_id` bigint NOT NULL,
  `prestador_id` bigint NOT NULL,
  `tipo_servicio_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKod8iu30f0ej1c30m5uu5wx4if` (`estado_servicio_id`),
  KEY `FK5qbyfe5382tn6dls8okb7bco1` (`prestador_id`),
  KEY `FKmd5u51fk77kb6t5ev0kd25svj` (`tipo_servicio_id`),
  CONSTRAINT `FK5qbyfe5382tn6dls8okb7bco1` FOREIGN KEY (`prestador_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKmd5u51fk77kb6t5ev0kd25svj` FOREIGN KEY (`tipo_servicio_id`) REFERENCES `tipos_de_servicios` (`id`),
  CONSTRAINT `FKod8iu30f0ej1c30m5uu5wx4if` FOREIGN KEY (`estado_servicio_id`) REFERENCES `estados_de_servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `servicios` VALUES (1,'el mejor servicio de catering de mendoza','2026-11-06 17:30:10.000000',NULL,'catering rosales',1,2,1),(2,'el mejor servicio de fotografía de mendoza','2026-11-06 17:30:10.000000',NULL,'fotografía rosales',2,2,2),(3,'el mejor servicio de sonido de mendoza','2026-11-06 17:30:10.000000',NULL,'sonido rosales',1,2,3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `estado_servicio_id` bigint DEFAULT NULL,
  `prestador_id` bigint DEFAULT NULL,
  `tipo_servicio_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK6h04qdhmwd1pwr4xidao3oc55` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_localidades` (
  `servicio_id` bigint NOT NULL,
  `localidad_id` bigint NOT NULL,
  KEY `FKl5v7128fuoyvdbbwq2102xa6c` (`localidad_id`),
  KEY `FK1igroyjr24b9ok9dkjb1q03be` (`servicio_id`),
  CONSTRAINT `FK1igroyjr24b9ok9dkjb1q03be` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
  CONSTRAINT `FKl5v7128fuoyvdbbwq2102xa6c` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `servicios_localidades` VALUES (1,1),(1,2),(1,3),(2,1),(2,3),(3,1),(3,2),(3,3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_localidades_aud` (
  `rev` int NOT NULL,
  `servicio_id` bigint NOT NULL,
  `localidad_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`servicio_id`,`localidad_id`),
  CONSTRAINT `FK3yb11bv9mtgv6247dhvo4fr4u` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_soportados` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `tipo_servicio_id` bigint NOT NULL,
  `lugar_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg4wmkywgkjt8abnyw4uahx1k2` (`tipo_servicio_id`),
  KEY `FKfgm4px27vrucg5ooikh9id08k` (`lugar_id`),
  CONSTRAINT `FKfgm4px27vrucg5ooikh9id08k` FOREIGN KEY (`lugar_id`) REFERENCES `lugares` (`id`),
  CONSTRAINT `FKg4wmkywgkjt8abnyw4uahx1k2` FOREIGN KEY (`tipo_servicio_id`) REFERENCES `tipos_de_servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `servicios_soportados` VALUES (1,'2026-11-06 17:30:10.000000',NULL,1,1),(2,'2026-11-06 17:30:10.000000',NULL,2,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_soportados_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `tipo_servicio_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKgoqrhqv14uqfhmnvjgaiq5wh8` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_de_eventos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `tipos_de_eventos` VALUES (1,'2026-11-06 17:30:10.000000',NULL,'Conferencia'),(2,'2026-11-06 17:30:10.000000',NULL,'Fiesta'),(3,'2026-11-06 17:30:10.000000',NULL,'Seminario'),(4,'2026-11-06 17:30:10.000000',NULL,'Taller'),(5,'2026-11-06 17:30:10.000000',NULL,'Reunión');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_de_eventos_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK9l0tr1qyhptb2bwdtadss98qc` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_de_lugares` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `tipos_de_lugares` VALUES (1,'2026-11-06 17:30:10.000000',NULL,'Salón'),(2,'2026-11-06 17:30:10.000000',NULL,'Quinta'),(3,'2026-11-06 17:30:10.000000',NULL,'Hotel'),(4,'2026-11-06 17:30:10.000000',NULL,'Club'),(5,'2026-11-06 17:30:10.000000',NULL,'Espacio Abierto');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_de_lugares_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKnbntht3pf3m6n8j5vgvjq9i2i` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_de_servicios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `tipos_de_servicios` VALUES (1,'2026-11-06 17:30:10.000000',NULL,'Catering'),(2,'2026-11-06 17:30:10.000000',NULL,'Fotografía'),(3,'2026-11-06 17:30:10.000000',NULL,'Sonido'),(4,'2026-11-06 17:30:10.000000',NULL,'Decoración'),(5,'2026-11-06 17:30:10.000000',NULL,'Transporte');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_de_servicios_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKbqh12gdug7mt4pxhqm7cpyqvd` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_evento_aud` (
  `rev` int NOT NULL,
  `usuario_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`usuario_id`,`id`),
  CONSTRAINT `FKovex96wck9q4gor6elaukrnbl` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `usuario_evento_aud` VALUES (303,5,9,0),(310,5,10,0),(318,5,11,0),(327,5,12,0),(407,1,13,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `rol_id` bigint NOT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbt9i9yrb9ug88xnh82n9m60pr` (`rol_id`),
  KEY `FKuu9tea04xb29m2km5lwe46ua` (`usuario_id`),
  CONSTRAINT `FKbt9i9yrb9ug88xnh82n9m60pr` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKuu9tea04xb29m2km5lwe46ua` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `usuario_roles` VALUES (1,'2026-11-06 17:30:10.000000',NULL,1,1),(2,'2026-11-06 17:30:10.000000',NULL,2,2),(3,'2026-11-06 17:30:10.000000',NULL,3,3),(4,'2026-11-06 17:30:10.000000',NULL,1,4),(5,'2026-11-06 17:30:10.000000',NULL,1,5),(6,'2026-11-06 17:30:10.000000',NULL,4,99);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_roles_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `rol_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKt2j5pr6hxoegwgjdg9kli37qb` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_usuario_rol_aud` (
  `rev` int NOT NULL,
  `usuario_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`usuario_id`,`id`),
  CONSTRAINT `FKk6bkhaah1umnvx77x6lj148u7` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dni` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `fecha_nacimiento` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `genero_id` bigint NOT NULL,
  `imagen_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_kfsp0s1tflm1cwlj8idhqsad0` (`email`),
  UNIQUE KEY `UK_pqboy6jnglinetp2xvyrhs0p7` (`imagen_id`),
  KEY `FK7cbljtyx7p0dy7j7ckkcikb4v` (`genero_id`),
  CONSTRAINT `FK7cbljtyx7p0dy7j7ckkcikb4v` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`),
  CONSTRAINT `FKjlhe5rhg2y8san7il8pk0ppyh` FOREIGN KEY (`imagen_id`) REFERENCES `imagenes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `usuarios` VALUES (1,'$2a$10$.Ct40vQd5JJQoX294RwYYuhBB9XJhzUTPchwCOZztQbDJD5cE3g/S','Arce','$2a$10$LyuGrEe1/boGcZYLFzqY6eemM8CSM0O./IVa.G2X42lbzWocLKyDS','alear12373@gmail.com','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','Alejandro','02617233183',1,NULL),(2,'45357644','rosales','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','cristian123@gmail.com','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','cristian','2613453456',1,NULL),(3,'45357644','silva','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','silva123@gmail.com','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','enzo','2613453456',1,NULL),(4,'45357644','palazzo','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','marcio23@gmail.com','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','marcio','2613453456',1,NULL),(5,'45357644','arce','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','arce123@gmail.com','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','alejandro','2613453456',1,NULL),(99,'','','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','weventlyempresa@gmail.com','2026-11-06 17:30:10.000000',NULL,'1990-05-15 00:00:00.000000','Administrador','',1,NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_aud` (
  `id` bigint NOT NULL,
  `rev` int NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_hora_alta` datetime(6) DEFAULT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `fecha_nacimiento` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `genero_id` bigint DEFAULT NULL,
  `imagen_id` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKpb86i1ysis93390kleqqf4di6` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `usuarios_aud` VALUES (5,303,1,'45357644','arce','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','arce123@gmail.com','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','alejandro','2613453456',1,NULL),(5,310,1,'45357644','arce','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','arce123@gmail.com','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','alejandro','2613453456',1,NULL),(5,318,1,'45357644','arce','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','arce123@gmail.com','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','alejandro','2613453456',1,NULL),(5,327,1,'45357644','arce','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','arce123@gmail.com','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','alejandro','2613453456',1,NULL),(1,404,1,'$2a$10$.Ct40vQd5JJQoX294RwYYuhBB9XJhzUTPchwCOZztQbDJD5cE3g/S','Arce','$2a$10$LyuGrEe1/boGcZYLFzqY6eemM8CSM0O./IVa.G2X42lbzWocLKyDS','alear12373@gmail.com','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','Alejandro','02617233183',1,NULL),(1,407,1,'$2a$10$.Ct40vQd5JJQoX294RwYYuhBB9XJhzUTPchwCOZztQbDJD5cE3g/S','Arce','$2a$10$LyuGrEe1/boGcZYLFzqY6eemM8CSM0O./IVa.G2X42lbzWocLKyDS','alear12373@gmail.com','2026-11-06 17:30:10.000000',NULL,'2026-11-06 17:30:10.000000','Alejandro','02617233183',1,NULL);
