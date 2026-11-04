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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_configuracion_backup_estado_backup_aud` (
  `rev` int NOT NULL,
  `backup_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`backup_id`,`rev`,`id`),
  KEY `FK9oouq5on4r645ob918jjibu1y` (`rev`),
  CONSTRAINT `FK9oouq5on4r645ob918jjibu1y` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `backup_configuracion_backup_estado_backup_aud` VALUES (302,2,2,0),(308,3,3,0),(352,4,4,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_configuracion_backup_fisico_aud` (
  `rev` int NOT NULL,
  `configuracion_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`configuracion_id`,`rev`,`id`),
  KEY `FKk7fi5rpykxr3wx99922ugpqwi` (`rev`),
  CONSTRAINT `FKk7fi5rpykxr3wx99922ugpqwi` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `backup_configuracion_backup_fisico_aud` VALUES (302,2,1,0),(308,3,2,0),(352,4,3,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
INSERT INTO `caracteristicas` VALUES (1,'2025-11-03 15:44:15.000000',NULL,'Pileta'),(2,'2025-11-03 15:44:15.000000',NULL,'Estacionamiento'),(3,'2025-11-03 15:44:15.000000',NULL,'WiFi'),(4,'2025-11-03 15:44:15.000000',NULL,'Aire acondicionado'),(5,'2025-11-03 15:44:15.000000',NULL,'Accesibilidad');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `chats` VALUES (1,'2025-11-03 15:44:15.000000',1,1,3,3,1),(2,'2025-11-03 15:44:15.000000',2,1,3,4,1);
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
INSERT INTO `estados_de_eventos` VALUES (1,'2025-11-03 15:44:15.000000',NULL,'Pendiente'),(2,'2025-11-03 15:44:15.000000',NULL,'Cancelado'),(3,'2025-11-03 15:44:15.000000',NULL,'Realizado');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `eventos` VALUES (1,'casamiento de maria y jorge','2025-10-10','2025-11-03 15:44:15.000000',NULL,'12:00:00.000000','14:00:00.000000','casamiento jorge',100,1,3,1),(2,'casamiento de mario y jorge','2025-10-10','2025-11-03 15:44:15.000000',NULL,'12:00:00.000000','14:00:00.000000','casamiento mario',200,2,2,1),(3,'casamiento de robert y maria','2025-10-10','2025-11-03 15:44:15.000000',NULL,'12:00:00.000000','14:00:00.000000','casamiento maria',300,3,3,1);
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
INSERT INTO `eventos_soportados` VALUES (1,'2025-11-03 15:44:15.000000',NULL,1,1),(2,'2025-11-03 15:44:15.000000',NULL,2,1);
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
INSERT INTO `grupo_permiso` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,98),(1,99),(1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185),(1,186),(1,187),(1,188),(1,189),(1,190),(1,191),(1,192),(1,193),(1,194),(1,195),(1,196),(1,197),(1,198),(1,199),(1,200),(1,201),(1,202),(1,203),(1,204),(1,205),(1,206),(1,207),(1,208),(1,209),(1,210),(1,211),(1,212),(1,213),(1,214),(1,215),(1,216),(1,217),(1,218),(1,219),(1,220),(1,221),(1,222),(1,223),(1,224),(1,225),(1,226),(1,227),(1,228),(1,229),(1,230),(1,231),(1,232),(1,233),(1,234),(1,235),(1,236),(1,237),(1,238),(1,239),(1,240),(1,241),(1,242),(1,243),(1,244),(1,245),(1,246),(1,247),(1,248),(1,249),(1,250),(1,251),(1,252),(1,253),(1,254),(1,255),(1,256),(1,257),(1,258),(1,259),(1,260),(1,261),(1,262),(1,263),(1,264),(1,265),(1,266),(1,267),(1,268),(1,269),(1,270),(1,271),(1,272),(1,273),(1,274),(1,275),(1,276),(1,277),(1,278),(1,279),(1,280),(1,281),(1,282),(1,283),(1,284),(1,285),(1,286),(1,287),(1,288),(1,289),(1,290),(1,291),(1,292),(1,293),(1,294),(1,295),(1,296),(1,297),(1,298),(1,299),(1,300),(1,301),(1,302),(1,303),(1,304),(1,305),(1,306),(1,307),(1,308),(1,309),(1,310),(1,311),(1,312),(1,313),(1,314),(1,315),(1,316),(1,317),(1,318),(1,319),(1,320),(1,321),(1,322),(1,323),(1,324),(1,325),(1,326),(1,327),(1,328),(1,329),(1,325),(2,22),(2,48),(2,62),(2,68),(2,84),(2,95),(2,97),(2,101),(2,119),(2,122),(2,125),(2,133),(2,134),(2,138),(2,176),(2,184),(2,189),(2,195),(2,218),(2,224),(2,227),(2,236),(2,245),(2,253),(2,268),(2,288),(2,290),(2,291),(2,303),(2,317),(2,324),(2,325),(2,326),(2,19),(2,29),(2,50),(2,76),(2,81),(2,116),(2,167),(2,206),(2,219),(2,225),(2,239),(2,265),(2,286),(2,295),(2,296),(2,297),(2,298),(2,299),(2,300),(2,313),(2,325),(3,4),(3,7),(3,15),(3,63),(3,66),(3,71),(3,79),(3,122),(3,160),(3,171),(3,172),(3,182),(3,184),(3,198),(3,217),(3,238),(3,249),(3,261),(3,274),(3,302),(3,303),(3,304),(3,306),(4,21),(4,23),(4,25),(4,27),(4,30),(4,31),(4,57),(4,59),(4,64),(4,67),(4,70),(4,73),(4,75),(4,82),(4,85),(4,89),(4,90),(4,100),(4,105),(4,106),(4,107),(4,111),(4,129),(4,132),(4,139),(4,142),(4,149),(4,151),(4,162),(4,165),(4,170),(4,174),(4,175),(4,190),(4,195),(4,201),(4,202),(4,204),(4,207),(4,210),(4,220),(4,227),(4,231),(4,232),(4,234),(4,235),(4,241),(4,243),(4,252),(4,264),(4,269),(4,275),(4,279),(4,283),(4,289),(4,290),(4,291),(4,292),(4,293),(4,295),(4,319),(4,320),(4,328),(5,103),(5,110),(5,180),(5,187),(5,202);
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
INSERT INTO `grupos` VALUES (1,'Da acceso a todos los servicios que permiten configurar los parametros del sistema','2025-11-03 15:44:15.000000',NULL,'Configuraciones'),(2,'Da acceso a todas las acciones en el modulo de Eventos','2025-11-03 15:44:15.000000',NULL,'Eventos'),(3,'Da acceso a todas las acciones en el modulo de Servicios','2025-11-03 15:44:15.000000',NULL,'Servicios'),(4,'Da acceso a todas las acciones en el modulo de Lugares','2025-11-03 15:44:15.000000',NULL,'Lugares'),(5,'Da acceso a las acciones para recuperacion de usuario y contraseña ','2025-11-03 15:44:15.000000',NULL,'Seguridad');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
INSERT INTO `localidades` VALUES (1,'2025-11-03 15:44:15.000000',NULL,'25 de Mayo',1),(2,'2025-11-03 15:44:15.000000',NULL,'3 de febrero',1),(3,'2025-11-03 15:44:15.000000',NULL,'A. Alsina',1),(4,'2025-11-03 15:44:15.000000',NULL,'A. Gonzáles Cháves',1),(5,'2025-11-03 15:44:15.000000',NULL,'Aguas Verdes',1),(6,'2025-11-03 15:44:15.000000',NULL,'Alberti',1),(7,'2025-11-03 15:44:15.000000',NULL,'Arrecifes',1),(8,'2025-11-03 15:44:15.000000',NULL,'Ayacucho',1),(9,'2025-11-03 15:44:15.000000',NULL,'Azul',1),(10,'2025-11-03 15:44:15.000000',NULL,'Bahía Blanca',1),(11,'2025-11-03 15:44:15.000000',NULL,'Balcarce',1),(12,'2025-11-03 15:44:15.000000',NULL,'Baradero',1),(13,'2025-11-03 15:44:15.000000',NULL,'Benito Juárez',1),(14,'2025-11-03 15:44:15.000000',NULL,'Berazategui',1),(15,'2025-11-03 15:44:15.000000',NULL,'Berisso',1),(16,'2025-11-03 15:44:15.000000',NULL,'Bolívar',1),(17,'2025-11-03 15:44:15.000000',NULL,'Bragado',1),(18,'2025-11-03 15:44:15.000000',NULL,'Brandsen',1),(19,'2025-11-03 15:44:15.000000',NULL,'Campana',1),(20,'2025-11-03 15:44:15.000000',NULL,'Cañuelas',1),(21,'2025-11-03 15:44:15.000000',NULL,'Capilla del Señor',1),(22,'2025-11-03 15:44:15.000000',NULL,'Capitán Sarmiento',1),(23,'2025-11-03 15:44:15.000000',NULL,'Carhué',1),(24,'2025-11-03 15:44:15.000000',NULL,'Carlos Casares',1),(25,'2025-11-03 15:44:15.000000',NULL,'Carlos Tejedor',1),(26,'2025-11-03 15:44:15.000000',NULL,'Carmen de Areco',1),(27,'2025-11-03 15:44:15.000000',NULL,'Carmen de Patagones',1),(28,'2025-11-03 15:44:15.000000',NULL,'Castelli',1),(29,'2025-11-03 15:44:15.000000',NULL,'Chacabuco',1),(30,'2025-11-03 15:44:15.000000',NULL,'Chascomús',1),(31,'2025-11-03 15:44:15.000000',NULL,'Chivilcoy',1),(32,'2025-11-03 15:44:15.000000',NULL,'Colón',1),(33,'2025-11-03 15:44:15.000000',NULL,'Coronel Dorrego',1),(34,'2025-11-03 15:44:15.000000',NULL,'Coronel Pringles',1),(35,'2025-11-03 15:44:15.000000',NULL,'Coronel Suárez',1),(36,'2025-11-03 15:44:15.000000',NULL,'Dolores',1),(37,'2025-11-03 15:44:15.000000',NULL,'Ensenada',1),(38,'2025-11-03 15:44:15.000000',NULL,'Escobar',1),(39,'2025-11-03 15:44:15.000000',NULL,'Esteban Echeverría',1),(40,'2025-11-03 15:44:15.000000',NULL,'Exaltación de la Cruz',1),(41,'2025-11-03 15:44:15.000000',NULL,'Florencio Varela',1),(42,'2025-11-03 15:44:15.000000',NULL,'Florentino Ameghino',1),(43,'2025-11-03 15:44:15.000000',NULL,'General Alvarado',1),(44,'2025-11-03 15:44:15.000000',NULL,'General Alvear',1),(45,'2025-11-03 15:44:15.000000',NULL,'General Arenales',1),(46,'2025-11-03 15:44:15.000000',NULL,'General Belgrano',1),(47,'2025-11-03 15:44:15.000000',NULL,'General Guido',1),(48,'2025-11-03 15:44:15.000000',NULL,'General Juan Madariaga',1),(49,'2025-11-03 15:44:15.000000',NULL,'General La Madrid',1),(50,'2025-11-03 15:44:15.000000',NULL,'General Las Heras',1),(51,'2025-11-03 15:44:15.000000',NULL,'General Lavalle',1),(52,'2025-11-03 15:44:15.000000',NULL,'General Paz',1),(53,'2025-11-03 15:44:15.000000',NULL,'General Pinto',1),(54,'2025-11-03 15:44:15.000000',NULL,'General Pueyrredón',1),(55,'2025-11-03 15:44:15.000000',NULL,'General Rodríguez',1),(56,'2025-11-03 15:44:15.000000',NULL,'General San Martín',1),(57,'2025-11-03 15:44:15.000000',NULL,'General Viamonte',1),(58,'2025-11-03 15:44:15.000000',NULL,'General Villegas',1),(59,'2025-11-03 15:44:15.000000',NULL,'Guaminí',1),(60,'2025-11-03 15:44:15.000000',NULL,'Henderson',1),(61,'2025-11-03 15:44:15.000000',NULL,'Hurlingham',1),(62,'2025-11-03 15:44:15.000000',NULL,'Ituzaingó',1),(63,'2025-11-03 15:44:15.000000',NULL,'José C. Paz',1),(64,'2025-11-03 15:44:15.000000',NULL,'Junín',1),(65,'2025-11-03 15:44:15.000000',NULL,'La Matanza',1),(66,'2025-11-03 15:44:15.000000',NULL,'La Plata',1),(67,'2025-11-03 15:44:15.000000',NULL,'Lanús',1),(68,'2025-11-03 15:44:15.000000',NULL,'Laprida',1),(69,'2025-11-03 15:44:15.000000',NULL,'Las Flores',1),(70,'2025-11-03 15:44:15.000000',NULL,'Leandro N. Alem',1),(71,'2025-11-03 15:44:15.000000',NULL,'Lincoln',1),(72,'2025-11-03 15:44:15.000000',NULL,'Lobería',1),(73,'2025-11-03 15:44:15.000000',NULL,'Lobos',1),(74,'2025-11-03 15:44:15.000000',NULL,'Lomas de Zamora',1),(75,'2025-11-03 15:44:15.000000',NULL,'Luján',1),(76,'2025-11-03 15:44:15.000000',NULL,'Magdalena',1),(77,'2025-11-03 15:44:15.000000',NULL,'Maipú',1),(78,'2025-11-03 15:44:15.000000',NULL,'Mar Chiquita',1),(79,'2025-11-03 15:44:15.000000',NULL,'Marcos Paz',1),(80,'2025-11-03 15:44:15.000000',NULL,'Mercedes',1),(81,'2025-11-03 15:44:15.000000',NULL,'Merlo',1),(82,'2025-11-03 15:44:15.000000',NULL,'Monte',1),(83,'2025-11-03 15:44:15.000000',NULL,'Monte Hermoso',1),(84,'2025-11-03 15:44:15.000000',NULL,'Moreno',1),(85,'2025-11-03 15:44:15.000000',NULL,'Morón',1),(86,'2025-11-03 15:44:15.000000',NULL,'Navarro',1),(87,'2025-11-03 15:44:15.000000',NULL,'Necochea',1),(88,'2025-11-03 15:44:15.000000',NULL,'Olavarría',1),(89,'2025-11-03 15:44:15.000000',NULL,'Patagones',1),(90,'2025-11-03 15:44:15.000000',NULL,'Pehuajó',1),(91,'2025-11-03 15:44:15.000000',NULL,'Pellegrini',1),(92,'2025-11-03 15:44:15.000000',NULL,'Pergamino',1),(93,'2025-11-03 15:44:15.000000',NULL,'Pila',1),(94,'2025-11-03 15:44:15.000000',NULL,'Pilar',1),(95,'2025-11-03 15:44:15.000000',NULL,'Pinamar',1),(96,'2025-11-03 15:44:15.000000',NULL,'Presidente Perón',1),(97,'2025-11-03 15:44:15.000000',NULL,'Puan',1),(98,'2025-11-03 15:44:15.000000',NULL,'Quilmes',1),(99,'2025-11-03 15:44:15.000000',NULL,'Ramallo',1),(100,'2025-11-03 15:44:15.000000',NULL,'Rauch',1),(101,'2025-11-03 15:44:15.000000',NULL,'Rivadavia',1),(102,'2025-11-03 15:44:15.000000',NULL,'Rojas',1),(103,'2025-11-03 15:44:15.000000',NULL,'Roque Pérez',1),(104,'2025-11-03 15:44:15.000000',NULL,'Saavedra',1),(105,'2025-11-03 15:44:15.000000',NULL,'Saladillo',1),(106,'2025-11-03 15:44:15.000000',NULL,'Salto',1),(107,'2025-11-03 15:44:15.000000',NULL,'San Andrés de Giles',1),(108,'2025-11-03 15:44:15.000000',NULL,'San Antonio de Areco',1),(109,'2025-11-03 15:44:15.000000',NULL,'San Cayetano',1),(110,'2025-11-03 15:44:15.000000',NULL,'San Fernando',1),(111,'2025-11-03 15:44:15.000000',NULL,'San Isidro',1),(112,'2025-11-03 15:44:15.000000',NULL,'San Miguel',1),(113,'2025-11-03 15:44:15.000000',NULL,'San Nicolás',1),(114,'2025-11-03 15:44:15.000000',NULL,'San Pedro',1),(115,'2025-11-03 15:44:15.000000',NULL,'San Vicente',1),(116,'2025-11-03 15:44:15.000000',NULL,'Suipacha',1),(117,'2025-11-03 15:44:15.000000',NULL,'Tandil',1),(118,'2025-11-03 15:44:15.000000',NULL,'Tapalqué',1),(119,'2025-11-03 15:44:15.000000',NULL,'Tigre',1),(120,'2025-11-03 15:44:15.000000',NULL,'Tordillo',1),(121,'2025-11-03 15:44:15.000000',NULL,'Tornquist',1),(122,'2025-11-03 15:44:15.000000',NULL,'Trenque Lauquen',1),(123,'2025-11-03 15:44:15.000000',NULL,'Tres Arroyos',1),(124,'2025-11-03 15:44:15.000000',NULL,'Tres de Febrero',1),(125,'2025-11-03 15:44:15.000000',NULL,'Tres Lomas',1),(126,'2025-11-03 15:44:15.000000',NULL,'Viamonte',1),(127,'2025-11-03 15:44:15.000000',NULL,'Vicente López',1),(128,'2025-11-03 15:44:15.000000',NULL,'Villa Gesell',1),(129,'2025-11-03 15:44:15.000000',NULL,'Villarino',1),(130,'2025-11-03 15:44:15.000000',NULL,'Zárate',1),(131,'2025-11-03 15:44:15.000000',NULL,'Avellaneda',2),(132,'2025-11-03 15:44:15.000000',NULL,'Berazategui',2),(133,'2025-11-03 15:44:15.000000',NULL,'Berisso',2),(134,'2025-11-03 15:44:15.000000',NULL,'Escobar',2),(135,'2025-11-03 15:44:15.000000',NULL,'Esteban Echeverría',2),(136,'2025-11-03 15:44:15.000000',NULL,'Ezeiza',2),(137,'2025-11-03 15:44:15.000000',NULL,'Florencio Varela',2),(138,'2025-11-03 15:44:15.000000',NULL,'Hurlingham',2),(139,'2025-11-03 15:44:15.000000',NULL,'Ituzaingó',2),(140,'2025-11-03 15:44:15.000000',NULL,'José C. Paz',2),(141,'2025-11-03 15:44:15.000000',NULL,'Lanús',2),(142,'2025-11-03 15:44:15.000000',NULL,'La Matanza',2),(143,'2025-11-03 15:44:15.000000',NULL,'Malvinas Argentinas',2),(144,'2025-11-03 15:44:15.000000',NULL,'Merlo',2),(145,'2025-11-03 15:44:15.000000',NULL,'Moreno',2),(146,'2025-11-03 15:44:15.000000',NULL,'Morón',2),(147,'2025-11-03 15:44:15.000000',NULL,'Quilmes',2),(148,'2025-11-03 15:44:15.000000',NULL,'San Fernando',2),(149,'2025-11-03 15:44:15.000000',NULL,'San Isidro',2),(150,'2025-11-03 15:44:15.000000',NULL,'San Martín',2),(151,'2025-11-03 15:44:15.000000',NULL,'San Miguel',2),(152,'2025-11-03 15:44:15.000000',NULL,'Tigre',2),(153,'2025-11-03 15:44:15.000000',NULL,'Tres de Febrero',2),(154,'2025-11-03 15:44:15.000000',NULL,'Vicente López',2),(155,'2025-11-03 15:44:15.000000',NULL,'Agronomía',3),(156,'2025-11-03 15:44:15.000000',NULL,'Almagro',3),(157,'2025-11-03 15:44:15.000000',NULL,'Balvanera',3),(158,'2025-11-03 15:44:15.000000',NULL,'Barracas',3),(159,'2025-11-03 15:44:15.000000',NULL,'Belgrano',3),(160,'2025-11-03 15:44:15.000000',NULL,'Boedo',3),(161,'2025-11-03 15:44:15.000000',NULL,'Caballito',3),(162,'2025-11-03 15:44:15.000000',NULL,'Chacarita',3),(163,'2025-11-03 15:44:15.000000',NULL,'Coghlan',3),(164,'2025-11-03 15:44:15.000000',NULL,'Colegiales',3),(165,'2025-11-03 15:44:15.000000',NULL,'Constitución',3),(166,'2025-11-03 15:44:15.000000',NULL,'Flores',3),(167,'2025-11-03 15:44:15.000000',NULL,'Floresta',3),(168,'2025-11-03 15:44:15.000000',NULL,'La Boca',3),(169,'2025-11-03 15:44:15.000000',NULL,'Liniers',3),(170,'2025-11-03 15:44:15.000000',NULL,'Mataderos',3),(171,'2025-11-03 15:44:15.000000',NULL,'Monserrat',3),(172,'2025-11-03 15:44:15.000000',NULL,'Monte Castro',3),(173,'2025-11-03 15:44:15.000000',NULL,'Nueva Pompeya',3),(174,'2025-11-03 15:44:15.000000',NULL,'Núñez',3),(175,'2025-11-03 15:44:15.000000',NULL,'Palermo',3),(176,'2025-11-03 15:44:15.000000',NULL,'Parque Avellaneda',3),(177,'2025-11-03 15:44:15.000000',NULL,'Parque Chacabuco',3),(178,'2025-11-03 15:44:15.000000',NULL,'Parque Patricios',3),(179,'2025-11-03 15:44:15.000000',NULL,'Paternal',3),(180,'2025-11-03 15:44:15.000000',NULL,'Puerto Madero',3),(181,'2025-11-03 15:44:15.000000',NULL,'Recoleta',3),(182,'2025-11-03 15:44:15.000000',NULL,'Retiro',3),(183,'2025-11-03 15:44:15.000000',NULL,'Saavedra',3),(184,'2025-11-03 15:44:15.000000',NULL,'San Cristóbal',3),(185,'2025-11-03 15:44:15.000000',NULL,'San Nicolás',3),(186,'2025-11-03 15:44:15.000000',NULL,'San Telmo',3),(187,'2025-11-03 15:44:15.000000',NULL,'Versalles',3),(188,'2025-11-03 15:44:15.000000',NULL,'Villa Crespo',3),(189,'2025-11-03 15:44:15.000000',NULL,'Villa del Parque',3),(190,'2025-11-03 15:44:15.000000',NULL,'Villa Devoto',3),(191,'2025-11-03 15:44:15.000000',NULL,'Villa General Mitre',3),(192,'2025-11-03 15:44:15.000000',NULL,'Villa Lugano',3),(193,'2025-11-03 15:44:15.000000',NULL,'Villa Luro',3),(194,'2025-11-03 15:44:15.000000',NULL,'Villa Ortúzar',3),(195,'2025-11-03 15:44:15.000000',NULL,'Villa Pueyrredón',3),(196,'2025-11-03 15:44:15.000000',NULL,'Villa Real',3),(197,'2025-11-03 15:44:15.000000',NULL,'Villa Riachuelo',3),(198,'2025-11-03 15:44:15.000000',NULL,'Villa Santa Rita',3),(199,'2025-11-03 15:44:15.000000',NULL,'Villa Soldati',3),(200,'2025-11-03 15:44:15.000000',NULL,'Villa Urquiza',3),(201,'2025-11-03 15:44:15.000000',NULL,'Andalgalá',4),(202,'2025-11-03 15:44:15.000000',NULL,'Belén',4),(203,'2025-11-03 15:44:15.000000',NULL,'Capayán',4),(204,'2025-11-03 15:44:15.000000',NULL,'Capital',4),(205,'2025-11-03 15:44:15.000000',NULL,'El Alto',4),(206,'2025-11-03 15:44:15.000000',NULL,'Fray Mamerto Esquiú',4),(207,'2025-11-03 15:44:15.000000',NULL,'La Paz',4),(208,'2025-11-03 15:44:15.000000',NULL,'Paclín',4),(209,'2025-11-03 15:44:15.000000',NULL,'Pomán',4),(210,'2025-11-03 15:44:15.000000',NULL,'Santa María',4),(211,'2025-11-03 15:44:15.000000',NULL,'Santa Rosa',4),(212,'2025-11-03 15:44:15.000000',NULL,'Tinogasta',4),(213,'2025-11-03 15:44:15.000000',NULL,'Valle Viejo',4),(214,'2025-11-03 15:44:15.000000',NULL,'Barranqueras',5),(215,'2025-11-03 15:44:15.000000',NULL,'Basail',5),(216,'2025-11-03 15:44:15.000000',NULL,'Campo Largo',5),(217,'2025-11-03 15:44:15.000000',NULL,'Capitán Solari',5),(218,'2025-11-03 15:44:15.000000',NULL,'Charata',5),(219,'2025-11-03 15:44:15.000000',NULL,'Colonia Benítez',5),(220,'2025-11-03 15:44:15.000000',NULL,'Colonia Elisa',5),(221,'2025-11-03 15:44:15.000000',NULL,'Colonia Popular',5),(222,'2025-11-03 15:44:15.000000',NULL,'Colonias Unidas',5),(223,'2025-11-03 15:44:15.000000',NULL,'Concepción del Bermejo',5),(224,'2025-11-03 15:44:15.000000',NULL,'Corrientes',5),(225,'2025-11-03 15:44:15.000000',NULL,'Fontana',5),(226,'2025-11-03 15:44:15.000000',NULL,'Gancedo',5),(227,'2025-11-03 15:44:15.000000',NULL,'General Capdevila',5),(228,'2025-11-03 15:44:15.000000',NULL,'General José de San Martín',5),(229,'2025-11-03 15:44:15.000000',NULL,'General Pinedo',5),(230,'2025-11-03 15:44:15.000000',NULL,'General Vedia',5),(231,'2025-11-03 15:44:15.000000',NULL,'Hermoso Campo',5),(232,'2025-11-03 15:44:15.000000',NULL,'Isla del Cerrito',5),(233,'2025-11-03 15:44:15.000000',NULL,'Juan José Castelli',5),(234,'2025-11-03 15:44:15.000000',NULL,'La Clotilde',5),(235,'2025-11-03 15:44:15.000000',NULL,'La Eduvigis',5),(236,'2025-11-03 15:44:15.000000',NULL,'La Escondida',5),(237,'2025-11-03 15:44:15.000000',NULL,'La Leonesa',5),(238,'2025-11-03 15:44:15.000000',NULL,'La Tigra',5),(239,'2025-11-03 15:44:15.000000',NULL,'La Verde',5),(240,'2025-11-03 15:44:15.000000',NULL,'Laguna Blanca',5),(241,'2025-11-03 15:44:15.000000',NULL,'Laguna Limpia',5),(242,'2025-11-03 15:44:15.000000',NULL,'Lapachito',5),(243,'2025-11-03 15:44:15.000000',NULL,'Las Breñas',5),(244,'2025-11-03 15:44:15.000000',NULL,'Las Garcitas',5),(245,'2025-11-03 15:44:15.000000',NULL,'Las Palmas',5),(246,'2025-11-03 15:44:15.000000',NULL,'Los Frentones',5),(247,'2025-11-03 15:44:15.000000',NULL,'Machagai',5),(248,'2025-11-03 15:44:15.000000',NULL,'Makallé',5),(249,'2025-11-03 15:44:15.000000',NULL,'Margarita Belén',5),(250,'2025-11-03 15:44:15.000000',NULL,'Miraflores',5),(251,'2025-11-03 15:44:15.000000',NULL,'Napenay',5),(252,'2025-11-03 15:44:15.000000',NULL,'Pampa Almirón',5),(253,'2025-11-03 15:44:15.000000',NULL,'Pampa del Indio',5),(254,'2025-11-03 15:44:15.000000',NULL,'Pampa del Infierno',5),(255,'2025-11-03 15:44:15.000000',NULL,'Presidencia de la Plaza',5),(256,'2025-11-03 15:44:15.000000',NULL,'Presidencia Roca',5),(257,'2025-11-03 15:44:15.000000',NULL,'Presidencia Roque Sáenz Peña',5),(258,'2025-11-03 15:44:15.000000',NULL,'Puerto Bermejo',5),(259,'2025-11-03 15:44:15.000000',NULL,'Puerto Eva Perón',5),(260,'2025-11-03 15:44:15.000000',NULL,'Puerto Tirol',5),(261,'2025-11-03 15:44:15.000000',NULL,'Puerto Vilelas',5),(262,'2025-11-03 15:44:15.000000',NULL,'Quitilipi',5),(263,'2025-11-03 15:44:15.000000',NULL,'Resistencia',5),(264,'2025-11-03 15:44:15.000000',NULL,'Sáenz Peña',5),(265,'2025-11-03 15:44:15.000000',NULL,'Samuhú',5),(266,'2025-11-03 15:44:15.000000',NULL,'San Bernardo',5),(267,'2025-11-03 15:44:15.000000',NULL,'Santa Sylvina',5),(268,'2025-11-03 15:44:15.000000',NULL,'Selvas del Río de Oro',5),(269,'2025-11-03 15:44:15.000000',NULL,'Taco Pozo',5),(270,'2025-11-03 15:44:15.000000',NULL,'Tres Isletas',5),(271,'2025-11-03 15:44:15.000000',NULL,'Villa Ángela',5),(272,'2025-11-03 15:44:15.000000',NULL,'Villa Berthet',5),(273,'2025-11-03 15:44:15.000000',NULL,'Villa Río Bermejito',5),(274,'2025-11-03 15:44:15.000000',NULL,'Aldea Apeleg',6),(275,'2025-11-03 15:44:15.000000',NULL,'Aldea Beleiro',6),(276,'2025-11-03 15:44:15.000000',NULL,'Aldea Epulef',6),(277,'2025-11-03 15:44:15.000000',NULL,'Alto Río Senguer',6),(278,'2025-11-03 15:44:15.000000',NULL,'Buen Pasto',6),(279,'2025-11-03 15:44:15.000000',NULL,'Camarones',6),(280,'2025-11-03 15:44:15.000000',NULL,'Carrenleufú',6),(281,'2025-11-03 15:44:15.000000',NULL,'Cholila',6),(282,'2025-11-03 15:44:15.000000',NULL,'Colet',6),(283,'2025-11-03 15:44:15.000000',NULL,'Comodoro Rivadavia',6),(284,'2025-11-03 15:44:15.000000',NULL,'Corcovado',6),(285,'2025-11-03 15:44:15.000000',NULL,'Cushamen',6),(286,'2025-11-03 15:44:15.000000',NULL,'Dique Florentino Ameghino',6),(287,'2025-11-03 15:44:15.000000',NULL,'Dolavon',6),(288,'2025-11-03 15:44:15.000000',NULL,'El Hoyo',6),(289,'2025-11-03 15:44:15.000000',NULL,'El Maitén',6),(290,'2025-11-03 15:44:15.000000',NULL,'Epuyén',6),(291,'2025-11-03 15:44:15.000000',NULL,'Esquel',6),(292,'2025-11-03 15:44:15.000000',NULL,'Facundo',6),(293,'2025-11-03 15:44:15.000000',NULL,'Gaimán',6),(294,'2025-11-03 15:44:15.000000',NULL,'Gan Gan',6),(295,'2025-11-03 15:44:15.000000',NULL,'Gastre',6),(296,'2025-11-03 15:44:15.000000',NULL,'Gobernador Costa',6),(297,'2025-11-03 15:44:15.000000',NULL,'Gualjaina',6),(298,'2025-11-03 15:44:15.000000',NULL,'José de San Martín',6),(299,'2025-11-03 15:44:15.000000',NULL,'Lago Blanco',6),(300,'2025-11-03 15:44:15.000000',NULL,'Lago Puelo',6),(301,'2025-11-03 15:44:15.000000',NULL,'Las Plumas',6),(302,'2025-11-03 15:44:15.000000',NULL,'Paso de Indios',6),(303,'2025-11-03 15:44:15.000000',NULL,'Paso del Sapo',6),(304,'2025-11-03 15:44:15.000000',NULL,'Puerto Madryn',6),(305,'2025-11-03 15:44:15.000000',NULL,'Puerto Pirámides',6),(306,'2025-11-03 15:44:15.000000',NULL,'Rada Tilly',6),(307,'2025-11-03 15:44:15.000000',NULL,'Rawson',6),(308,'2025-11-03 15:44:15.000000',NULL,'Río Mayo',6),(309,'2025-11-03 15:44:15.000000',NULL,'Río Pico',6),(310,'2025-11-03 15:44:15.000000',NULL,'Sarmiento',6),(311,'2025-11-03 15:44:15.000000',NULL,'Tecka',6),(312,'2025-11-03 15:44:15.000000',NULL,'Trelew',6),(313,'2025-11-03 15:44:15.000000',NULL,'Trevelin',6),(314,'2025-11-03 15:44:15.000000',NULL,'Villa Futalaufquen',6),(315,'2025-11-03 15:44:15.000000',NULL,'Alcira Gigena',7),(316,'2025-11-03 15:44:15.000000',NULL,'Alta Gracia',7),(317,'2025-11-03 15:44:15.000000',NULL,'Arroyito',7),(318,'2025-11-03 15:44:15.000000',NULL,'Bell Ville',7),(319,'2025-11-03 15:44:15.000000',NULL,'Brinkmann',7),(320,'2025-11-03 15:44:15.000000',NULL,'Córdoba Capital',7),(321,'2025-11-03 15:44:15.000000',NULL,'Cosquín',7),(322,'2025-11-03 15:44:15.000000',NULL,'Corral de Bustos',7),(323,'2025-11-03 15:44:15.000000',NULL,'Cruz del Eje',7),(324,'2025-11-03 15:44:15.000000',NULL,'Deán Funes',7),(325,'2025-11-03 15:44:15.000000',NULL,'Embalse',7),(326,'2025-11-03 15:44:15.000000',NULL,'Jesús María',7),(327,'2025-11-03 15:44:15.000000',NULL,'La Carlota',7),(328,'2025-11-03 15:44:15.000000',NULL,'La Falda',7),(329,'2025-11-03 15:44:15.000000',NULL,'Laboulaye',7),(330,'2025-11-03 15:44:15.000000',NULL,'Las Varillas',7),(331,'2025-11-03 15:44:15.000000',NULL,'Leones',7),(332,'2025-11-03 15:44:15.000000',NULL,'Marcos Juárez',7),(333,'2025-11-03 15:44:15.000000',NULL,'Minas',7),(334,'2025-11-03 15:44:15.000000',NULL,'Morteros',7),(335,'2025-11-03 15:44:15.000000',NULL,'Oncativo',7),(336,'2025-11-03 15:44:15.000000',NULL,'Río Cuarto',7),(337,'2025-11-03 15:44:15.000000',NULL,'Río Tercero',7),(338,'2025-11-03 15:44:15.000000',NULL,'San Francisco',7),(339,'2025-11-03 15:44:15.000000',NULL,'Salsipuedes',7),(340,'2025-11-03 15:44:15.000000',NULL,'Santa María de Punilla',7),(341,'2025-11-03 15:44:15.000000',NULL,'Tanti',7),(342,'2025-11-03 15:44:15.000000',NULL,'Unquillo',7),(343,'2025-11-03 15:44:15.000000',NULL,'Valle Hermoso',7),(344,'2025-11-03 15:44:15.000000',NULL,'Villa Allende',7),(345,'2025-11-03 15:44:15.000000',NULL,'Villa Carlos Paz',7),(346,'2025-11-03 15:44:15.000000',NULL,'Villa Dolores',7),(347,'2025-11-03 15:44:15.000000',NULL,'Villa María',7),(348,'2025-11-03 15:44:15.000000',NULL,'Villa Nueva',7),(349,'2025-11-03 15:44:15.000000',NULL,'Villa Rumipal',7),(350,'2025-11-03 15:44:15.000000',NULL,'Villa Santa Rosa',7),(351,'2025-11-03 15:44:15.000000',NULL,'Villa del Rosario',7),(352,'2025-11-03 15:44:15.000000',NULL,'Villa General Belgrano',7),(353,'2025-11-03 15:44:15.000000',NULL,'Villa Huidobro',7),(354,'2025-11-03 15:44:15.000000',NULL,'Villa Sarmiento',7),(355,'2025-11-03 15:44:15.000000',NULL,'Villa Valeria',7),(356,'2025-11-03 15:44:15.000000',NULL,'Vicuña Mackenna',7),(357,'2025-11-03 15:44:15.000000',NULL,'Alvear',8),(358,'2025-11-03 15:44:15.000000',NULL,'Bella Vista',8),(359,'2025-11-03 15:44:15.000000',NULL,'Berón de Astrada',8),(360,'2025-11-03 15:44:15.000000',NULL,'Bonpland',8),(361,'2025-11-03 15:44:15.000000',NULL,'Caá Catí',8),(362,'2025-11-03 15:44:15.000000',NULL,'Capital',8),(363,'2025-11-03 15:44:15.000000',NULL,'Colonia Carlos Pellegrini',8),(364,'2025-11-03 15:44:15.000000',NULL,'Concepción',8),(365,'2025-11-03 15:44:15.000000',NULL,'Corrientes',8),(366,'2025-11-03 15:44:15.000000',NULL,'Curuzú Cuatiá',8),(367,'2025-11-03 15:44:15.000000',NULL,'Empedrado',8),(368,'2025-11-03 15:44:15.000000',NULL,'Esquina',8),(369,'2025-11-03 15:44:15.000000',NULL,'Goya',8),(370,'2025-11-03 15:44:15.000000',NULL,'Gobernador Virasoro',8),(371,'2025-11-03 15:44:15.000000',NULL,'Itatí',8),(372,'2025-11-03 15:44:15.000000',NULL,'Ituzaingó',8),(373,'2025-11-03 15:44:15.000000',NULL,'La Cruz',8),(374,'2025-11-03 15:44:15.000000',NULL,'Libertador',8),(375,'2025-11-03 15:44:15.000000',NULL,'Loreto',8),(376,'2025-11-03 15:44:15.000000',NULL,'Mburucuyá',8),(377,'2025-11-03 15:44:15.000000',NULL,'Mercedes',8),(378,'2025-11-03 15:44:15.000000',NULL,'Mocoretá',8),(379,'2025-11-03 15:44:15.000000',NULL,'Monte Caseros',8),(380,'2025-11-03 15:44:15.000000',NULL,'Paso de los Libres',8),(381,'2025-11-03 15:44:15.000000',NULL,'Paso de la Patria',8),(382,'2025-11-03 15:44:15.000000',NULL,'Perugorría',8),(383,'2025-11-03 15:44:15.000000',NULL,'Pueblo Libertador',8),(384,'2025-11-03 15:44:15.000000',NULL,'Riachuelo',8),(385,'2025-11-03 15:44:15.000000',NULL,'Saladas',8),(386,'2025-11-03 15:44:15.000000',NULL,'San Cosme',8),(387,'2025-11-03 15:44:15.000000',NULL,'San Luis del Palmar',8),(388,'2025-11-03 15:44:15.000000',NULL,'San Miguel',8),(389,'2025-11-03 15:44:15.000000',NULL,'San Roque',8),(390,'2025-11-03 15:44:15.000000',NULL,'Santa Ana',8),(391,'2025-11-03 15:44:15.000000',NULL,'Santa Lucía',8),(392,'2025-11-03 15:44:15.000000',NULL,'Santo Tomé',8),(393,'2025-11-03 15:44:15.000000',NULL,'Sauce',8),(394,'2025-11-03 15:44:15.000000',NULL,'Tapebicuá',8),(395,'2025-11-03 15:44:15.000000',NULL,'Basavilbaso',9),(396,'2025-11-03 15:44:15.000000',NULL,'Bovril',9),(397,'2025-11-03 15:44:15.000000',NULL,'Colón',9),(398,'2025-11-03 15:44:15.000000',NULL,'Concepción del Uruguay',9),(399,'2025-11-03 15:44:15.000000',NULL,'Concordia',9),(400,'2025-11-03 15:44:15.000000',NULL,'Crespo',9),(401,'2025-11-03 15:44:15.000000',NULL,'Diamante',9),(402,'2025-11-03 15:44:15.000000',NULL,'Feliciano',9),(403,'2025-11-03 15:44:15.000000',NULL,'Federal',9),(404,'2025-11-03 15:44:15.000000',NULL,'Gualeguay',9),(405,'2025-11-03 15:44:15.000000',NULL,'Gualeguaychú',9),(406,'2025-11-03 15:44:15.000000',NULL,'Hasenkamp',9),(407,'2025-11-03 15:44:15.000000',NULL,'Hernandarias',9),(408,'2025-11-03 15:44:15.000000',NULL,'La Paz',9),(409,'2025-11-03 15:44:15.000000',NULL,'Larroque',9),(410,'2025-11-03 15:44:15.000000',NULL,'Los Charrúas',9),(411,'2025-11-03 15:44:15.000000',NULL,'María Grande',9),(412,'2025-11-03 15:44:15.000000',NULL,'Nogoyá',9),(413,'2025-11-03 15:44:15.000000',NULL,'Paraná',9),(414,'2025-11-03 15:44:15.000000',NULL,'Ramírez',9),(415,'2025-11-03 15:44:15.000000',NULL,'Rosario del Tala',9),(416,'2025-11-03 15:44:15.000000',NULL,'San Benito',9),(417,'2025-11-03 15:44:15.000000',NULL,'San José',9),(418,'2025-11-03 15:44:15.000000',NULL,'San Salvador',9),(419,'2025-11-03 15:44:15.000000',NULL,'Santa Elena',9),(420,'2025-11-03 15:44:15.000000',NULL,'Ubajay',9),(421,'2025-11-03 15:44:15.000000',NULL,'Urdinarrain',9),(422,'2025-11-03 15:44:15.000000',NULL,'Victoria',9),(423,'2025-11-03 15:44:15.000000',NULL,'Villaguay',9),(424,'2025-11-03 15:44:15.000000',NULL,'Villa del Rosario',9),(425,'2025-11-03 15:44:15.000000',NULL,'Villa Elisa',9),(426,'2025-11-03 15:44:15.000000',NULL,'Villa Paranacito',9),(427,'2025-11-03 15:44:15.000000',NULL,'Villa Urquiza',9),(428,'2025-11-03 15:44:15.000000',NULL,'Viale',9),(429,'2025-11-03 15:44:15.000000',NULL,'Buena Vista',10),(430,'2025-11-03 15:44:15.000000',NULL,'Clorinda',10),(431,'2025-11-03 15:44:15.000000',NULL,'Comandante Fontana',10),(432,'2025-11-03 15:44:15.000000',NULL,'El Colorado',10),(433,'2025-11-03 15:44:15.000000',NULL,'Estanislao del Campo',10),(434,'2025-11-03 15:44:15.000000',NULL,'Formosa',10),(435,'2025-11-03 15:44:15.000000',NULL,'General Belgrano',10),(436,'2025-11-03 15:44:15.000000',NULL,'General Güemes',10),(437,'2025-11-03 15:44:15.000000',NULL,'Herradura',10),(438,'2025-11-03 15:44:15.000000',NULL,'Ibarreta',10),(439,'2025-11-03 15:44:15.000000',NULL,'Ingeniero Juárez',10),(440,'2025-11-03 15:44:15.000000',NULL,'Laguna Blanca',10),(441,'2025-11-03 15:44:15.000000',NULL,'Laguna Naick Neck',10),(442,'2025-11-03 15:44:15.000000',NULL,'Laguna Yema',10),(443,'2025-11-03 15:44:15.000000',NULL,'Las Lomitas',10),(444,'2025-11-03 15:44:15.000000',NULL,'Los Chiriguanos',10),(445,'2025-11-03 15:44:15.000000',NULL,'Mayor Villafañe',10),(446,'2025-11-03 15:44:15.000000',NULL,'Misión Tacaaglé',10),(447,'2025-11-03 15:44:15.000000',NULL,'Palo Santo',10),(448,'2025-11-03 15:44:15.000000',NULL,'Pirané',10),(449,'2025-11-03 15:44:15.000000',NULL,'Riacho He Hé',10),(450,'2025-11-03 15:44:15.000000',NULL,'San Francisco de Laishi',10),(451,'2025-11-03 15:44:15.000000',NULL,'San Martín II',10),(452,'2025-11-03 15:44:15.000000',NULL,'Siete Palmas',10),(453,'2025-11-03 15:44:15.000000',NULL,'Subteniente Perin',10),(454,'2025-11-03 15:44:15.000000',NULL,'Villa Dos Trece',10),(455,'2025-11-03 15:44:15.000000',NULL,'Villa Escolar',10),(456,'2025-11-03 15:44:15.000000',NULL,'Abra Pampa',11),(457,'2025-11-03 15:44:15.000000',NULL,'Aguas Calientes',11),(458,'2025-11-03 15:44:15.000000',NULL,'El Carmen',11),(459,'2025-11-03 15:44:15.000000',NULL,'Fraile Pintado',11),(460,'2025-11-03 15:44:15.000000',NULL,'Humahuaca',11),(461,'2025-11-03 15:44:15.000000',NULL,'La Esperanza',11),(462,'2025-11-03 15:44:15.000000',NULL,'La Quiaca',11),(463,'2025-11-03 15:44:15.000000',NULL,'Libertador General San Martín',11),(464,'2025-11-03 15:44:15.000000',NULL,'Maimará',11),(465,'2025-11-03 15:44:15.000000',NULL,'Monterrico',11),(466,'2025-11-03 15:44:15.000000',NULL,'Palpalá',11),(467,'2025-11-03 15:44:15.000000',NULL,'Perico',11),(468,'2025-11-03 15:44:15.000000',NULL,'Puesto Viejo',11),(469,'2025-11-03 15:44:15.000000',NULL,'Purmamarca',11),(470,'2025-11-03 15:44:15.000000',NULL,'San Antonio',11),(471,'2025-11-03 15:44:15.000000',NULL,'San Pedro',11),(472,'2025-11-03 15:44:15.000000',NULL,'San Salvador de Jujuy',11),(473,'2025-11-03 15:44:15.000000',NULL,'Tilcara',11),(474,'2025-11-03 15:44:15.000000',NULL,'Uquía',11),(475,'2025-11-03 15:44:15.000000',NULL,'Yala',11),(476,'2025-11-03 15:44:15.000000',NULL,'Yuto',11),(477,'2025-11-03 15:44:15.000000',NULL,'Alta Italia',12),(478,'2025-11-03 15:44:15.000000',NULL,'Anguil',12),(479,'2025-11-03 15:44:15.000000',NULL,'Arata',12),(480,'2025-11-03 15:44:15.000000',NULL,'Bernasconi',12),(481,'2025-11-03 15:44:15.000000',NULL,'Caleufú',12),(482,'2025-11-03 15:44:15.000000',NULL,'Catriló',12),(483,'2025-11-03 15:44:15.000000',NULL,'Colonia Barón',12),(484,'2025-11-03 15:44:15.000000',NULL,'Doblas',12),(485,'2025-11-03 15:44:15.000000',NULL,'Eduardo Castex',12),(486,'2025-11-03 15:44:15.000000',NULL,'General Acha',12),(487,'2025-11-03 15:44:15.000000',NULL,'General Pico',12),(488,'2025-11-03 15:44:15.000000',NULL,'Guatraché',12),(489,'2025-11-03 15:44:15.000000',NULL,'Ing. Luiggi',12),(490,'2025-11-03 15:44:15.000000',NULL,'Intendente Alvear',12),(491,'2025-11-03 15:44:15.000000',NULL,'Jacinto Arauz',12),(492,'2025-11-03 15:44:15.000000',NULL,'La Maruja',12),(493,'2025-11-03 15:44:15.000000',NULL,'La Reforma',12),(494,'2025-11-03 15:44:15.000000',NULL,'Limay Mahuida',12),(495,'2025-11-03 15:44:15.000000',NULL,'Lonquimay',12),(496,'2025-11-03 15:44:15.000000',NULL,'Macachín',12),(497,'2025-11-03 15:44:15.000000',NULL,'Miguel Riglos',12),(498,'2025-11-03 15:44:15.000000',NULL,'Parera',12),(499,'2025-11-03 15:44:15.000000',NULL,'Quemú Quemú',12),(500,'2025-11-03 15:44:15.000000',NULL,'Quetrequén',12),(501,'2025-11-03 15:44:15.000000',NULL,'Rancul',12),(502,'2025-11-03 15:44:15.000000',NULL,'Realicó',12),(503,'2025-11-03 15:44:15.000000',NULL,'San Martín',12),(504,'2025-11-03 15:44:15.000000',NULL,'Santa Rosa',12),(505,'2025-11-03 15:44:15.000000',NULL,'Toay',12),(506,'2025-11-03 15:44:15.000000',NULL,'Trebolares',12),(507,'2025-11-03 15:44:15.000000',NULL,'Veinticinco de Mayo',12),(508,'2025-11-03 15:44:15.000000',NULL,'Victorica',12),(509,'2025-11-03 15:44:15.000000',NULL,'Winifreda',12),(510,'2025-11-03 15:44:15.000000',NULL,'Arauco',13),(511,'2025-11-03 15:44:15.000000',NULL,'Capital',13),(512,'2025-11-03 15:44:15.000000',NULL,'Castro Barros',13),(513,'2025-11-03 15:44:15.000000',NULL,'Chamical',13),(514,'2025-11-03 15:44:15.000000',NULL,'Chilecito',13),(515,'2025-11-03 15:44:15.000000',NULL,'Coronel Felipe Varela',13),(516,'2025-11-03 15:44:15.000000',NULL,'Famatina',13),(517,'2025-11-03 15:44:15.000000',NULL,'General Ángel Vicente Peñaloza',13),(518,'2025-11-03 15:44:15.000000',NULL,'General Belgrano',13),(519,'2025-11-03 15:44:15.000000',NULL,'General Juan Facundo Quiroga',13),(520,'2025-11-03 15:44:15.000000',NULL,'General Lamadrid',13),(521,'2025-11-03 15:44:15.000000',NULL,'General Ocampo',13),(522,'2025-11-03 15:44:15.000000',NULL,'General San Martín',13),(523,'2025-11-03 15:44:15.000000',NULL,'Independencia',13),(524,'2025-11-03 15:44:15.000000',NULL,'Rosario Vera Peñaloza',13),(525,'2025-11-03 15:44:15.000000',NULL,'San Blas de los Sauces',13),(526,'2025-11-03 15:44:15.000000',NULL,'Sanagasta',13),(527,'2025-11-03 15:44:15.000000',NULL,'Vinchina',13),(528,'2025-11-03 15:44:15.000000',NULL,'Capital',14),(529,'2025-11-03 15:44:15.000000',NULL,'General Alvear',14),(530,'2025-11-03 15:44:15.000000',NULL,'Godoy Cruz',14),(531,'2025-11-03 15:44:15.000000',NULL,'Guaymallén',14),(532,'2025-11-03 15:44:15.000000',NULL,'Junín',14),(533,'2025-11-03 15:44:15.000000',NULL,'La Paz',14),(534,'2025-11-03 15:44:15.000000',NULL,'Las Heras',14),(535,'2025-11-03 15:44:15.000000',NULL,'Lavalle',14),(536,'2025-11-03 15:44:15.000000',NULL,'Luján de Cuyo',14),(537,'2025-11-03 15:44:15.000000',NULL,'Maipú',14),(538,'2025-11-03 15:44:15.000000',NULL,'Malargüe',14),(539,'2025-11-03 15:44:15.000000',NULL,'Rivadavia',14),(540,'2025-11-03 15:44:15.000000',NULL,'San Carlos',14),(541,'2025-11-03 15:44:15.000000',NULL,'San Martín',14),(542,'2025-11-03 15:44:15.000000',NULL,'San Rafael',14),(543,'2025-11-03 15:44:15.000000',NULL,'Santa Rosa',14),(544,'2025-11-03 15:44:15.000000',NULL,'Tunuyán',14),(545,'2025-11-03 15:44:15.000000',NULL,'Tupungato',14),(546,'2025-11-03 15:44:15.000000',NULL,'Apóstoles',15),(547,'2025-11-03 15:44:15.000000',NULL,'Aristóbulo del Valle',15),(548,'2025-11-03 15:44:15.000000',NULL,'Bernardo de Irigoyen',15),(549,'2025-11-03 15:44:15.000000',NULL,'Candelaria',15),(550,'2025-11-03 15:44:15.000000',NULL,'Concepción de la Sierra',15),(551,'2025-11-03 15:44:15.000000',NULL,'Eldorado',15),(552,'2025-11-03 15:44:15.000000',NULL,'Garupá',15),(553,'2025-11-03 15:44:15.000000',NULL,'Gobernador Roca',15),(554,'2025-11-03 15:44:15.000000',NULL,'Jardín América',15),(555,'2025-11-03 15:44:15.000000',NULL,'Leandro N. Alem',15),(556,'2025-11-03 15:44:15.000000',NULL,'Montecarlo',15),(557,'2025-11-03 15:44:15.000000',NULL,'Oberá',15),(558,'2025-11-03 15:44:15.000000',NULL,'Posadas',15),(559,'2025-11-03 15:44:15.000000',NULL,'Puerto Esperanza',15),(560,'2025-11-03 15:44:15.000000',NULL,'Puerto Iguazú',15),(561,'2025-11-03 15:44:15.000000',NULL,'Puerto Libertad',15),(562,'2025-11-03 15:44:15.000000',NULL,'Puerto Rico',15),(563,'2025-11-03 15:44:15.000000',NULL,'San Ignacio',15),(564,'2025-11-03 15:44:15.000000',NULL,'San Javier',15),(565,'2025-11-03 15:44:15.000000',NULL,'San Pedro',15),(566,'2025-11-03 15:44:15.000000',NULL,'San Vicente',15),(567,'2025-11-03 15:44:15.000000',NULL,'Santa Ana',15),(568,'2025-11-03 15:44:15.000000',NULL,'Santo Pipó',15),(569,'2025-11-03 15:44:15.000000',NULL,'Tres Capones',15),(570,'2025-11-03 15:44:15.000000',NULL,'Wanda',15),(571,'2025-11-03 15:44:15.000000',NULL,'Aluminé',16),(572,'2025-11-03 15:44:15.000000',NULL,'Andacollo',16),(573,'2025-11-03 15:44:15.000000',NULL,'Añelo',16),(574,'2025-11-03 15:44:15.000000',NULL,'Barda del Medio',16),(575,'2025-11-03 15:44:15.000000',NULL,'Buta Ranquil',16),(576,'2025-11-03 15:44:15.000000',NULL,'Centenario',16),(577,'2025-11-03 15:44:15.000000',NULL,'Chos Malal',16),(578,'2025-11-03 15:44:15.000000',NULL,'Cinco Saltos',16),(579,'2025-11-03 15:44:15.000000',NULL,'Cipolletti',16),(580,'2025-11-03 15:44:15.000000',NULL,'Cutral Có',16),(581,'2025-11-03 15:44:15.000000',NULL,'El Chocón',16),(582,'2025-11-03 15:44:15.000000',NULL,'El Huecú',16),(583,'2025-11-03 15:44:15.000000',NULL,'El Bolsón',16),(584,'2025-11-03 15:44:15.000000',NULL,'Junín de los Andes',16),(585,'2025-11-03 15:44:15.000000',NULL,'Las Lajas',16),(586,'2025-11-03 15:44:15.000000',NULL,'Las Ovejas',16),(587,'2025-11-03 15:44:15.000000',NULL,'Neuquén',16),(588,'2025-11-03 15:44:15.000000',NULL,'Paso Aguerre',16),(589,'2025-11-03 15:44:15.000000',NULL,'Picún Leufú',16),(590,'2025-11-03 15:44:15.000000',NULL,'Piedra del Águila',16),(591,'2025-11-03 15:44:15.000000',NULL,'Plaza Huincul',16),(592,'2025-11-03 15:44:15.000000',NULL,'Plottier',16),(593,'2025-11-03 15:44:15.000000',NULL,'Rincón de los Sauces',16),(594,'2025-11-03 15:44:15.000000',NULL,'San Martín de los Andes',16),(595,'2025-11-03 15:44:15.000000',NULL,'San Patricio del Chañar',16),(596,'2025-11-03 15:44:15.000000',NULL,'Senillosa',16),(597,'2025-11-03 15:44:15.000000',NULL,'Tierra del Fuego',16),(598,'2025-11-03 15:44:15.000000',NULL,'Tricao Malal',16),(599,'2025-11-03 15:44:15.000000',NULL,'Villa El Chocón',16),(600,'2025-11-03 15:44:15.000000',NULL,'Villa La Angostura',16),(601,'2025-11-03 15:44:15.000000',NULL,'Villa Pehuenia',16),(602,'2025-11-03 15:44:15.000000',NULL,'Villa Traful',16),(603,'2025-11-03 15:44:15.000000',NULL,'Zapala',16),(604,'2025-11-03 15:44:15.000000',NULL,'Allen',17),(605,'2025-11-03 15:44:15.000000',NULL,'Bariloche',17),(606,'2025-11-03 15:44:15.000000',NULL,'Campo Grande',17),(607,'2025-11-03 15:44:15.000000',NULL,'Catriel',17),(608,'2025-11-03 15:44:15.000000',NULL,'Cerro Policía',17),(609,'2025-11-03 15:44:15.000000',NULL,'Chichinales',17),(610,'2025-11-03 15:44:15.000000',NULL,'Chimpay',17),(611,'2025-11-03 15:44:15.000000',NULL,'Choele Choel',17),(612,'2025-11-03 15:44:15.000000',NULL,'Cinco Saltos',17),(613,'2025-11-03 15:44:15.000000',NULL,'Cipolletti',17),(614,'2025-11-03 15:44:15.000000',NULL,'Contralmirante Cordero',17),(615,'2025-11-03 15:44:15.000000',NULL,'Coronel Belisle',17),(616,'2025-11-03 15:44:15.000000',NULL,'Dina Huapi',17),(617,'2025-11-03 15:44:15.000000',NULL,'El Bolsón',17),(618,'2025-11-03 15:44:15.000000',NULL,'El Cuy',17),(619,'2025-11-03 15:44:15.000000',NULL,'General Conesa',17),(620,'2025-11-03 15:44:15.000000',NULL,'General Enrique Godoy',17),(621,'2025-11-03 15:44:15.000000',NULL,'General Fernández Oro',17),(622,'2025-11-03 15:44:15.000000',NULL,'General Roca',17),(623,'2025-11-03 15:44:15.000000',NULL,'Guardia Mitre',17),(624,'2025-11-03 15:44:15.000000',NULL,'Ingeniero Huergo',17),(625,'2025-11-03 15:44:15.000000',NULL,'Ingeniero Jacobacci',17),(626,'2025-11-03 15:44:15.000000',NULL,'Lamarque',17),(627,'2025-11-03 15:44:15.000000',NULL,'Las Grutas',17),(628,'2025-11-03 15:44:15.000000',NULL,'Los Menucos',17),(629,'2025-11-03 15:44:15.000000',NULL,'Luis Beltrán',17),(630,'2025-11-03 15:44:15.000000',NULL,'Mainqué',17),(631,'2025-11-03 15:44:15.000000',NULL,'Maquinchao',17),(632,'2025-11-03 15:44:15.000000',NULL,'Mencué',17),(633,'2025-11-03 15:44:15.000000',NULL,'Ñorquinco',17),(634,'2025-11-03 15:44:15.000000',NULL,'Pilcaniyeu',17),(635,'2025-11-03 15:44:15.000000',NULL,'Pomona',17),(636,'2025-11-03 15:44:15.000000',NULL,'Ramos Mexía',17),(637,'2025-11-03 15:44:15.000000',NULL,'Roca',17),(638,'2025-11-03 15:44:15.000000',NULL,'San Antonio Oeste',17),(639,'2025-11-03 15:44:15.000000',NULL,'Sierra Colorada',17),(640,'2025-11-03 15:44:15.000000',NULL,'Sierra Grande',17),(641,'2025-11-03 15:44:15.000000',NULL,'Sierra Pailemán',17),(642,'2025-11-03 15:44:15.000000',NULL,'Valcheta',17),(643,'2025-11-03 15:44:15.000000',NULL,'Viedma',17),(644,'2025-11-03 15:44:15.000000',NULL,'Villa Regina',17),(645,'2025-11-03 15:44:15.000000',NULL,'Aguaray',18),(646,'2025-11-03 15:44:15.000000',NULL,'Angastaco',18),(647,'2025-11-03 15:44:15.000000',NULL,'Cafayate',18),(648,'2025-11-03 15:44:15.000000',NULL,'Campo Quijano',18),(649,'2025-11-03 15:44:15.000000',NULL,'Campo Santo',18),(650,'2025-11-03 15:44:15.000000',NULL,'Cerrillos',18),(651,'2025-11-03 15:44:15.000000',NULL,'Chicoana',18),(652,'2025-11-03 15:44:15.000000',NULL,'Colonia Santa Rosa',18),(653,'2025-11-03 15:44:15.000000',NULL,'Coronel Moldes',18),(654,'2025-11-03 15:44:15.000000',NULL,'El Bordo',18),(655,'2025-11-03 15:44:15.000000',NULL,'El Carril',18),(656,'2025-11-03 15:44:15.000000',NULL,'El Galpón',18),(657,'2025-11-03 15:44:15.000000',NULL,'El Quebrachal',18),(658,'2025-11-03 15:44:15.000000',NULL,'El Tala',18),(659,'2025-11-03 15:44:15.000000',NULL,'Enrique Mosconi',18),(660,'2025-11-03 15:44:15.000000',NULL,'General Ballivián',18),(661,'2025-11-03 15:44:15.000000',NULL,'General Güemes',18),(662,'2025-11-03 15:44:15.000000',NULL,'General Mosconi',18),(663,'2025-11-03 15:44:15.000000',NULL,'Hipólito Yrigoyen',18),(664,'2025-11-03 15:44:15.000000',NULL,'Iruya',18),(665,'2025-11-03 15:44:15.000000',NULL,'Joaquín V. González',18),(666,'2025-11-03 15:44:15.000000',NULL,'La Caldera',18),(667,'2025-11-03 15:44:15.000000',NULL,'La Candelaria',18),(668,'2025-11-03 15:44:15.000000',NULL,'La Merced',18),(669,'2025-11-03 15:44:15.000000',NULL,'Las Lajitas',18),(670,'2025-11-03 15:44:15.000000',NULL,'Metán',18),(671,'2025-11-03 15:44:15.000000',NULL,'Molinos',18),(672,'2025-11-03 15:44:15.000000',NULL,'Orán',18),(673,'2025-11-03 15:44:15.000000',NULL,'Pichanal',18),(674,'2025-11-03 15:44:15.000000',NULL,'Rivadavia',18),(675,'2025-11-03 15:44:15.000000',NULL,'Rosario de la Frontera',18),(676,'2025-11-03 15:44:15.000000',NULL,'Rosario de Lerma',18),(677,'2025-11-03 15:44:15.000000',NULL,'Salta',18),(678,'2025-11-03 15:44:15.000000',NULL,'San Antonio de los Cobres',18),(679,'2025-11-03 15:44:15.000000',NULL,'San Carlos',18),(680,'2025-11-03 15:44:15.000000',NULL,'San José de Metán',18),(681,'2025-11-03 15:44:15.000000',NULL,'San Ramón de la Nueva Orán',18),(682,'2025-11-03 15:44:15.000000',NULL,'Santa Victoria Este',18),(683,'2025-11-03 15:44:15.000000',NULL,'Seclantás',18),(684,'2025-11-03 15:44:15.000000',NULL,'Tartagal',18),(685,'2025-11-03 15:44:15.000000',NULL,'Urundel',18),(686,'2025-11-03 15:44:15.000000',NULL,'Albardón',19),(687,'2025-11-03 15:44:15.000000',NULL,'Angaco',19),(688,'2025-11-03 15:44:15.000000',NULL,'Calingasta',19),(689,'2025-11-03 15:44:15.000000',NULL,'Capital',19),(690,'2025-11-03 15:44:15.000000',NULL,'Caucete',19),(691,'2025-11-03 15:44:15.000000',NULL,'Chimbas',19),(692,'2025-11-03 15:44:15.000000',NULL,'Jáchal',19),(693,'2025-11-03 15:44:15.000000',NULL,'Nueve de Julio',19),(694,'2025-11-03 15:44:15.000000',NULL,'Pocito',19),(695,'2025-11-03 15:44:15.000000',NULL,'Rawson',19),(696,'2025-11-03 15:44:15.000000',NULL,'Rivadavia',19),(697,'2025-11-03 15:44:15.000000',NULL,'San Martín',19),(698,'2025-11-03 15:44:15.000000',NULL,'Santa Lucía',19),(699,'2025-11-03 15:44:15.000000',NULL,'Sarmiento',19),(700,'2025-11-03 15:44:15.000000',NULL,'Ullum',19),(701,'2025-11-03 15:44:15.000000',NULL,'Valle Fértil',19),(702,'2025-11-03 15:44:15.000000',NULL,'Veinticinco de Mayo',19),(703,'2025-11-03 15:44:15.000000',NULL,'Zonda',19),(704,'2025-11-03 15:44:15.000000',NULL,'Anchorena',20),(705,'2025-11-03 15:44:15.000000',NULL,'Buena Esperanza',20),(706,'2025-11-03 15:44:15.000000',NULL,'Candelaria',20),(707,'2025-11-03 15:44:15.000000',NULL,'Concarán',20),(708,'2025-11-03 15:44:15.000000',NULL,'Cortaderas',20),(709,'2025-11-03 15:44:15.000000',NULL,'El Trapiche',20),(710,'2025-11-03 15:44:15.000000',NULL,'Fortín El Patria',20),(711,'2025-11-03 15:44:15.000000',NULL,'Juana Koslay',20),(712,'2025-11-03 15:44:15.000000',NULL,'Justo Daract',20),(713,'2025-11-03 15:44:15.000000',NULL,'La Punta',20),(714,'2025-11-03 15:44:15.000000',NULL,'Lafinur',20),(715,'2025-11-03 15:44:15.000000',NULL,'Las Aguadas',20),(716,'2025-11-03 15:44:15.000000',NULL,'Los Molles',20),(717,'2025-11-03 15:44:15.000000',NULL,'Luján',20),(718,'2025-11-03 15:44:15.000000',NULL,'Merlo',20),(719,'2025-11-03 15:44:15.000000',NULL,'Naschel',20),(720,'2025-11-03 15:44:15.000000',NULL,'Nueva Galia',20),(721,'2025-11-03 15:44:15.000000',NULL,'Renca',20),(722,'2025-11-03 15:44:15.000000',NULL,'San Francisco',20),(723,'2025-11-03 15:44:15.000000',NULL,'San Luis',20),(724,'2025-11-03 15:44:15.000000',NULL,'Santa Rosa del Conlara',20),(725,'2025-11-03 15:44:15.000000',NULL,'Tilisarao',20),(726,'2025-11-03 15:44:15.000000',NULL,'Unión',20),(727,'2025-11-03 15:44:15.000000',NULL,'Villa de la Quebrada',20),(728,'2025-11-03 15:44:15.000000',NULL,'Villa de Merlo',20),(729,'2025-11-03 15:44:15.000000',NULL,'Villa Mercedes',20),(730,'2025-11-03 15:44:15.000000',NULL,'Caleta Olivia',21),(731,'2025-11-03 15:44:15.000000',NULL,'Cañadón Seco',21),(732,'2025-11-03 15:44:15.000000',NULL,'Comandante Luis Piedra Buena',21),(733,'2025-11-03 15:44:15.000000',NULL,'El Calafate',21),(734,'2025-11-03 15:44:15.000000',NULL,'El Chaltén',21),(735,'2025-11-03 15:44:15.000000',NULL,'Esperanza',21),(736,'2025-11-03 15:44:15.000000',NULL,'Gobernador Gregores',21),(737,'2025-11-03 15:44:15.000000',NULL,'Jaramillo',21),(738,'2025-11-03 15:44:15.000000',NULL,'Koluel Kaike',21),(739,'2025-11-03 15:44:15.000000',NULL,'Las Heras',21),(740,'2025-11-03 15:44:15.000000',NULL,'Los Antiguos',21),(741,'2025-11-03 15:44:15.000000',NULL,'Perito Moreno',21),(742,'2025-11-03 15:44:15.000000',NULL,'Pico Truncado',21),(743,'2025-11-03 15:44:15.000000',NULL,'Puerto Deseado',21),(744,'2025-11-03 15:44:15.000000',NULL,'Puerto San Julián',21),(745,'2025-11-03 15:44:15.000000',NULL,'Puerto Santa Cruz',21),(746,'2025-11-03 15:44:15.000000',NULL,'Río Gallegos',21),(747,'2025-11-03 15:44:15.000000',NULL,'Río Turbio',21),(748,'2025-11-03 15:44:15.000000',NULL,'Tres Lagos',21),(749,'2025-11-03 15:44:15.000000',NULL,'Veintiocho de Noviembre',21),(750,'2025-11-03 15:44:15.000000',NULL,'Arocena',22),(751,'2025-11-03 15:44:15.000000',NULL,'Arroyo Seco',22),(752,'2025-11-03 15:44:15.000000',NULL,'Avellaneda',22),(753,'2025-11-03 15:44:15.000000',NULL,'Barrancas',22),(754,'2025-11-03 15:44:15.000000',NULL,'Cañada de Gómez',22),(755,'2025-11-03 15:44:15.000000',NULL,'Cañada Rosquín',22),(756,'2025-11-03 15:44:15.000000',NULL,'Capital',22),(757,'2025-11-03 15:44:15.000000',NULL,'Casilda',22),(758,'2025-11-03 15:44:15.000000',NULL,'Ceres',22),(759,'2025-11-03 15:44:15.000000',NULL,'Coronda',22),(760,'2025-11-03 15:44:15.000000',NULL,'El Trébol',22),(761,'2025-11-03 15:44:15.000000',NULL,'Esperanza',22),(762,'2025-11-03 15:44:15.000000',NULL,'Funes',22),(763,'2025-11-03 15:44:15.000000',NULL,'Gálvez',22),(764,'2025-11-03 15:44:15.000000',NULL,'Granadero Baigorria',22),(765,'2025-11-03 15:44:15.000000',NULL,'Helvecia',22),(766,'2025-11-03 15:44:15.000000',NULL,'Las Parejas',22),(767,'2025-11-03 15:44:15.000000',NULL,'Las Rosas',22),(768,'2025-11-03 15:44:15.000000',NULL,'Margarita',22),(769,'2025-11-03 15:44:15.000000',NULL,'Melincué',22),(770,'2025-11-03 15:44:15.000000',NULL,'Rafaela',22),(771,'2025-11-03 15:44:15.000000',NULL,'Reconquista',22),(772,'2025-11-03 15:44:15.000000',NULL,'Roldán',22),(773,'2025-11-03 15:44:15.000000',NULL,'Rosario',22),(774,'2025-11-03 15:44:15.000000',NULL,'San Carlos Centro',22),(775,'2025-11-03 15:44:15.000000',NULL,'San Cristóbal',22),(776,'2025-11-03 15:44:15.000000',NULL,'San Genaro',22),(777,'2025-11-03 15:44:15.000000',NULL,'San Javier',22),(778,'2025-11-03 15:44:15.000000',NULL,'San Jorge',22),(779,'2025-11-03 15:44:15.000000',NULL,'San Justo',22),(780,'2025-11-03 15:44:15.000000',NULL,'San Lorenzo',22),(781,'2025-11-03 15:44:15.000000',NULL,'San Vicente',22),(782,'2025-11-03 15:44:15.000000',NULL,'Santa Fe',22),(783,'2025-11-03 15:44:15.000000',NULL,'Santo Tomé',22),(784,'2025-11-03 15:44:15.000000',NULL,'Sunchales',22),(785,'2025-11-03 15:44:15.000000',NULL,'Totoras',22),(786,'2025-11-03 15:44:15.000000',NULL,'Venado Tuerto',22),(787,'2025-11-03 15:44:15.000000',NULL,'Vera',22),(788,'2025-11-03 15:44:15.000000',NULL,'Villa Cañás',22),(789,'2025-11-03 15:44:15.000000',NULL,'Villa Constitución',22),(790,'2025-11-03 15:44:15.000000',NULL,'Añatuya',23),(791,'2025-11-03 15:44:15.000000',NULL,'Bandera',23),(792,'2025-11-03 15:44:15.000000',NULL,'Beltrán',23),(793,'2025-11-03 15:44:15.000000',NULL,'Campo Gallo',23),(794,'2025-11-03 15:44:15.000000',NULL,'Clodomira',23),(795,'2025-11-03 15:44:15.000000',NULL,'Fernández',23),(796,'2025-11-03 15:44:15.000000',NULL,'Frías',23),(797,'2025-11-03 15:44:15.000000',NULL,'La Banda',23),(798,'2025-11-03 15:44:15.000000',NULL,'Las Termas de Río Hondo',23),(799,'2025-11-03 15:44:15.000000',NULL,'Loreto',23),(800,'2025-11-03 15:44:15.000000',NULL,'Monte Quemado',23),(801,'2025-11-03 15:44:15.000000',NULL,'Nueva Esperanza',23),(802,'2025-11-03 15:44:15.000000',NULL,'Pinto',23),(803,'2025-11-03 15:44:15.000000',NULL,'Quimilí',23),(804,'2025-11-03 15:44:15.000000',NULL,'San Pedro de Guasayán',23),(805,'2025-11-03 15:44:15.000000',NULL,'San Ramón',23),(806,'2025-11-03 15:44:15.000000',NULL,'Santiago del Estero',23),(807,'2025-11-03 15:44:15.000000',NULL,'Silipica',23),(808,'2025-11-03 15:44:15.000000',NULL,'Suncho Corral',23),(809,'2025-11-03 15:44:15.000000',NULL,'Villa Atamisqui',23),(810,'2025-11-03 15:44:15.000000',NULL,'Villa Ojo de Agua',23),(811,'2025-11-03 15:44:15.000000',NULL,'Río Grande',24),(812,'2025-11-03 15:44:15.000000',NULL,'Tolhuin',24),(813,'2025-11-03 15:44:15.000000',NULL,'Ushuaia',24),(814,'2025-11-03 15:44:15.000000',NULL,'Aguilares',25),(815,'2025-11-03 15:44:15.000000',NULL,'Alderetes',25),(816,'2025-11-03 15:44:15.000000',NULL,'Banda del Río Salí',25),(817,'2025-11-03 15:44:15.000000',NULL,'Bella Vista',25),(818,'2025-11-03 15:44:15.000000',NULL,'Burruyacú',25),(819,'2025-11-03 15:44:15.000000',NULL,'Concepción',25),(820,'2025-11-03 15:44:15.000000',NULL,'Famaillá',25),(821,'2025-11-03 15:44:15.000000',NULL,'Juan Bautista Alberdi',25),(822,'2025-11-03 15:44:15.000000',NULL,'La Cocha',25),(823,'2025-11-03 15:44:15.000000',NULL,'Lamadrid',25),(824,'2025-11-03 15:44:15.000000',NULL,'Las Talitas',25),(825,'2025-11-03 15:44:15.000000',NULL,'Lules',25),(826,'2025-11-03 15:44:15.000000',NULL,'Monteros',25),(827,'2025-11-03 15:44:15.000000',NULL,'Río Seco',25),(828,'2025-11-03 15:44:15.000000',NULL,'San Miguel de Tucumán',25),(829,'2025-11-03 15:44:15.000000',NULL,'Simoca',25),(830,'2025-11-03 15:44:15.000000',NULL,'Tafí del Valle',25),(831,'2025-11-03 15:44:15.000000',NULL,'Tafí Viejo',25),(832,'2025-11-03 15:44:15.000000',NULL,'Trancas',25),(833,'2025-11-03 15:44:15.000000',NULL,'Villa Alberdi',25),(834,'2025-11-03 15:44:15.000000',NULL,'Villa Belgrano',25),(835,'2025-11-03 15:44:15.000000',NULL,'Yerba Buena',25),(836,'2025-11-03 15:44:15.000000',NULL,'Yerba Buena (S)',25);
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
INSERT INTO `lugar_precio` VALUES (1,'2025-11-03 15:44:15.000000',NULL,2000,1),(2,'2025-11-03 15:44:15.000000',NULL,2300,2),(3,'2025-11-03 15:44:15.000000',NULL,2500,3);
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
INSERT INTO `lugares` VALUES (1,200,'lugar ideal para realizar una fiesta a lo grande!','Av. San Martin 3453','2025-11-03 15:44:15.000000',NULL,'Quincho Silva',1,3,1),(2,300,'lugar ideal para realizar una fiesta a lo grande!','Av. San Martin 3453','2025-11-03 15:44:15.000000',NULL,'Bodega Silva',1,3,2),(3,200,'lugar ideal para realizar una fiesta a lo grande!','Av. San Martin 3453','2025-11-03 15:44:15.000000',NULL,'Hotel Silva',1,3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `medios_de_pago` VALUES (1,'diners',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.458430','Diners',15000000.00,15.00,2880,'TARJETA_CREDITO'),(2,'mercadopago_cc',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.382060','Mercado Pago + Banco Patagonia',1500000.00,0.00,0,'TARJETA_CREDITO'),(3,'debvisa',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.429203','Visa Débito',15000000.00,3.00,2880,'TARJETA_DEBITO'),(4,'visa',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.467424','Visa Prepaid',15000000.00,1.00,2880,'TARJETA_CREDITO'),(5,'amex',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.436978','American Express',15000000.00,3.00,2880,'TARJETA_CREDITO'),(6,'argencard',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.355441','Argencard',15000000.00,15.00,2880,'TARJETA_CREDITO'),(7,'master',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.447128','Mastercard',15000000.00,3.00,2880,'TARJETA_PREPAGA'),(8,'maestro',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.499071','Maestro',15000000.00,3.00,1440,'TARJETA_DEBITO'),(9,'cabal',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.480499','Cabal',15000000.00,1.00,0,'TARJETA_PREPAGA'),(10,'debin_transfer',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.400606','DEBIN',10000000.00,1.00,0,'TRANSFERENCIA'),(11,'sol',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.372831','Sol',5000000.00,15.00,2880,'TARJETA_CREDITO'),(12,'debcabal',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.489837','Cabal Débito',15000000.00,3.00,1440,'TARJETA_DEBITO'),(13,'debmaster',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.419448','Mastercard Débito',15000000.00,3.00,1440,'TARJETA_DEBITO'),(14,'naranja',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.319636','Naranja',15000000.00,15.00,2880,'TARJETA_CREDITO'),(15,'pagofacil',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.516625','Pago Fácil',1000000.00,50.00,0,'EFECTIVO'),(16,'rapipago',_binary '','ACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.525781','Rapipago',1000000.00,50.00,0,'EFECTIVO'),(17,'cobroexpress',_binary '','INACTIVO','2025-10-09 13:38:13.552198',NULL,'2025-10-09 13:54:21.507492','Cobro Express',200000.00,50.00,0,'EFECTIVO');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `metricas_actividad` VALUES (1,2,'2025-11-03 15:45:39.994000',99);
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
INSERT INTO `metricas_actividad_aud` VALUES (1,287,0,1,'2025-11-03 15:45:39.994000',99),(1,307,1,2,'2025-11-03 15:45:39.994000',99);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `notificaciones` VALUES (1,'2025-11-03 15:54:52.157647',NULL,_binary '\0','El backup \'Backup inicial de Backup de prueba\' fue restaurado exitosamente.','Alerta','Restauración completada',NULL,1);
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
INSERT INTO `notificaciones_aud` VALUES (1,306,0,'2025-11-03 15:54:52.157647',NULL,_binary '\0','El backup \'Backup inicial de Backup de prueba\' fue restaurado exitosamente.','Alerta','Restauración completada',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `permisos` VALUES (1,'','2025-11-03 15:33:03.332949',NULL,2,'/api/backups/{id}','API'),(2,'','2025-11-03 15:33:03.452678',NULL,0,'/api/estado-backup','API'),(3,'','2025-11-03 15:33:03.467677',NULL,1,'/api/provincias/{idProvincia}/localidad/{idLocalidad}','API'),(4,'','2025-11-03 15:33:03.480085',NULL,3,'/api/servicios/verDetalleServicio/{idServicio}','API'),(5,'','2025-11-03 15:33:03.489254',NULL,2,'/api/notificaciones/{id}','API'),(6,'','2025-11-03 15:33:03.499254',NULL,1,'/api/seguridad/grupos/baja/{id}','API'),(7,'','2025-11-03 15:33:03.509260',NULL,2,'/api/servicios/{id}','API'),(8,'','2025-11-03 15:33:03.518253',NULL,3,'/api/datos-bancarios/get','API'),(9,'','2025-11-03 15:33:03.527255',NULL,1,'/api/estado-backup/{id}','API'),(10,'','2025-11-03 15:33:03.536253',NULL,0,'/api/seguridad/usuarios/login','API'),(11,'','2025-11-03 15:33:03.544253',NULL,3,'/api/seguridad/permisos','API'),(12,'','2025-11-03 15:33:03.552253',NULL,2,'/api/tipo-de-servicio/{id}','API'),(13,'','2025-11-03 15:33:03.563381',NULL,3,'/api/reportes/CantidadUsuariosActivos/get','API'),(14,'','2025-11-03 15:33:03.573656',NULL,3,'/api/estados-servicio','API'),(15,'','2025-11-03 15:33:03.582653',NULL,3,'/api/servicios/obtenerDtosServicio','API'),(16,'','2025-11-03 15:33:03.593662',NULL,3,'/api/resena','API'),(17,'','2025-11-03 15:33:03.603178',NULL,3,'/api/tipo-de-servicio','API'),(18,'','2025-11-03 15:33:03.614772',NULL,3,'/api/notificaciones/mias','API'),(19,'','2025-11-03 15:33:03.624853',NULL,0,'/api/pagos','API'),(20,'','2025-11-03 15:33:03.635781',NULL,2,'/api/datos-bancarios/{id}','API'),(21,'','2025-11-03 15:33:03.646791',NULL,3,'/api/reservas/mis-reservas-servicio','API'),(22,'','2025-11-03 15:33:03.656310',NULL,3,'/api/eventos/mis-eventos','API'),(23,'','2025-11-03 15:33:03.667319',NULL,0,'/api/reportes/vistasPorLugar','API'),(24,'','2025-11-03 15:33:03.676491',NULL,3,'/api/seguridad/usuarios','API'),(25,'','2025-11-03 15:33:03.687028',NULL,1,'/api/reservas/{id}','API'),(26,'','2025-11-03 15:33:03.695949',NULL,2,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(27,'','2025-11-03 15:33:03.705870',NULL,3,'/api/caracteristica-de-lugar/{id}','API'),(28,'','2025-11-03 15:33:03.713800',NULL,3,'/api/reportes/financiero/get','API'),(29,'','2025-11-03 15:33:03.722259',NULL,0,'/api/factura/crear','API'),(30,'','2025-11-03 15:33:03.731208',NULL,1,'/api/lugares/{id}','API'),(31,'','2025-11-03 15:33:03.739508',NULL,3,'/api/tipo-de-lugar','API'),(32,'','2025-11-03 15:33:03.748048',NULL,1,'/api/datos-bancarios/baja/{id}','API'),(33,'','2025-11-03 15:33:03.756692',NULL,3,'/api/backups','API'),(34,'','2025-11-03 15:33:03.764392',NULL,0,'/api/seguridad/permisos','API'),(35,'','2025-11-03 15:33:03.774617',NULL,3,'/api/chat','API'),(36,'','2025-11-03 15:33:03.785567',NULL,3,'/api/seguridad/grupos','API'),(37,'','2025-11-03 15:33:03.795115',NULL,3,'/api/reportes/vistasPorServicio/obtener','API'),(38,'','2025-11-03 15:33:03.807142',NULL,1,'/api/seguridad/permisos/actualizar/{id}','API'),(39,'','2025-11-03 15:33:03.817109',NULL,0,'/api/resena/getResenaPorUsuario','API'),(40,'','2025-11-03 15:33:03.827125',NULL,1,'/api/reportes/vistasPorServicio/baja/{id}','API'),(41,'','2025-11-03 15:33:03.836147',NULL,0,'/api/chat/propuesta','API'),(42,'','2025-11-03 15:33:03.847851',NULL,1,'/api/seguridad/grupos/permiso/quitar','API'),(43,'','2025-11-03 15:33:03.857851',NULL,0,'/api/estados-servicio','API'),(44,'','2025-11-03 15:33:03.869414',NULL,3,'/api/seguridad/permisos/{id}','API'),(45,'','2025-11-03 15:33:03.879413',NULL,0,'/api/resena','API'),(46,'','2025-11-03 15:33:03.888417',NULL,0,'/api/tipo-de-servicio','API'),(47,'','2025-11-03 15:33:03.898407',NULL,1,'/api/localidades/baja/{id}','API'),(48,'','2025-11-03 15:33:03.907928',NULL,0,'/api/eventos/nuevo','API'),(49,'','2025-11-03 15:33:03.915890',NULL,3,'/api/notificaciones','API'),(50,'','2025-11-03 15:33:03.924690',NULL,3,'/api/pagos/get','API'),(51,'','2025-11-03 15:33:03.933496',NULL,3,'/api/notificaciones/count','API'),(52,'','2025-11-03 15:33:03.942557',NULL,2,'/api/parametro-comision/{id}','API'),(53,'','2025-11-03 15:33:03.955567',NULL,0,'/api/seguridad/usuarios','API'),(54,'','2025-11-03 15:33:03.964937',NULL,3,'/api/localidades/{id}','API'),(55,'','2025-11-03 15:33:03.972998',NULL,1,'/api/notificaciones/baja/{id}','API'),(56,'','2025-11-03 15:33:03.980879',NULL,3,'/api/estados-servicio/todos','API'),(57,'','2025-11-03 15:33:03.990483',NULL,2,'/api/tipo-de-lugar/{id}','API'),(58,'','2025-11-03 15:33:03.999046',NULL,1,'/api/seguridad/roles/{id}/actualizar','API'),(59,'','2025-11-03 15:33:04.007514',NULL,0,'/api/tipo-de-lugar','API'),(60,'','2025-11-03 15:33:04.017526',NULL,0,'/api/backups','API'),(61,'','2025-11-03 15:33:04.026525',NULL,0,'/api/seguridad/grupos','API'),(62,'','2025-11-03 15:33:04.035522',NULL,0,'/api/eventos/actualizar-realizados','API'),(63,'','2025-11-03 15:33:04.044528',NULL,3,'/api/servicios','API'),(64,'','2025-11-03 15:33:04.055529',NULL,1,'/api/lugares/iniciarReserva','API'),(65,'','2025-11-03 15:33:04.065122',NULL,0,'/api/backups/realizar-backups','API'),(66,'','2025-11-03 15:33:04.073687',NULL,1,'/api/servicios/baja/{id}','API'),(67,'','2025-11-03 15:33:04.083765',NULL,1,'/api/reservas/confirmar-reserva','API'),(68,'','2025-11-03 15:33:04.093756',NULL,1,'/api/tipo-de-evento/baja/{id}','API'),(69,'','2025-11-03 15:33:04.103758',NULL,2,'/api/seguridad/roles/{id}','API'),(70,'','2025-11-03 15:33:04.111945',NULL,1,'/api/caracteristica-de-lugar/{id}','API'),(71,'','2025-11-03 15:33:04.119507',NULL,3,'/api/reportes/serviciosMasSolicitados/filtros','API'),(72,'','2025-11-03 15:33:04.128318',NULL,3,'/api/provincias/get','API'),(73,'','2025-11-03 15:33:04.136993',NULL,3,'/api/lugares/getMisLugares','API'),(74,'','2025-11-03 15:33:04.145585',NULL,1,'/api/backups/baja/{id}','API'),(75,'','2025-11-03 15:33:04.153543',NULL,3,'/api/reservas/estados-reserva','API'),(76,'','2025-11-03 15:33:04.162139',NULL,0,'/api/pagos/sincronizar','API'),(77,'','2025-11-03 15:33:04.171100',NULL,1,'/api/seguridad/permisos/{id}','API'),(78,'','2025-11-03 15:33:04.178132',NULL,1,'/api/chat/propuestas/eliminar','API'),(79,'','2025-11-03 15:33:04.186968',NULL,0,'/api/servicios','API'),(80,'','2025-11-03 15:33:04.194069',NULL,1,'/api/localidades/{id}','API'),(81,'','2025-11-03 15:33:04.202309',NULL,2,'/api/pagos/{id}','API'),(82,'','2025-11-03 15:33:04.211351',NULL,1,'/api/lugares/bajaLugar/{idLugar}','API'),(83,'','2025-11-03 15:33:04.219788',NULL,1,'/api/resena/baja/{id}','API'),(84,'','2025-11-03 15:33:04.228705',NULL,2,'/api/tipo-de-evento/{id}','API'),(85,'','2025-11-03 15:33:04.237704',NULL,3,'/api/lugares','API'),(86,'','2025-11-03 15:33:04.246704',NULL,2,'/api/provincias/{id}','API'),(87,'','2025-11-03 15:33:04.255726',NULL,1,'/api/parametro-comision/baja/{id}','API'),(88,'','2025-11-03 15:33:04.264705',NULL,3,'/api/seguridad/permisos/pantallas','API'),(89,'','2025-11-03 15:33:04.272707',NULL,3,'/api/reservas','API'),(90,'','2025-11-03 15:33:04.286704',NULL,2,'/api/reportes/vistasPorLugar/{id}','API'),(91,'','2025-11-03 15:33:04.296761',NULL,0,'/api/notificaciones/test/alerta/{usuarioId}','API'),(92,'','2025-11-03 15:33:04.304709',NULL,3,'/api/reportes/financiero/{id}','API'),(93,'','2025-11-03 15:33:04.313862',NULL,2,'/api/estado-del-evento/{id}','API'),(94,'','2025-11-03 15:33:04.322957',NULL,3,'/api/reportes/vistasPorServicio','API'),(95,'','2025-11-03 15:33:04.331868',NULL,3,'/api/eventos','API'),(96,'','2025-11-03 15:33:04.339726',NULL,3,'/api/reportes/vistasPorServicio/{id}','API'),(97,'','2025-11-03 15:33:04.348159',NULL,3,'/api/eventos/{id}','API'),(98,'','2025-11-03 15:33:04.356166',NULL,0,'/api/resena/crear','API'),(99,'','2025-11-03 15:33:04.364632',NULL,1,'/api/seguridad/grupos/baja','API'),(100,'','2025-11-03 15:33:04.372638',NULL,3,'/api/reportes/vistasPorLugar/obtener','API'),(101,'','2025-11-03 15:33:04.379637',NULL,1,'/api/eventos/baja/{id}','API'),(102,'','2025-11-03 15:33:04.387443',NULL,1,'/api/chat/propuestas/aceptar','API'),(103,'','2025-11-03 15:33:04.399523',NULL,3,'/api/provincias/{id}','API'),(104,'','2025-11-03 15:33:04.407558',NULL,3,'/api/seguridad/usuarios/{id}','API'),(105,'','2025-11-03 15:33:04.416522',NULL,1,'/api/caracteristica-de-lugar/baja/{id}','API'),(106,'','2025-11-03 15:33:04.425524',NULL,0,'/api/lugares','API'),(107,'','2025-11-03 15:33:04.433522',NULL,3,'/api/reservas/datosFormularioReserva/{idReserva}','API'),(108,'','2025-11-03 15:33:04.442524',NULL,3,'/api/estado-del-evento','API'),(109,'','2025-11-03 15:33:04.451523',NULL,3,'/api/seguridad/roles','API'),(110,'','2025-11-03 15:33:04.459622',NULL,1,'/api/seguridad/grupos/permisos/quitar-multiple','API'),(111,'','2025-11-03 15:33:04.468607',NULL,3,'/api/reportes/vistasPorLugar/{id}','API'),(112,'','2025-11-03 15:33:04.476777',NULL,3,'/api/seguridad/grupos/{id}','API'),(113,'','2025-11-03 15:33:04.485780',NULL,3,'/api/resena/{id}','API'),(114,'','2025-11-03 15:33:04.493815',NULL,1,'/api/seguridad/permisos/baja/{id}','API'),(115,'','2025-11-03 15:33:04.503111',NULL,3,'/api/estados-servicio/{id}','API'),(116,'','2025-11-03 15:33:04.510583',NULL,0,'/api/pagos/crear-preferencia','API'),(117,'','2025-11-03 15:33:04.519597',NULL,2,'/api/estado-backup/{id}','API'),(118,'','2025-11-03 15:33:04.527124',NULL,1,'/api/estados-servicio/baja/{id}','API'),(119,'','2025-11-03 15:33:04.535120',NULL,0,'/api/eventos','API'),(120,'','2025-11-03 15:33:04.542717',NULL,0,'/api/reportes/vistasPorServicio','API'),(121,'','2025-11-03 15:33:04.550399',NULL,3,'/api/parametro-comision','API'),(122,'','2025-11-03 15:33:04.557681',NULL,3,'/api/eventos/obtenerServicios/{idEvento}','API'),(123,'','2025-11-03 15:33:04.565712',NULL,1,'/api/tipo-de-servicio/baja/{id}','API'),(124,'','2025-11-03 15:33:04.573198',NULL,3,'/api/seguridad/permisos/get','API'),(125,'','2025-11-03 15:33:04.580247',NULL,1,'/api/eventos/editar/{idEvento}','API'),(126,'','2025-11-03 15:33:04.587244',NULL,3,'/api/estado-backup/get','API'),(127,'','2025-11-03 15:33:04.596244',NULL,3,'/api/estado-del-evento/get','API'),(128,'','2025-11-03 15:33:04.606633',NULL,1,'/api/seguridad/roles/{id}/estado','API'),(129,'','2025-11-03 15:33:04.621014',NULL,3,'/api/caracteristica-de-lugar/','API'),(130,'','2025-11-03 15:33:04.631537',NULL,3,'/api/parametro-comision/get','API'),(131,'','2025-11-03 15:33:04.640853',NULL,0,'/api/estado-del-evento','API'),(132,'','2025-11-03 15:33:04.649867',NULL,2,'/api/reservas/{id}','API'),(133,'','2025-11-03 15:33:04.657949',NULL,3,'/api/tipo-de-evento/get','API'),(134,'','2025-11-03 15:33:04.665948',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles-por-grupos','API'),(135,'','2025-11-03 15:33:04.674046',NULL,1,'/api/reportes/financiero/{id}','API'),(136,'','2025-11-03 15:33:04.683054',NULL,3,'/api/reportes/CantidadUsuariosActivos','API'),(137,'','2025-11-03 15:33:04.691025',NULL,1,'/api/reportes/vistasPorServicio/{id}','API'),(138,'','2025-11-03 15:33:04.700025',NULL,1,'/api/eventos/{id}','API'),(139,'','2025-11-03 15:33:04.708415',NULL,2,'/api/lugares/{id}','API'),(140,'','2025-11-03 15:33:04.718006',NULL,0,'/api/notificaciones/test/propuesta/{usuarioId}','API'),(141,'','2025-11-03 15:33:04.724550',NULL,0,'/api/parametro-comision','API'),(142,'','2025-11-03 15:33:04.732588',NULL,3,'/api/reportes/vistasPorLugar/get','API'),(143,'','2025-11-03 15:33:04.739556',NULL,0,'/api/provincias','API'),(144,'','2025-11-03 15:33:04.747179',NULL,3,'/api/seguridad/grupos/get','API'),(145,'','2025-11-03 15:33:04.754229',NULL,3,'/api/estado-backup','API'),(146,'','2025-11-03 15:33:04.762232',NULL,1,'/api/backups/baja-logica-backup/{idBackup}','API'),(147,'','2025-11-03 15:33:04.771639',NULL,1,'/api/seguridad/usuarios/{id}','API'),(148,'','2025-11-03 15:33:04.779727',NULL,3,'/api/backups/{id}','API'),(149,'','2025-11-03 15:33:04.789180',NULL,3,'/api/lugares/verDetalleLugar/{idLugar}','API'),(150,'','2025-11-03 15:33:04.798145',NULL,3,'/api/seguridad/usuarios/foto','API'),(151,'','2025-11-03 15:33:04.807145',NULL,3,'/api/caracteristica-de-lugar/get','API'),(152,'','2025-11-03 15:33:04.816142',NULL,3,'/api/seguridad/roles/sin-privilegios','API'),(153,'','2025-11-03 15:33:04.828144',NULL,1,'/api/seguridad/grupos/{id}','API'),(154,'','2025-11-03 15:33:04.838142',NULL,1,'/api/resena/{id}','API'),(155,'','2025-11-03 15:33:04.848233',NULL,3,'/api/seguridad/usuarios/perfil','API'),(156,'','2025-11-03 15:33:04.856145',NULL,1,'/api/estados-servicio/{id}','API'),(157,'','2025-11-03 15:33:04.867623',NULL,3,'/api/notificaciones/{id}','API'),(158,'','2025-11-03 15:33:04.875622',NULL,0,'/api/seguridad/usuarios/validar-codigo','API'),(159,'','2025-11-03 15:33:04.885624',NULL,0,'/api/reportes/CantidadUsuariosActivos','API'),(160,'','2025-11-03 15:33:04.895626',NULL,3,'/api/servicios/{id}','API'),(161,'','2025-11-03 15:33:04.904623',NULL,3,'/api/resena/get','API'),(162,'','2025-11-03 15:33:04.913670',NULL,0,'/api/lugares/modificarLugar','API'),(163,'','2025-11-03 15:33:04.921628',NULL,1,'/api/auditoriaTransaccion/confirmar-transferencia/{id}','API'),(164,'','2025-11-03 15:33:04.929625',NULL,3,'/api/tipo-de-servicio/{id}','API'),(165,'','2025-11-03 15:33:04.936630',NULL,3,'/api/reportes/vistasPorLugar','API'),(166,'','2025-11-03 15:33:04.943629',NULL,3,'/api/seguridad/usuarios/get','API'),(167,'','2025-11-03 15:33:04.951638',NULL,1,'/api/pagos/baja/{id}','API'),(168,'','2025-11-03 15:33:04.960149',NULL,0,'/api/backups/limpiar-retencion','API'),(169,'','2025-11-03 15:33:04.968160',NULL,3,'/api/datos-bancarios/{id}','API'),(170,'','2025-11-03 15:33:04.976173',NULL,3,'/api/reservas/get','API'),(171,'','2025-11-03 15:33:04.984895',NULL,3,'/api/servicios/getMisServicios','API'),(172,'','2025-11-03 15:33:04.992393',NULL,1,'/api/servicios/bajaServicio/{idServicio}','API'),(173,'','2025-11-03 15:33:05.001604',NULL,0,'/api/seguridad/usuarios/perfil','API'),(174,'','2025-11-03 15:33:05.011062',NULL,3,'/api/tipo-de-lugar/get','API'),(175,'','2025-11-03 15:33:05.019581',NULL,2,'/api/caracteristica-de-lugar/{id}','API'),(176,'','2025-11-03 15:33:05.030102',NULL,3,'/api/eventos/get','API'),(177,'','2025-11-03 15:33:05.039104',NULL,3,'/api/reportes/vistasPorServicio/get','API'),(178,'','2025-11-03 15:33:05.048111',NULL,3,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(179,'','2025-11-03 15:33:05.057115',NULL,3,'/api/localidades/get','API'),(180,'','2025-11-03 15:33:05.065632',NULL,0,'/api/seguridad/grupos/permiso/agregar','API'),(181,'','2025-11-03 15:33:05.074150',NULL,1,'/api/resena/update/{idReseña}','API'),(182,'','2025-11-03 15:33:05.083159',NULL,0,'/api/servicios/crearServicio','API'),(183,'','2025-11-03 15:33:05.090158',NULL,2,'/api/seguridad/permisos/{id}','API'),(184,'','2025-11-03 15:33:05.099186',NULL,3,'/api/servicios/obtenerEventosDisponibles/{fecha}/{idServicio}','API'),(185,'','2025-11-03 15:33:05.107199',NULL,1,'/api/backups/{id}','API'),(186,'','2025-11-03 15:33:05.117446',NULL,3,'/api/reportes/financiero/obtener','API'),(187,'','2025-11-03 15:33:05.125966',NULL,1,'/api/notificaciones/{id}','API'),(188,'','2025-11-03 15:33:05.133966',NULL,0,'/api/seguridad/roles/nuevo','API'),(189,'','2025-11-03 15:33:05.142484',NULL,3,'/api/tipo-de-evento','API'),(190,'','2025-11-03 15:33:05.150485',NULL,0,'/api/caracteristica-de-lugar','API'),(191,'','2025-11-03 15:33:05.159627',NULL,2,'/api/localidades/{id}','API'),(192,'','2025-11-03 15:33:05.166145',NULL,3,'/api/parametro-comision/{id}','API'),(193,'','2025-11-03 15:33:05.173139',NULL,0,'/api/notificaciones/crear','API'),(194,'','2025-11-03 15:33:05.180133',NULL,3,'/api/estados-servicio/get','API'),(195,'','2025-11-03 15:33:05.187138',NULL,3,'/api/eventos/obtenerLugar/{idEvento}','API'),(196,'','2025-11-03 15:33:05.194150',NULL,1,'/api/provincias/baja/{id}','API'),(197,'','2025-11-03 15:33:05.202123',NULL,0,'/mail/test','API'),(198,'','2025-11-03 15:33:05.209646',NULL,1,'/api/servicios/{id}','API'),(199,'','2025-11-03 15:33:05.219160',NULL,3,'/api/provincias/obtenerDtosProvincia','API'),(200,'','2025-11-03 15:33:05.227260',NULL,0,'/api/notificaciones','API'),(201,'','2025-11-03 15:33:05.235244',NULL,1,'/api/reservas/baja/{id}','API'),(202,'','2025-11-03 15:33:05.243160',NULL,3,'/api/tipo-de-lugar/{id}','API'),(203,'','2025-11-03 15:33:05.256162',NULL,3,'/api/seguridad/roles/mis-reportes','API'),(204,'','2025-11-03 15:33:05.264163',NULL,3,'/api/reportes/solicitudesPorLugar/obtener','API'),(205,'','2025-11-03 15:33:05.272157',NULL,0,'/api/notificaciones/test/mensaje/{usuarioId}','API'),(206,'','2025-11-03 15:33:05.282165',NULL,1,'/api/pagos/{id}/cambiar-visibilidad','API'),(207,'','2025-11-03 15:33:05.291199',NULL,3,'/api/lugares/get','API'),(208,'','2025-11-03 15:33:05.299160',NULL,1,'/api/tipo-de-servicio/{id}','API'),(209,'','2025-11-03 15:33:05.308160',NULL,3,'/api/localidades','API'),(210,'','2025-11-03 15:33:05.317162',NULL,0,'/api/lugares/crearLugar','API'),(211,'','2025-11-03 15:33:05.325086',NULL,0,'/api/backups/create','API'),(212,'','2025-11-03 15:33:05.334202',NULL,3,'/api/auditoriaTransaccion/transferencias-pendientes','API'),(213,'','2025-11-03 15:33:05.343039',NULL,2,'/api/notificaciones/{notificacionId}','API'),(214,'','2025-11-03 15:33:05.353053',NULL,3,'/oauth2/callback','API'),(215,'','2025-11-03 15:33:05.364605',NULL,1,'/api/datos-bancarios/{id}','API'),(216,'','2025-11-03 15:33:05.373345',NULL,3,'/api/backups/get','API'),(217,'','2025-11-03 15:33:05.382346',NULL,0,'/api/servicios/modificarServicio','API'),(218,'','2025-11-03 15:33:05.391505',NULL,0,'/api/tipo-de-evento','API'),(219,'','2025-11-03 15:33:05.399595',NULL,3,'/api/pagos/disponibles','API'),(220,'','2025-11-03 15:33:05.408352',NULL,3,'/api/lugares/getMisNombresLugar','API'),(221,'','2025-11-03 15:33:05.417347',NULL,1,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(222,'','2025-11-03 15:33:05.426788',NULL,3,'/api/reportes/financiero','API'),(223,'','2025-11-03 15:33:05.436785',NULL,1,'/api/estado-backup/baja/{id}','API'),(224,'','2025-11-03 15:33:05.446746',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles','API'),(225,'','2025-11-03 15:33:05.456297',NULL,0,'/api/pagos/procesar-pago','API'),(226,'','2025-11-03 15:33:05.465784',NULL,3,'/api/tipo-de-servicio/obtenerDtosTipoServicio','API'),(227,'','2025-11-03 15:33:05.474803',NULL,3,'/api/lugares/obtenerEventosDisponibles/{fecha}/{idLugar}','API'),(228,'','2025-11-03 15:33:05.485097',NULL,0,'/api/seguridad/usuarios/recuperar','API'),(229,'','2025-11-03 15:33:05.493641',NULL,0,'/api/localidades','API'),(230,'','2025-11-03 15:33:05.503544',NULL,0,'/api/seguridad/usuarios/cambiar-contrasena','API'),(231,'','2025-11-03 15:33:05.512539',NULL,3,'/api/lugares/obtenerDtoLugares','API'),(232,'','2025-11-03 15:33:05.520304',NULL,1,'/api/lugares/baja/{id}','API'),(233,'','2025-11-03 15:33:05.527543',NULL,0,'/api/backups/restaurar/{idBackup}','API'),(234,'','2025-11-03 15:33:05.535174',NULL,3,'/api/tipo-de-lugar/obtenerDtosTipoLugar','API'),(235,'','2025-11-03 15:33:05.541124',NULL,1,'/api/reservas/reservaAPagar','API'),(236,'','2025-11-03 15:33:05.548114',NULL,1,'/api/eventos/cancelar/{idEvento}','API'),(237,'','2025-11-03 15:33:05.555118',NULL,1,'/api/parametro-comision/{id}','API'),(238,'','2025-11-03 15:33:05.563102',NULL,3,'/api/servicios/get','API'),(239,'','2025-11-03 15:33:05.570100',NULL,3,'/api/pagos/{id}','API'),(240,'','2025-11-03 15:33:05.575609',NULL,0,'/api/seguridad/usuarios/registrarse','API'),(241,'','2025-11-03 15:33:05.582364',NULL,1,'/api/tipo-de-lugar/baja/{id}','API'),(242,'','2025-11-03 15:33:05.590382',NULL,0,'/api/notificaciones/test/recordatorio/{usuarioId}','API'),(243,'','2025-11-03 15:33:05.597676',NULL,1,'/api/tipo-de-lugar/{id}','API'),(244,'','2025-11-03 15:33:05.606726',NULL,0,'/api/reportes/financiero','API'),(245,'','2025-11-03 15:33:05.614738',NULL,3,'/api/tipo-de-evento/{id}','API'),(246,'','2025-11-03 15:33:05.623240',NULL,1,'/api/notificaciones/leer-todas','API'),(247,'','2025-11-03 15:33:05.631986',NULL,0,'/api/seguridad/grupos/nuevo','API'),(248,'','2025-11-03 15:33:05.640413',NULL,3,'/api/parametro-comision/vigente','API'),(249,'','2025-11-03 15:33:05.649695',NULL,1,'/api/servicios/iniciarChat','API'),(250,'','2025-11-03 15:33:05.656696',NULL,2,'/api/reportes/financiero/{id}','API'),(251,'','2025-11-03 15:33:05.665701',NULL,2,'/api/reportes/vistasPorServicio/{id}','API'),(252,'','2025-11-03 15:33:05.673210',NULL,0,'/api/reservas','API'),(253,'','2025-11-03 15:33:05.686041',NULL,2,'/api/eventos/{id}','API'),(254,'','2025-11-03 15:33:05.693047',NULL,3,'/api/estado-del-evento/{id}','API'),(255,'','2025-11-03 15:33:05.701652',NULL,1,'/api/notificaciones/{notificacionId}/leer','API'),(256,'','2025-11-03 15:33:05.710645',NULL,2,'/api/seguridad/usuarios/{id}','API'),(257,'','2025-11-03 15:33:05.719636',NULL,3,'/api/datos-bancarios','API'),(258,'','2025-11-03 15:33:05.728635',NULL,3,'/api/tipo-de-servicio/get','API'),(259,'','2025-11-03 15:33:05.735634',NULL,2,'/api/seguridad/grupos/{id}','API'),(260,'','2025-11-03 15:33:05.741734',NULL,2,'/api/resena/{id}','API'),(261,'','2025-11-03 15:33:05.748546',NULL,3,'/api/servicios/getMisNombresServicio','API'),(262,'','2025-11-03 15:33:05.756511',NULL,2,'/api/estados-servicio/{id}','API'),(263,'','2025-11-03 15:33:05.763513',NULL,3,'/api/estado-backup/{id}','API'),(264,'','2025-11-03 15:33:05.772204',NULL,1,'/api/reportes/vistasPorLugar/baja/{id}','API'),(265,'','2025-11-03 15:33:05.779992',NULL,1,'/api/pagos/{id}','API'),(266,'','2025-11-03 15:33:05.788033',NULL,3,'/api/reportes/CantidadUsuariosActivos/obtener','API'),(267,'','2025-11-03 15:33:05.797563',NULL,1,'/api/reportes/CantidadUsuariosActivos/baja/{id}','API'),(268,'','2025-11-03 15:33:05.806525',NULL,1,'/api/tipo-de-evento/{id}','API'),(269,'','2025-11-03 15:33:05.816475',NULL,3,'/api/reservas/mis-reservas-lugar','API'),(270,'','2025-11-03 15:33:05.828000',NULL,1,'/api/provincias/{id}','API'),(271,'','2025-11-03 15:33:05.837028',NULL,0,'/api/seguridad/usuarios/reenviar-codigo','API'),(272,'','2025-11-03 15:33:05.846029',NULL,1,'/api/seguridad/grupos/permisos/agregar','API'),(273,'','2025-11-03 15:33:05.855025',NULL,0,'/api/datos-bancarios','API'),(274,'','2025-11-03 15:33:05.865023',NULL,3,'/api/reportes/serviciosMasSolicitados','API'),(275,'','2025-11-03 15:33:05.873024',NULL,1,'/api/reportes/vistasPorLugar/{id}','API'),(276,'','2025-11-03 15:33:05.881533',NULL,1,'/api/estado-del-evento/baja/{id}','API'),(277,'','2025-11-03 15:33:05.890550',NULL,3,'/api/notificaciones/get','API'),(278,'','2025-11-03 15:33:05.900100',NULL,1,'/api/estado-del-evento/{id}','API'),(279,'','2025-11-03 15:33:05.908719',NULL,3,'/api/reservas/{id}','API'),(280,'','2025-11-03 15:33:05.916869',NULL,1,'/api/reportes/financiero/baja/{id}','API'),(281,'','2025-11-03 15:33:05.925214',NULL,3,'/api/backups/mis-backups','API'),(282,'','2025-11-03 15:33:05.934207',NULL,3,'/api/provincias','API'),(283,'','2025-11-03 15:33:05.942214',NULL,3,'/api/lugares/{id}','API'),(284,'','2025-11-03 15:33:05.952352',NULL,2,'/api/resena/delete/{idReseña}','API'),(285,'','2025-11-03 15:33:05.961821',NULL,1,'/api/seguridad/usuarios/baja/{id}','API'),(286,'','2025-11-03 15:33:05.970995',NULL,3,'/api/pagos','API'),(287,'Acceso a ABM Backups','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/ABMBackups','PANTALLA'),(288,'Contrataciones de un evento','2025-11-03 15:44:15.718976',NULL,3,'Inicio/mis-eventos/contrataciones/:eventoId','PANTALLA'),(289,'Buscar lugares','2025-11-03 15:44:15.718976',NULL,3,'/buscar-lugares','PANTALLA'),(290,'Mis reservaciones','2025-11-03 15:44:15.718976',NULL,3,'Inicio/mis-reservaciones','PANTALLA'),(291,'Mis lugares','2025-11-03 15:44:15.718976',NULL,3,'Inicio/mis-lugares','PANTALLA'),(292,'Ver detalle de lugar','2025-11-03 15:44:15.718976',NULL,3,'/ver-detalle-lugar/:idLugar','PANTALLA'),(293,'Buscar lugares + detalle','2025-11-03 15:44:15.718976',NULL,3,'/buscar-lugares/ver-detalle-lugar/:idLugar','PANTALLA'),(294,'Configuraciones de propietario','2025-11-03 15:44:15.718976',NULL,3,'/configuracionesPropietario','PANTALLA'),(295,'Reservar','2025-11-03 15:44:15.718976',NULL,3,'/Reservar','PANTALLA'),(296,'Medio de pago','2025-11-03 15:44:15.718976',NULL,3,'/MedioPago','PANTALLA'),(297,'Descargar factura','2025-11-03 15:44:15.718976',NULL,3,'/DescargarFactura','PANTALLA'),(298,'Éxito en el pago','2025-11-03 15:44:15.718976',NULL,3,'/ExitoPago','PANTALLA'),(299,'Fallo en el pago','2025-11-03 15:44:15.718976',NULL,3,'/FalloPago','PANTALLA'),(300,'Pago pendiente','2025-11-03 15:44:15.718976',NULL,3,'/PendientePago','PANTALLA'),(301,'Usuarios activos','2025-11-03 15:44:15.718976',NULL,3,'/administracion/usuariosactivos','PANTALLA'),(302,'Buscar servicios','2025-11-03 15:44:15.718976',NULL,3,'/buscar-servicios','PANTALLA'),(303,'Mis servicios','2025-11-03 15:44:15.718976',NULL,3,'inicio/mis-servicios','PANTALLA'),(304,'Ver detalle de servicio','2025-11-03 15:44:15.718976',NULL,3,'/buscar-servicios/ver-detalle-servicio/:idServicio','PANTALLA'),(305,'Detalle de servicio','2025-11-03 15:44:15.718976',NULL,3,'/ver-detalle-servicio','PANTALLA'),(306,'Chatear','2025-11-03 15:44:15.718976',NULL,3,'/chatear','PANTALLA'),(307,'Configuraciones del Sistema','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones','PANTALLA'),(308,'Configuraciones de prestador','2025-11-03 15:44:15.718976',NULL,3,'/ConfiguracionesPrestador','PANTALLA'),(309,'Config. provincias','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/provincias','PANTALLA'),(310,'Config. localidades','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/localidades','PANTALLA'),(311,'Config. parámetro comisión','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/parametroComision','PANTALLA'),(312,'Config. estados backup','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/estadosBackup','PANTALLA'),(313,'Config. medios de pago','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/MediosDePago','PANTALLA'),(314,'Config. estado servicio','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/estadoServicio','PANTALLA'),(315,'Config. permisos','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/permisos','PANTALLA'),(316,'Config. roles','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/roles','PANTALLA'),(317,'Config. tipo de evento','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/tipo-de-evento','PANTALLA'),(318,'Config. tipo de servicio','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/tipo-de-servicio','PANTALLA'),(319,'Config. tipo de lugar','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/tipo-de-lugar','PANTALLA'),(320,'Config. características del lugar','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/caracteristicas-del-lugar','PANTALLA'),(321,'Config. estado del evento','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/estado-del-evento','PANTALLA'),(322,'Recuperar contraseña','2025-11-03 15:44:15.718976',NULL,3,'/recuperar-contraseña','PANTALLA'),(323,'Login y register','2025-11-03 15:44:15.718976',NULL,3,'/Login_y_register','PANTALLA'),(324,'Ver mis Eventos','2025-11-03 15:44:15.718976',NULL,3,'Inicio/mis-eventos','PANTALLA'),(325,'Ver mi perfil','2025-11-03 15:44:15.718976',NULL,3,'Inicio/mi-perfil','PANTALLA'),(326,'Home','2025-11-03 15:44:15.718976',NULL,3,'/Inicio','PANTALLA'),(327,'Reporte de vistas por servicio para el prestador','2025-11-03 15:44:15.718976',NULL,3,'/reportes/vistas-por-servicio','PANTALLA'),(328,'Reporte de vistas por lugar para el propietario','2025-11-03 15:44:15.718976',NULL,3,'/reportes/vistas-por-lugar','PANTALLA'),(329,'Conf. para confirmar las transferencias que ya se realizaron de manera manual','2025-11-03 15:44:15.718976',NULL,3,'/configuraciones/transferencias-pendientes','PANTALLA');
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
INSERT INTO `permisos_aud` VALUES (1,1,0,'','2025-11-03 15:33:03.332949',NULL,2,'/api/backups/{id}','API'),(2,2,0,'','2025-11-03 15:33:03.452678',NULL,0,'/api/estado-backup','API'),(3,3,0,'','2025-11-03 15:33:03.467677',NULL,1,'/api/provincias/{idProvincia}/localidad/{idLocalidad}','API'),(4,4,0,'','2025-11-03 15:33:03.480085',NULL,3,'/api/servicios/verDetalleServicio/{idServicio}','API'),(5,5,0,'','2025-11-03 15:33:03.489254',NULL,2,'/api/notificaciones/{id}','API'),(6,6,0,'','2025-11-03 15:33:03.499254',NULL,1,'/api/seguridad/grupos/baja/{id}','API'),(7,7,0,'','2025-11-03 15:33:03.509260',NULL,2,'/api/servicios/{id}','API'),(8,8,0,'','2025-11-03 15:33:03.518253',NULL,3,'/api/datos-bancarios/get','API'),(9,9,0,'','2025-11-03 15:33:03.527255',NULL,1,'/api/estado-backup/{id}','API'),(10,10,0,'','2025-11-03 15:33:03.536253',NULL,0,'/api/seguridad/usuarios/login','API'),(11,11,0,'','2025-11-03 15:33:03.544253',NULL,3,'/api/seguridad/permisos','API'),(12,12,0,'','2025-11-03 15:33:03.552253',NULL,2,'/api/tipo-de-servicio/{id}','API'),(13,13,0,'','2025-11-03 15:33:03.563381',NULL,3,'/api/reportes/CantidadUsuariosActivos/get','API'),(14,14,0,'','2025-11-03 15:33:03.573656',NULL,3,'/api/estados-servicio','API'),(15,15,0,'','2025-11-03 15:33:03.582653',NULL,3,'/api/servicios/obtenerDtosServicio','API'),(16,16,0,'','2025-11-03 15:33:03.593662',NULL,3,'/api/resena','API'),(17,17,0,'','2025-11-03 15:33:03.603178',NULL,3,'/api/tipo-de-servicio','API'),(18,18,0,'','2025-11-03 15:33:03.614772',NULL,3,'/api/notificaciones/mias','API'),(19,19,0,'','2025-11-03 15:33:03.624853',NULL,0,'/api/pagos','API'),(20,20,0,'','2025-11-03 15:33:03.635781',NULL,2,'/api/datos-bancarios/{id}','API'),(21,21,0,'','2025-11-03 15:33:03.646791',NULL,3,'/api/reservas/mis-reservas-servicio','API'),(22,22,0,'','2025-11-03 15:33:03.656310',NULL,3,'/api/eventos/mis-eventos','API'),(23,23,0,'','2025-11-03 15:33:03.667319',NULL,0,'/api/reportes/vistasPorLugar','API'),(24,24,0,'','2025-11-03 15:33:03.676491',NULL,3,'/api/seguridad/usuarios','API'),(25,25,0,'','2025-11-03 15:33:03.687028',NULL,1,'/api/reservas/{id}','API'),(26,26,0,'','2025-11-03 15:33:03.695949',NULL,2,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(27,27,0,'','2025-11-03 15:33:03.705870',NULL,3,'/api/caracteristica-de-lugar/{id}','API'),(28,28,0,'','2025-11-03 15:33:03.713800',NULL,3,'/api/reportes/financiero/get','API'),(29,29,0,'','2025-11-03 15:33:03.722259',NULL,0,'/api/factura/crear','API'),(30,30,0,'','2025-11-03 15:33:03.731208',NULL,1,'/api/lugares/{id}','API'),(31,31,0,'','2025-11-03 15:33:03.739508',NULL,3,'/api/tipo-de-lugar','API'),(32,32,0,'','2025-11-03 15:33:03.748048',NULL,1,'/api/datos-bancarios/baja/{id}','API'),(33,33,0,'','2025-11-03 15:33:03.756692',NULL,3,'/api/backups','API'),(34,34,0,'','2025-11-03 15:33:03.764392',NULL,0,'/api/seguridad/permisos','API'),(35,35,0,'','2025-11-03 15:33:03.774617',NULL,3,'/api/chat','API'),(36,36,0,'','2025-11-03 15:33:03.785567',NULL,3,'/api/seguridad/grupos','API'),(37,37,0,'','2025-11-03 15:33:03.795115',NULL,3,'/api/reportes/vistasPorServicio/obtener','API'),(38,38,0,'','2025-11-03 15:33:03.807142',NULL,1,'/api/seguridad/permisos/actualizar/{id}','API'),(39,39,0,'','2025-11-03 15:33:03.817109',NULL,0,'/api/resena/getResenaPorUsuario','API'),(40,40,0,'','2025-11-03 15:33:03.827125',NULL,1,'/api/reportes/vistasPorServicio/baja/{id}','API'),(41,41,0,'','2025-11-03 15:33:03.836147',NULL,0,'/api/chat/propuesta','API'),(42,42,0,'','2025-11-03 15:33:03.847851',NULL,1,'/api/seguridad/grupos/permiso/quitar','API'),(43,43,0,'','2025-11-03 15:33:03.857851',NULL,0,'/api/estados-servicio','API'),(44,44,0,'','2025-11-03 15:33:03.869414',NULL,3,'/api/seguridad/permisos/{id}','API'),(45,45,0,'','2025-11-03 15:33:03.879413',NULL,0,'/api/resena','API'),(46,46,0,'','2025-11-03 15:33:03.888417',NULL,0,'/api/tipo-de-servicio','API'),(47,47,0,'','2025-11-03 15:33:03.898407',NULL,1,'/api/localidades/baja/{id}','API'),(48,48,0,'','2025-11-03 15:33:03.907928',NULL,0,'/api/eventos/nuevo','API'),(49,49,0,'','2025-11-03 15:33:03.915890',NULL,3,'/api/notificaciones','API'),(50,50,0,'','2025-11-03 15:33:03.924690',NULL,3,'/api/pagos/get','API'),(51,51,0,'','2025-11-03 15:33:03.933496',NULL,3,'/api/notificaciones/count','API'),(52,52,0,'','2025-11-03 15:33:03.942557',NULL,2,'/api/parametro-comision/{id}','API'),(53,53,0,'','2025-11-03 15:33:03.955567',NULL,0,'/api/seguridad/usuarios','API'),(54,54,0,'','2025-11-03 15:33:03.964937',NULL,3,'/api/localidades/{id}','API'),(55,55,0,'','2025-11-03 15:33:03.972998',NULL,1,'/api/notificaciones/baja/{id}','API'),(56,56,0,'','2025-11-03 15:33:03.980879',NULL,3,'/api/estados-servicio/todos','API'),(57,57,0,'','2025-11-03 15:33:03.990483',NULL,2,'/api/tipo-de-lugar/{id}','API'),(58,58,0,'','2025-11-03 15:33:03.999046',NULL,1,'/api/seguridad/roles/{id}/actualizar','API'),(59,59,0,'','2025-11-03 15:33:04.007514',NULL,0,'/api/tipo-de-lugar','API'),(60,60,0,'','2025-11-03 15:33:04.017526',NULL,0,'/api/backups','API'),(61,61,0,'','2025-11-03 15:33:04.026525',NULL,0,'/api/seguridad/grupos','API'),(62,62,0,'','2025-11-03 15:33:04.035522',NULL,0,'/api/eventos/actualizar-realizados','API'),(63,63,0,'','2025-11-03 15:33:04.044528',NULL,3,'/api/servicios','API'),(64,64,0,'','2025-11-03 15:33:04.055529',NULL,1,'/api/lugares/iniciarReserva','API'),(65,65,0,'','2025-11-03 15:33:04.065122',NULL,0,'/api/backups/realizar-backups','API'),(66,66,0,'','2025-11-03 15:33:04.073687',NULL,1,'/api/servicios/baja/{id}','API'),(67,67,0,'','2025-11-03 15:33:04.083765',NULL,1,'/api/reservas/confirmar-reserva','API'),(68,68,0,'','2025-11-03 15:33:04.093756',NULL,1,'/api/tipo-de-evento/baja/{id}','API'),(69,69,0,'','2025-11-03 15:33:04.103758',NULL,2,'/api/seguridad/roles/{id}','API'),(70,70,0,'','2025-11-03 15:33:04.111945',NULL,1,'/api/caracteristica-de-lugar/{id}','API'),(71,71,0,'','2025-11-03 15:33:04.119507',NULL,3,'/api/reportes/serviciosMasSolicitados/filtros','API'),(72,72,0,'','2025-11-03 15:33:04.128318',NULL,3,'/api/provincias/get','API'),(73,73,0,'','2025-11-03 15:33:04.136993',NULL,3,'/api/lugares/getMisLugares','API'),(74,74,0,'','2025-11-03 15:33:04.145585',NULL,1,'/api/backups/baja/{id}','API'),(75,75,0,'','2025-11-03 15:33:04.153543',NULL,3,'/api/reservas/estados-reserva','API'),(76,76,0,'','2025-11-03 15:33:04.162139',NULL,0,'/api/pagos/sincronizar','API'),(77,77,0,'','2025-11-03 15:33:04.171100',NULL,1,'/api/seguridad/permisos/{id}','API'),(78,78,0,'','2025-11-03 15:33:04.178132',NULL,1,'/api/chat/propuestas/eliminar','API'),(79,79,0,'','2025-11-03 15:33:04.186968',NULL,0,'/api/servicios','API'),(80,80,0,'','2025-11-03 15:33:04.194069',NULL,1,'/api/localidades/{id}','API'),(81,81,0,'','2025-11-03 15:33:04.202309',NULL,2,'/api/pagos/{id}','API'),(82,82,0,'','2025-11-03 15:33:04.211351',NULL,1,'/api/lugares/bajaLugar/{idLugar}','API'),(83,83,0,'','2025-11-03 15:33:04.219788',NULL,1,'/api/resena/baja/{id}','API'),(84,84,0,'','2025-11-03 15:33:04.228705',NULL,2,'/api/tipo-de-evento/{id}','API'),(85,85,0,'','2025-11-03 15:33:04.237704',NULL,3,'/api/lugares','API'),(86,86,0,'','2025-11-03 15:33:04.246704',NULL,2,'/api/provincias/{id}','API'),(87,87,0,'','2025-11-03 15:33:04.255726',NULL,1,'/api/parametro-comision/baja/{id}','API'),(88,88,0,'','2025-11-03 15:33:04.264705',NULL,3,'/api/seguridad/permisos/pantallas','API'),(89,89,0,'','2025-11-03 15:33:04.272707',NULL,3,'/api/reservas','API'),(90,90,0,'','2025-11-03 15:33:04.286704',NULL,2,'/api/reportes/vistasPorLugar/{id}','API'),(91,91,0,'','2025-11-03 15:33:04.296761',NULL,0,'/api/notificaciones/test/alerta/{usuarioId}','API'),(92,92,0,'','2025-11-03 15:33:04.304709',NULL,3,'/api/reportes/financiero/{id}','API'),(93,93,0,'','2025-11-03 15:33:04.313862',NULL,2,'/api/estado-del-evento/{id}','API'),(94,94,0,'','2025-11-03 15:33:04.322957',NULL,3,'/api/reportes/vistasPorServicio','API'),(95,95,0,'','2025-11-03 15:33:04.331868',NULL,3,'/api/eventos','API'),(96,96,0,'','2025-11-03 15:33:04.339726',NULL,3,'/api/reportes/vistasPorServicio/{id}','API'),(97,97,0,'','2025-11-03 15:33:04.348159',NULL,3,'/api/eventos/{id}','API'),(98,98,0,'','2025-11-03 15:33:04.356166',NULL,0,'/api/resena/crear','API'),(99,99,0,'','2025-11-03 15:33:04.364632',NULL,1,'/api/seguridad/grupos/baja','API'),(100,100,0,'','2025-11-03 15:33:04.372638',NULL,3,'/api/reportes/vistasPorLugar/obtener','API'),(101,101,0,'','2025-11-03 15:33:04.379637',NULL,1,'/api/eventos/baja/{id}','API'),(102,102,0,'','2025-11-03 15:33:04.387443',NULL,1,'/api/chat/propuestas/aceptar','API'),(103,103,0,'','2025-11-03 15:33:04.399523',NULL,3,'/api/provincias/{id}','API'),(104,104,0,'','2025-11-03 15:33:04.407558',NULL,3,'/api/seguridad/usuarios/{id}','API'),(105,105,0,'','2025-11-03 15:33:04.416522',NULL,1,'/api/caracteristica-de-lugar/baja/{id}','API'),(106,106,0,'','2025-11-03 15:33:04.425524',NULL,0,'/api/lugares','API'),(107,107,0,'','2025-11-03 15:33:04.433522',NULL,3,'/api/reservas/datosFormularioReserva/{idReserva}','API'),(108,108,0,'','2025-11-03 15:33:04.442524',NULL,3,'/api/estado-del-evento','API'),(109,109,0,'','2025-11-03 15:33:04.451523',NULL,3,'/api/seguridad/roles','API'),(110,110,0,'','2025-11-03 15:33:04.459622',NULL,1,'/api/seguridad/grupos/permisos/quitar-multiple','API'),(111,111,0,'','2025-11-03 15:33:04.468607',NULL,3,'/api/reportes/vistasPorLugar/{id}','API'),(112,112,0,'','2025-11-03 15:33:04.476777',NULL,3,'/api/seguridad/grupos/{id}','API'),(113,113,0,'','2025-11-03 15:33:04.485780',NULL,3,'/api/resena/{id}','API'),(114,114,0,'','2025-11-03 15:33:04.493815',NULL,1,'/api/seguridad/permisos/baja/{id}','API'),(115,115,0,'','2025-11-03 15:33:04.503111',NULL,3,'/api/estados-servicio/{id}','API'),(116,116,0,'','2025-11-03 15:33:04.510583',NULL,0,'/api/pagos/crear-preferencia','API'),(117,117,0,'','2025-11-03 15:33:04.519597',NULL,2,'/api/estado-backup/{id}','API'),(118,118,0,'','2025-11-03 15:33:04.527124',NULL,1,'/api/estados-servicio/baja/{id}','API'),(119,119,0,'','2025-11-03 15:33:04.535120',NULL,0,'/api/eventos','API'),(120,120,0,'','2025-11-03 15:33:04.542717',NULL,0,'/api/reportes/vistasPorServicio','API'),(121,121,0,'','2025-11-03 15:33:04.550399',NULL,3,'/api/parametro-comision','API'),(122,122,0,'','2025-11-03 15:33:04.557681',NULL,3,'/api/eventos/obtenerServicios/{idEvento}','API'),(123,123,0,'','2025-11-03 15:33:04.565712',NULL,1,'/api/tipo-de-servicio/baja/{id}','API'),(124,124,0,'','2025-11-03 15:33:04.573198',NULL,3,'/api/seguridad/permisos/get','API'),(125,125,0,'','2025-11-03 15:33:04.580247',NULL,1,'/api/eventos/editar/{idEvento}','API'),(126,126,0,'','2025-11-03 15:33:04.587244',NULL,3,'/api/estado-backup/get','API'),(127,127,0,'','2025-11-03 15:33:04.596244',NULL,3,'/api/estado-del-evento/get','API'),(128,128,0,'','2025-11-03 15:33:04.606633',NULL,1,'/api/seguridad/roles/{id}/estado','API'),(129,129,0,'','2025-11-03 15:33:04.621014',NULL,3,'/api/caracteristica-de-lugar/','API'),(130,130,0,'','2025-11-03 15:33:04.631537',NULL,3,'/api/parametro-comision/get','API'),(131,131,0,'','2025-11-03 15:33:04.640853',NULL,0,'/api/estado-del-evento','API'),(132,132,0,'','2025-11-03 15:33:04.649867',NULL,2,'/api/reservas/{id}','API'),(133,133,0,'','2025-11-03 15:33:04.657949',NULL,3,'/api/tipo-de-evento/get','API'),(134,134,0,'','2025-11-03 15:33:04.665948',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles-por-grupos','API'),(135,135,0,'','2025-11-03 15:33:04.674046',NULL,1,'/api/reportes/financiero/{id}','API'),(136,136,0,'','2025-11-03 15:33:04.683054',NULL,3,'/api/reportes/CantidadUsuariosActivos','API'),(137,137,0,'','2025-11-03 15:33:04.691025',NULL,1,'/api/reportes/vistasPorServicio/{id}','API'),(138,138,0,'','2025-11-03 15:33:04.700025',NULL,1,'/api/eventos/{id}','API'),(139,139,0,'','2025-11-03 15:33:04.708415',NULL,2,'/api/lugares/{id}','API'),(140,140,0,'','2025-11-03 15:33:04.718006',NULL,0,'/api/notificaciones/test/propuesta/{usuarioId}','API'),(141,141,0,'','2025-11-03 15:33:04.724550',NULL,0,'/api/parametro-comision','API'),(142,142,0,'','2025-11-03 15:33:04.732588',NULL,3,'/api/reportes/vistasPorLugar/get','API'),(143,143,0,'','2025-11-03 15:33:04.739556',NULL,0,'/api/provincias','API'),(144,144,0,'','2025-11-03 15:33:04.747179',NULL,3,'/api/seguridad/grupos/get','API'),(145,145,0,'','2025-11-03 15:33:04.754229',NULL,3,'/api/estado-backup','API'),(146,146,0,'','2025-11-03 15:33:04.762232',NULL,1,'/api/backups/baja-logica-backup/{idBackup}','API'),(147,147,0,'','2025-11-03 15:33:04.771639',NULL,1,'/api/seguridad/usuarios/{id}','API'),(148,148,0,'','2025-11-03 15:33:04.779727',NULL,3,'/api/backups/{id}','API'),(149,149,0,'','2025-11-03 15:33:04.789180',NULL,3,'/api/lugares/verDetalleLugar/{idLugar}','API'),(150,150,0,'','2025-11-03 15:33:04.798145',NULL,3,'/api/seguridad/usuarios/foto','API'),(151,151,0,'','2025-11-03 15:33:04.807145',NULL,3,'/api/caracteristica-de-lugar/get','API'),(152,152,0,'','2025-11-03 15:33:04.816142',NULL,3,'/api/seguridad/roles/sin-privilegios','API'),(153,153,0,'','2025-11-03 15:33:04.828144',NULL,1,'/api/seguridad/grupos/{id}','API'),(154,154,0,'','2025-11-03 15:33:04.838142',NULL,1,'/api/resena/{id}','API'),(155,155,0,'','2025-11-03 15:33:04.848233',NULL,3,'/api/seguridad/usuarios/perfil','API'),(156,156,0,'','2025-11-03 15:33:04.856145',NULL,1,'/api/estados-servicio/{id}','API'),(157,157,0,'','2025-11-03 15:33:04.867623',NULL,3,'/api/notificaciones/{id}','API'),(158,158,0,'','2025-11-03 15:33:04.875622',NULL,0,'/api/seguridad/usuarios/validar-codigo','API'),(159,159,0,'','2025-11-03 15:33:04.885624',NULL,0,'/api/reportes/CantidadUsuariosActivos','API'),(160,160,0,'','2025-11-03 15:33:04.895626',NULL,3,'/api/servicios/{id}','API'),(161,161,0,'','2025-11-03 15:33:04.904623',NULL,3,'/api/resena/get','API'),(162,162,0,'','2025-11-03 15:33:04.913670',NULL,0,'/api/lugares/modificarLugar','API'),(163,163,0,'','2025-11-03 15:33:04.921628',NULL,1,'/api/auditoriaTransaccion/confirmar-transferencia/{id}','API'),(164,164,0,'','2025-11-03 15:33:04.929625',NULL,3,'/api/tipo-de-servicio/{id}','API'),(165,165,0,'','2025-11-03 15:33:04.936630',NULL,3,'/api/reportes/vistasPorLugar','API'),(166,166,0,'','2025-11-03 15:33:04.943629',NULL,3,'/api/seguridad/usuarios/get','API'),(167,167,0,'','2025-11-03 15:33:04.951638',NULL,1,'/api/pagos/baja/{id}','API'),(168,168,0,'','2025-11-03 15:33:04.960149',NULL,0,'/api/backups/limpiar-retencion','API'),(169,169,0,'','2025-11-03 15:33:04.968160',NULL,3,'/api/datos-bancarios/{id}','API'),(170,170,0,'','2025-11-03 15:33:04.976173',NULL,3,'/api/reservas/get','API'),(171,171,0,'','2025-11-03 15:33:04.984895',NULL,3,'/api/servicios/getMisServicios','API'),(172,172,0,'','2025-11-03 15:33:04.992393',NULL,1,'/api/servicios/bajaServicio/{idServicio}','API'),(173,173,0,'','2025-11-03 15:33:05.001604',NULL,0,'/api/seguridad/usuarios/perfil','API'),(174,174,0,'','2025-11-03 15:33:05.011062',NULL,3,'/api/tipo-de-lugar/get','API'),(175,175,0,'','2025-11-03 15:33:05.019581',NULL,2,'/api/caracteristica-de-lugar/{id}','API'),(176,176,0,'','2025-11-03 15:33:05.030102',NULL,3,'/api/eventos/get','API'),(177,177,0,'','2025-11-03 15:33:05.039104',NULL,3,'/api/reportes/vistasPorServicio/get','API'),(178,178,0,'','2025-11-03 15:33:05.048111',NULL,3,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(179,179,0,'','2025-11-03 15:33:05.057115',NULL,3,'/api/localidades/get','API'),(180,180,0,'','2025-11-03 15:33:05.065632',NULL,0,'/api/seguridad/grupos/permiso/agregar','API'),(181,181,0,'','2025-11-03 15:33:05.074150',NULL,1,'/api/resena/update/{idReseña}','API'),(182,182,0,'','2025-11-03 15:33:05.083159',NULL,0,'/api/servicios/crearServicio','API'),(183,183,0,'','2025-11-03 15:33:05.090158',NULL,2,'/api/seguridad/permisos/{id}','API'),(184,184,0,'','2025-11-03 15:33:05.099186',NULL,3,'/api/servicios/obtenerEventosDisponibles/{fecha}/{idServicio}','API'),(185,185,0,'','2025-11-03 15:33:05.107199',NULL,1,'/api/backups/{id}','API'),(186,186,0,'','2025-11-03 15:33:05.117446',NULL,3,'/api/reportes/financiero/obtener','API'),(187,187,0,'','2025-11-03 15:33:05.125966',NULL,1,'/api/notificaciones/{id}','API'),(188,188,0,'','2025-11-03 15:33:05.133966',NULL,0,'/api/seguridad/roles/nuevo','API'),(189,189,0,'','2025-11-03 15:33:05.142484',NULL,3,'/api/tipo-de-evento','API'),(190,190,0,'','2025-11-03 15:33:05.150485',NULL,0,'/api/caracteristica-de-lugar','API'),(191,191,0,'','2025-11-03 15:33:05.159627',NULL,2,'/api/localidades/{id}','API'),(192,192,0,'','2025-11-03 15:33:05.166145',NULL,3,'/api/parametro-comision/{id}','API'),(193,193,0,'','2025-11-03 15:33:05.173139',NULL,0,'/api/notificaciones/crear','API'),(194,194,0,'','2025-11-03 15:33:05.180133',NULL,3,'/api/estados-servicio/get','API'),(195,195,0,'','2025-11-03 15:33:05.187138',NULL,3,'/api/eventos/obtenerLugar/{idEvento}','API'),(196,196,0,'','2025-11-03 15:33:05.194150',NULL,1,'/api/provincias/baja/{id}','API'),(197,197,0,'','2025-11-03 15:33:05.202123',NULL,0,'/mail/test','API'),(198,198,0,'','2025-11-03 15:33:05.209646',NULL,1,'/api/servicios/{id}','API'),(199,199,0,'','2025-11-03 15:33:05.219160',NULL,3,'/api/provincias/obtenerDtosProvincia','API'),(200,200,0,'','2025-11-03 15:33:05.227260',NULL,0,'/api/notificaciones','API'),(201,201,0,'','2025-11-03 15:33:05.235244',NULL,1,'/api/reservas/baja/{id}','API'),(202,202,0,'','2025-11-03 15:33:05.243160',NULL,3,'/api/tipo-de-lugar/{id}','API'),(203,203,0,'','2025-11-03 15:33:05.256162',NULL,3,'/api/seguridad/roles/mis-reportes','API'),(204,204,0,'','2025-11-03 15:33:05.264163',NULL,3,'/api/reportes/solicitudesPorLugar/obtener','API'),(205,205,0,'','2025-11-03 15:33:05.272157',NULL,0,'/api/notificaciones/test/mensaje/{usuarioId}','API'),(206,206,0,'','2025-11-03 15:33:05.282165',NULL,1,'/api/pagos/{id}/cambiar-visibilidad','API'),(207,207,0,'','2025-11-03 15:33:05.291199',NULL,3,'/api/lugares/get','API'),(208,208,0,'','2025-11-03 15:33:05.299160',NULL,1,'/api/tipo-de-servicio/{id}','API'),(209,209,0,'','2025-11-03 15:33:05.308160',NULL,3,'/api/localidades','API'),(210,210,0,'','2025-11-03 15:33:05.317162',NULL,0,'/api/lugares/crearLugar','API'),(211,211,0,'','2025-11-03 15:33:05.325086',NULL,0,'/api/backups/create','API'),(212,212,0,'','2025-11-03 15:33:05.334202',NULL,3,'/api/auditoriaTransaccion/transferencias-pendientes','API'),(213,213,0,'','2025-11-03 15:33:05.343039',NULL,2,'/api/notificaciones/{notificacionId}','API'),(214,214,0,'','2025-11-03 15:33:05.353053',NULL,3,'/oauth2/callback','API'),(215,215,0,'','2025-11-03 15:33:05.364605',NULL,1,'/api/datos-bancarios/{id}','API'),(216,216,0,'','2025-11-03 15:33:05.373345',NULL,3,'/api/backups/get','API'),(217,217,0,'','2025-11-03 15:33:05.382346',NULL,0,'/api/servicios/modificarServicio','API'),(218,218,0,'','2025-11-03 15:33:05.391505',NULL,0,'/api/tipo-de-evento','API'),(219,219,0,'','2025-11-03 15:33:05.399595',NULL,3,'/api/pagos/disponibles','API'),(220,220,0,'','2025-11-03 15:33:05.408352',NULL,3,'/api/lugares/getMisNombresLugar','API'),(221,221,0,'','2025-11-03 15:33:05.417347',NULL,1,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(222,222,0,'','2025-11-03 15:33:05.426788',NULL,3,'/api/reportes/financiero','API'),(223,223,0,'','2025-11-03 15:33:05.436785',NULL,1,'/api/estado-backup/baja/{id}','API'),(224,224,0,'','2025-11-03 15:33:05.446746',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles','API'),(225,225,0,'','2025-11-03 15:33:05.456297',NULL,0,'/api/pagos/procesar-pago','API'),(226,226,0,'','2025-11-03 15:33:05.465784',NULL,3,'/api/tipo-de-servicio/obtenerDtosTipoServicio','API'),(227,227,0,'','2025-11-03 15:33:05.474803',NULL,3,'/api/lugares/obtenerEventosDisponibles/{fecha}/{idLugar}','API'),(228,228,0,'','2025-11-03 15:33:05.485097',NULL,0,'/api/seguridad/usuarios/recuperar','API'),(229,229,0,'','2025-11-03 15:33:05.493641',NULL,0,'/api/localidades','API'),(230,230,0,'','2025-11-03 15:33:05.503544',NULL,0,'/api/seguridad/usuarios/cambiar-contrasena','API'),(231,231,0,'','2025-11-03 15:33:05.512539',NULL,3,'/api/lugares/obtenerDtoLugares','API'),(232,232,0,'','2025-11-03 15:33:05.520304',NULL,1,'/api/lugares/baja/{id}','API'),(233,233,0,'','2025-11-03 15:33:05.527543',NULL,0,'/api/backups/restaurar/{idBackup}','API'),(234,234,0,'','2025-11-03 15:33:05.535174',NULL,3,'/api/tipo-de-lugar/obtenerDtosTipoLugar','API'),(235,235,0,'','2025-11-03 15:33:05.541124',NULL,1,'/api/reservas/reservaAPagar','API'),(236,236,0,'','2025-11-03 15:33:05.548114',NULL,1,'/api/eventos/cancelar/{idEvento}','API'),(237,237,0,'','2025-11-03 15:33:05.555118',NULL,1,'/api/parametro-comision/{id}','API'),(238,238,0,'','2025-11-03 15:33:05.563102',NULL,3,'/api/servicios/get','API'),(239,239,0,'','2025-11-03 15:33:05.570100',NULL,3,'/api/pagos/{id}','API'),(240,240,0,'','2025-11-03 15:33:05.575609',NULL,0,'/api/seguridad/usuarios/registrarse','API'),(241,241,0,'','2025-11-03 15:33:05.582364',NULL,1,'/api/tipo-de-lugar/baja/{id}','API'),(242,242,0,'','2025-11-03 15:33:05.590382',NULL,0,'/api/notificaciones/test/recordatorio/{usuarioId}','API'),(243,243,0,'','2025-11-03 15:33:05.597676',NULL,1,'/api/tipo-de-lugar/{id}','API'),(244,244,0,'','2025-11-03 15:33:05.606726',NULL,0,'/api/reportes/financiero','API'),(245,245,0,'','2025-11-03 15:33:05.614738',NULL,3,'/api/tipo-de-evento/{id}','API'),(246,246,0,'','2025-11-03 15:33:05.623240',NULL,1,'/api/notificaciones/leer-todas','API'),(247,247,0,'','2025-11-03 15:33:05.631986',NULL,0,'/api/seguridad/grupos/nuevo','API'),(248,248,0,'','2025-11-03 15:33:05.640413',NULL,3,'/api/parametro-comision/vigente','API'),(249,249,0,'','2025-11-03 15:33:05.649695',NULL,1,'/api/servicios/iniciarChat','API'),(250,250,0,'','2025-11-03 15:33:05.656696',NULL,2,'/api/reportes/financiero/{id}','API'),(251,251,0,'','2025-11-03 15:33:05.665701',NULL,2,'/api/reportes/vistasPorServicio/{id}','API'),(252,252,0,'','2025-11-03 15:33:05.673210',NULL,0,'/api/reservas','API'),(253,253,0,'','2025-11-03 15:33:05.686041',NULL,2,'/api/eventos/{id}','API'),(254,254,0,'','2025-11-03 15:33:05.693047',NULL,3,'/api/estado-del-evento/{id}','API'),(255,255,0,'','2025-11-03 15:33:05.701652',NULL,1,'/api/notificaciones/{notificacionId}/leer','API'),(256,256,0,'','2025-11-03 15:33:05.710645',NULL,2,'/api/seguridad/usuarios/{id}','API'),(257,257,0,'','2025-11-03 15:33:05.719636',NULL,3,'/api/datos-bancarios','API'),(258,258,0,'','2025-11-03 15:33:05.728635',NULL,3,'/api/tipo-de-servicio/get','API'),(259,259,0,'','2025-11-03 15:33:05.735634',NULL,2,'/api/seguridad/grupos/{id}','API'),(260,260,0,'','2025-11-03 15:33:05.741734',NULL,2,'/api/resena/{id}','API'),(261,261,0,'','2025-11-03 15:33:05.748546',NULL,3,'/api/servicios/getMisNombresServicio','API'),(262,262,0,'','2025-11-03 15:33:05.756511',NULL,2,'/api/estados-servicio/{id}','API'),(263,263,0,'','2025-11-03 15:33:05.763513',NULL,3,'/api/estado-backup/{id}','API'),(264,264,0,'','2025-11-03 15:33:05.772204',NULL,1,'/api/reportes/vistasPorLugar/baja/{id}','API'),(265,265,0,'','2025-11-03 15:33:05.779992',NULL,1,'/api/pagos/{id}','API'),(266,266,0,'','2025-11-03 15:33:05.788033',NULL,3,'/api/reportes/CantidadUsuariosActivos/obtener','API'),(267,267,0,'','2025-11-03 15:33:05.797563',NULL,1,'/api/reportes/CantidadUsuariosActivos/baja/{id}','API'),(268,268,0,'','2025-11-03 15:33:05.806525',NULL,1,'/api/tipo-de-evento/{id}','API'),(269,269,0,'','2025-11-03 15:33:05.816475',NULL,3,'/api/reservas/mis-reservas-lugar','API'),(270,270,0,'','2025-11-03 15:33:05.828000',NULL,1,'/api/provincias/{id}','API'),(271,271,0,'','2025-11-03 15:33:05.837028',NULL,0,'/api/seguridad/usuarios/reenviar-codigo','API'),(272,272,0,'','2025-11-03 15:33:05.846029',NULL,1,'/api/seguridad/grupos/permisos/agregar','API'),(273,273,0,'','2025-11-03 15:33:05.855025',NULL,0,'/api/datos-bancarios','API'),(274,274,0,'','2025-11-03 15:33:05.865023',NULL,3,'/api/reportes/serviciosMasSolicitados','API'),(275,275,0,'','2025-11-03 15:33:05.873024',NULL,1,'/api/reportes/vistasPorLugar/{id}','API'),(276,276,0,'','2025-11-03 15:33:05.881533',NULL,1,'/api/estado-del-evento/baja/{id}','API'),(277,277,0,'','2025-11-03 15:33:05.890550',NULL,3,'/api/notificaciones/get','API'),(278,278,0,'','2025-11-03 15:33:05.900100',NULL,1,'/api/estado-del-evento/{id}','API'),(279,279,0,'','2025-11-03 15:33:05.908719',NULL,3,'/api/reservas/{id}','API'),(280,280,0,'','2025-11-03 15:33:05.916869',NULL,1,'/api/reportes/financiero/baja/{id}','API'),(281,281,0,'','2025-11-03 15:33:05.925214',NULL,3,'/api/backups/mis-backups','API'),(282,282,0,'','2025-11-03 15:33:05.934207',NULL,3,'/api/provincias','API'),(283,283,0,'','2025-11-03 15:33:05.942214',NULL,3,'/api/lugares/{id}','API'),(284,284,0,'','2025-11-03 15:33:05.952352',NULL,2,'/api/resena/delete/{idReseña}','API'),(285,285,0,'','2025-11-03 15:33:05.961821',NULL,1,'/api/seguridad/usuarios/baja/{id}','API'),(286,286,0,'','2025-11-03 15:33:05.970995',NULL,3,'/api/pagos','API');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `propuestas` VALUES (1,'aaaaaaaaaaaaaaaaa','2025-11-03 15:44:15.000000',NULL,10000,2000,1),(2,'bbbbbbbbbbbbbb','2025-11-03 15:44:15.000000',NULL,20000,4000,2);
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
INSERT INTO `provincias` VALUES (1,'2025-11-03 15:44:15.000000',NULL,'Buenos Aires'),(2,'2025-11-03 15:44:15.000000',NULL,'Buenos Aires-GBA'),(3,'2025-11-03 15:44:15.000000',NULL,'Capital Federal'),(4,'2025-11-03 15:44:15.000000',NULL,'Catamarca'),(5,'2025-11-03 15:44:15.000000',NULL,'Chaco'),(6,'2025-11-03 15:44:15.000000',NULL,'Chubut'),(7,'2025-11-03 15:44:15.000000',NULL,'Córdoba'),(8,'2025-11-03 15:44:15.000000',NULL,'Corrientes'),(9,'2025-11-03 15:44:15.000000',NULL,'Entre Ríos'),(10,'2025-11-03 15:44:15.000000',NULL,'Formosa'),(11,'2025-11-03 15:44:15.000000',NULL,'Jujuy'),(12,'2025-11-03 15:44:15.000000',NULL,'La Pampa'),(13,'2025-11-03 15:44:15.000000',NULL,'La Rioja'),(14,'2025-11-03 15:44:15.000000',NULL,'Mendoza'),(15,'2025-11-03 15:44:15.000000',NULL,'Misiones'),(16,'2025-11-03 15:44:15.000000',NULL,'Neuquén'),(17,'2025-11-03 15:44:15.000000',NULL,'Río Negro'),(18,'2025-11-03 15:44:15.000000',NULL,'Salta'),(19,'2025-11-03 15:44:15.000000',NULL,'San Juan'),(20,'2025-11-03 15:44:15.000000',NULL,'San Luis'),(21,'2025-11-03 15:44:15.000000',NULL,'Santa Cruz'),(22,'2025-11-03 15:44:15.000000',NULL,'Santa Fe'),(23,'2025-11-03 15:44:15.000000',NULL,'Santiago del Estero'),(24,'2025-11-03 15:44:15.000000',NULL,'Tierra del Fuego'),(25,'2025-11-03 15:44:15.000000',NULL,'Tucumán');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `reservas` VALUES (1,'arce',NULL,'alear123@gial.cm','COMPLETO','2025-11-03 15:44:15.000000',NULL,'2025-11-03 15:44:15.000000','2025-11-03 15:44:15.000000',NULL,'Ale',2000,'234567237','A',1,NULL,NULL,1,1,1,3,NULL,NULL),(2,'arce',NULL,'alear123@gial.cm','COMPLETO','2025-11-03 15:44:15.000000',NULL,'2025-11-03 15:44:15.000000','2025-11-03 15:44:15.000000',NULL,'Ale',2000,'234567237','A',1,NULL,NULL,2,2,1,3,NULL,NULL),(3,'arce',NULL,'alear123@gial.cm','COMPLETO','2025-11-03 15:44:15.000000',NULL,'2025-11-03 15:44:15.000000','2025-11-03 15:44:15.000000',NULL,'Ale',2000,'234567237','A',1,NULL,NULL,NULL,2,1,3,1,1),(4,'arce',NULL,'alear123@gial.cm','EN_CHAT','2025-11-03 15:44:15.000000',NULL,'2025-11-03 15:44:15.000000','2025-11-03 15:44:15.000000',NULL,'Ale',2000,'234567237','A',1,NULL,NULL,NULL,2,1,3,2,1),(5,'arce',NULL,'alear123@gial.cm','COMPLETO','2025-11-03 15:44:15.000000',NULL,'2025-11-03 15:44:15.000000','2025-11-03 15:44:15.000000',NULL,'Ale',2000,'234567237','A',3,NULL,NULL,3,1,1,3,NULL,NULL),(6,'arce',NULL,'alear123@gial.cm','COMPLETO','2025-11-03 15:44:15.000000',NULL,'2025-11-03 15:44:15.000000','2025-11-03 15:44:15.000000',NULL,'Ale',2000,'234567237','A',3,NULL,NULL,3,1,1,3,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `reseña` VALUES (1,'muy buen servicio',3,'2025-11-03 15:44:15.000000',NULL,NULL,1,1,NULL),(2,'muy mal servicio',4,'2025-11-03 15:44:15.000000',NULL,NULL,2,1,NULL),(3,'muy buen servicio',5,'2025-11-03 15:44:15.000000',NULL,NULL,3,1,NULL),(4,'excelente servicio',3,'2025-11-03 15:44:15.000000',NULL,NULL,4,1,NULL),(5,'muy buen servicio',3,'2025-11-03 15:44:15.000000',NULL,NULL,1,NULL,1),(6,'muy mal servicio',4,'2025-11-03 15:44:15.000000',NULL,NULL,2,NULL,1),(7,'muy buen servicio',5,'2025-11-03 15:44:15.000000',NULL,NULL,3,NULL,1),(8,'excelente servicio',3,'2025-11-03 15:44:15.000000',NULL,NULL,4,NULL,1);
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
INSERT INTO `revision` VALUES (1,1762194783416,NULL,'2025-11-03 15:33:03.418485',NULL),(2,1762194783455,NULL,'2025-11-03 15:33:03.455677',NULL),(3,1762194783470,NULL,'2025-11-03 15:33:03.471681',NULL),(4,1762194783482,NULL,'2025-11-03 15:33:03.482244',NULL),(5,1762194783492,NULL,'2025-11-03 15:33:03.492259',NULL),(6,1762194783503,NULL,'2025-11-03 15:33:03.503255',NULL),(7,1762194783512,NULL,'2025-11-03 15:33:03.512276',NULL),(8,1762194783521,NULL,'2025-11-03 15:33:03.521256',NULL),(9,1762194783530,NULL,'2025-11-03 15:33:03.530253',NULL),(10,1762194783538,NULL,'2025-11-03 15:33:03.538256',NULL),(11,1762194783547,NULL,'2025-11-03 15:33:03.547256',NULL),(12,1762194783555,NULL,'2025-11-03 15:33:03.555257',NULL),(13,1762194783567,NULL,'2025-11-03 15:33:03.567651',NULL),(14,1762194783576,NULL,'2025-11-03 15:33:03.576652',NULL),(15,1762194783585,NULL,'2025-11-03 15:33:03.585664',NULL),(16,1762194783595,NULL,'2025-11-03 15:33:03.595663',NULL),(17,1762194783606,NULL,'2025-11-03 15:33:03.606258',NULL),(18,1762194783616,NULL,'2025-11-03 15:33:03.616788',NULL),(19,1762194783627,NULL,'2025-11-03 15:33:03.627780',NULL),(20,1762194783638,NULL,'2025-11-03 15:33:03.638782',NULL),(21,1762194783649,NULL,'2025-11-03 15:33:03.649790',NULL),(22,1762194783660,NULL,'2025-11-03 15:33:03.660317',NULL),(23,1762194783670,NULL,'2025-11-03 15:33:03.670339',NULL),(24,1762194783679,NULL,'2025-11-03 15:33:03.679013',NULL),(25,1762194783690,NULL,'2025-11-03 15:33:03.690037',NULL),(26,1762194783698,NULL,'2025-11-03 15:33:03.698955',NULL),(27,1762194783707,NULL,'2025-11-03 15:33:03.707790',NULL),(28,1762194783715,NULL,'2025-11-03 15:33:03.715776',NULL),(29,1762194783724,NULL,'2025-11-03 15:33:03.724207',NULL),(30,1762194783733,NULL,'2025-11-03 15:33:03.733221',NULL),(31,1762194783742,NULL,'2025-11-03 15:33:03.742054',NULL),(32,1762194783751,NULL,'2025-11-03 15:33:03.751054',NULL),(33,1762194783758,NULL,'2025-11-03 15:33:03.758691',NULL),(34,1762194783768,NULL,'2025-11-03 15:33:03.768529',NULL),(35,1762194783778,NULL,'2025-11-03 15:33:03.778573',NULL),(36,1762194783788,NULL,'2025-11-03 15:33:03.788100',NULL),(37,1762194783798,NULL,'2025-11-03 15:33:03.799107',NULL),(38,1762194783809,NULL,'2025-11-03 15:33:03.809125',NULL),(39,1762194783819,NULL,'2025-11-03 15:33:03.819111',NULL),(40,1762194783829,NULL,'2025-11-03 15:33:03.829134',NULL),(41,1762194783839,NULL,'2025-11-03 15:33:03.839149',NULL),(42,1762194783849,NULL,'2025-11-03 15:33:03.849848',NULL),(43,1762194783860,NULL,'2025-11-03 15:33:03.860848',NULL),(44,1762194783872,NULL,'2025-11-03 15:33:03.872414',NULL),(45,1762194783882,NULL,'2025-11-03 15:33:03.882396',NULL),(46,1762194783891,NULL,'2025-11-03 15:33:03.891398',NULL),(47,1762194783901,NULL,'2025-11-03 15:33:03.901393',NULL),(48,1762194783909,NULL,'2025-11-03 15:33:03.909989',NULL),(49,1762194783917,NULL,'2025-11-03 15:33:03.917891',NULL),(50,1762194783927,NULL,'2025-11-03 15:33:03.927082',NULL),(51,1762194783935,NULL,'2025-11-03 15:33:03.935459',NULL),(52,1762194783944,NULL,'2025-11-03 15:33:03.945474',NULL),(53,1762194783957,NULL,'2025-11-03 15:33:03.958565',NULL),(54,1762194783966,NULL,'2025-11-03 15:33:03.966937',NULL),(55,1762194783975,NULL,'2025-11-03 15:33:03.975022',NULL),(56,1762194783983,NULL,'2025-11-03 15:33:03.983475',NULL),(57,1762194783991,NULL,'2025-11-03 15:33:03.991992',NULL),(58,1762194784001,NULL,'2025-11-03 15:33:04.001051',NULL),(59,1762194784009,NULL,'2025-11-03 15:33:04.009592',NULL),(60,1762194784019,NULL,'2025-11-03 15:33:04.019523',NULL),(61,1762194784028,NULL,'2025-11-03 15:33:04.028521',NULL),(62,1762194784038,NULL,'2025-11-03 15:33:04.038522',NULL),(63,1762194784047,NULL,'2025-11-03 15:33:04.047532',NULL),(64,1762194784057,NULL,'2025-11-03 15:33:04.057598',NULL),(65,1762194784067,NULL,'2025-11-03 15:33:04.067116',NULL),(66,1762194784076,NULL,'2025-11-03 15:33:04.076750',NULL),(67,1762194784085,NULL,'2025-11-03 15:33:04.085757',NULL),(68,1762194784096,NULL,'2025-11-03 15:33:04.096760',NULL),(69,1762194784105,NULL,'2025-11-03 15:33:04.105805',NULL),(70,1762194784113,NULL,'2025-11-03 15:33:04.113944',NULL),(71,1762194784122,NULL,'2025-11-03 15:33:04.122516',NULL),(72,1762194784131,NULL,'2025-11-03 15:33:04.131216',NULL),(73,1762194784139,NULL,'2025-11-03 15:33:04.139482',NULL),(74,1762194784147,NULL,'2025-11-03 15:33:04.147593',NULL),(75,1762194784154,NULL,'2025-11-03 15:33:04.154596',NULL),(76,1762194784164,NULL,'2025-11-03 15:33:04.164100',NULL),(77,1762194784173,NULL,'2025-11-03 15:33:04.173101',NULL),(78,1762194784180,NULL,'2025-11-03 15:33:04.180459',NULL),(79,1762194784188,NULL,'2025-11-03 15:33:04.188968',NULL),(80,1762194784195,NULL,'2025-11-03 15:33:04.195972',NULL),(81,1762194784205,NULL,'2025-11-03 15:33:04.205309',NULL),(82,1762194784214,NULL,'2025-11-03 15:33:04.214311',NULL),(83,1762194784222,NULL,'2025-11-03 15:33:04.222827',NULL),(84,1762194784231,NULL,'2025-11-03 15:33:04.231710',NULL),(85,1762194784239,NULL,'2025-11-03 15:33:04.239706',NULL),(86,1762194784249,NULL,'2025-11-03 15:33:04.249709',NULL),(87,1762194784257,NULL,'2025-11-03 15:33:04.258710',NULL),(88,1762194784266,NULL,'2025-11-03 15:33:04.266710',NULL),(89,1762194784274,NULL,'2025-11-03 15:33:04.275710',NULL),(90,1762194784289,NULL,'2025-11-03 15:33:04.289706',NULL),(91,1762194784299,NULL,'2025-11-03 15:33:04.299710',NULL),(92,1762194784306,NULL,'2025-11-03 15:33:04.307874',NULL),(93,1762194784315,NULL,'2025-11-03 15:33:04.315863',NULL),(94,1762194784325,NULL,'2025-11-03 15:33:04.325981',NULL),(95,1762194784334,NULL,'2025-11-03 15:33:04.334047',NULL),(96,1762194784341,NULL,'2025-11-03 15:33:04.341779',NULL),(97,1762194784350,NULL,'2025-11-03 15:33:04.350158',NULL),(98,1762194784358,NULL,'2025-11-03 15:33:04.358164',NULL),(99,1762194784366,NULL,'2025-11-03 15:33:04.366643',NULL),(100,1762194784374,NULL,'2025-11-03 15:33:04.374637',NULL),(101,1762194784382,NULL,'2025-11-03 15:33:04.382024',NULL),(102,1762194784389,NULL,'2025-11-03 15:33:04.389444',NULL),(103,1762194784401,NULL,'2025-11-03 15:33:04.401557',NULL),(104,1762194784409,NULL,'2025-11-03 15:33:04.409527',NULL),(105,1762194784418,NULL,'2025-11-03 15:33:04.418539',NULL),(106,1762194784427,NULL,'2025-11-03 15:33:04.427524',NULL),(107,1762194784436,NULL,'2025-11-03 15:33:04.436524',NULL),(108,1762194784444,NULL,'2025-11-03 15:33:04.444574',NULL),(109,1762194784453,NULL,'2025-11-03 15:33:04.453521',NULL),(110,1762194784462,NULL,'2025-11-03 15:33:04.462525',NULL),(111,1762194784471,NULL,'2025-11-03 15:33:04.471777',NULL),(112,1762194784478,NULL,'2025-11-03 15:33:04.478809',NULL),(113,1762194784487,NULL,'2025-11-03 15:33:04.487775',NULL),(114,1762194784496,NULL,'2025-11-03 15:33:04.496778',NULL),(115,1762194784504,NULL,'2025-11-03 15:33:04.504631',NULL),(116,1762194784512,NULL,'2025-11-03 15:33:04.512590',NULL),(117,1762194784522,NULL,'2025-11-03 15:33:04.522123',NULL),(118,1762194784529,NULL,'2025-11-03 15:33:04.529125',NULL),(119,1762194784537,NULL,'2025-11-03 15:33:04.537201',NULL),(120,1762194784544,NULL,'2025-11-03 15:33:04.544718',NULL),(121,1762194784553,NULL,'2025-11-03 15:33:04.553367',NULL),(122,1762194784559,NULL,'2025-11-03 15:33:04.559721',NULL),(123,1762194784567,NULL,'2025-11-03 15:33:04.567681',NULL),(124,1762194784574,NULL,'2025-11-03 15:33:04.574197',NULL),(125,1762194784582,NULL,'2025-11-03 15:33:04.582202',NULL),(126,1762194784589,NULL,'2025-11-03 15:33:04.589244',NULL),(127,1762194784598,NULL,'2025-11-03 15:33:04.598760',NULL),(128,1762194784612,NULL,'2025-11-03 15:33:04.612636',NULL),(129,1762194784623,NULL,'2025-11-03 15:33:04.624037',NULL),(130,1762194784633,NULL,'2025-11-03 15:33:04.633540',NULL),(131,1762194784643,NULL,'2025-11-03 15:33:04.643864',NULL),(132,1762194784651,NULL,'2025-11-03 15:33:04.651941',NULL),(133,1762194784659,NULL,'2025-11-03 15:33:04.659950',NULL),(134,1762194784667,NULL,'2025-11-03 15:33:04.668951',NULL),(135,1762194784677,NULL,'2025-11-03 15:33:04.677027',NULL),(136,1762194784685,NULL,'2025-11-03 15:33:04.685028',NULL),(137,1762194784693,NULL,'2025-11-03 15:33:04.693025',NULL),(138,1762194784702,NULL,'2025-11-03 15:33:04.702032',NULL),(139,1762194784710,NULL,'2025-11-03 15:33:04.710434',NULL),(140,1762194784719,NULL,'2025-11-03 15:33:04.720090',NULL),(141,1762194784726,NULL,'2025-11-03 15:33:04.726552',NULL),(142,1762194784734,NULL,'2025-11-03 15:33:04.734554',NULL),(143,1762194784741,NULL,'2025-11-03 15:33:04.741549',NULL),(144,1762194784748,NULL,'2025-11-03 15:33:04.748195',NULL),(145,1762194784756,NULL,'2025-11-03 15:33:04.756228',NULL),(146,1762194784765,NULL,'2025-11-03 15:33:04.765238',NULL),(147,1762194784773,NULL,'2025-11-03 15:33:04.773734',NULL),(148,1762194784782,NULL,'2025-11-03 15:33:04.782716',NULL),(149,1762194784791,NULL,'2025-11-03 15:33:04.791167',NULL),(150,1762194784800,NULL,'2025-11-03 15:33:04.800230',NULL),(151,1762194784809,NULL,'2025-11-03 15:33:04.809145',NULL),(152,1762194784818,NULL,'2025-11-03 15:33:04.818142',NULL),(153,1762194784830,NULL,'2025-11-03 15:33:04.831143',NULL),(154,1762194784841,NULL,'2025-11-03 15:33:04.841141',NULL),(155,1762194784850,NULL,'2025-11-03 15:33:04.850244',NULL),(156,1762194784859,NULL,'2025-11-03 15:33:04.859145',NULL),(157,1762194784869,NULL,'2025-11-03 15:33:04.869623',NULL),(158,1762194784878,NULL,'2025-11-03 15:33:04.878632',NULL),(159,1762194784888,NULL,'2025-11-03 15:33:04.888627',NULL),(160,1762194784897,NULL,'2025-11-03 15:33:04.897626',NULL),(161,1762194784906,NULL,'2025-11-03 15:33:04.907625',NULL),(162,1762194784915,NULL,'2025-11-03 15:33:04.915626',NULL),(163,1762194784923,NULL,'2025-11-03 15:33:04.923630',NULL),(164,1762194784931,NULL,'2025-11-03 15:33:04.931628',NULL),(165,1762194784938,NULL,'2025-11-03 15:33:04.938626',NULL),(166,1762194784945,NULL,'2025-11-03 15:33:04.945642',NULL),(167,1762194784953,NULL,'2025-11-03 15:33:04.954641',NULL),(168,1762194784962,NULL,'2025-11-03 15:33:04.962162',NULL),(169,1762194784970,NULL,'2025-11-03 15:33:04.970168',NULL),(170,1762194784977,NULL,'2025-11-03 15:33:04.978248',NULL),(171,1762194784986,NULL,'2025-11-03 15:33:04.986889',NULL),(172,1762194784995,NULL,'2025-11-03 15:33:04.995400',NULL),(173,1762194785004,NULL,'2025-11-03 15:33:05.004553',NULL),(174,1762194785013,NULL,'2025-11-03 15:33:05.013065',NULL),(175,1762194785022,NULL,'2025-11-03 15:33:05.022581',NULL),(176,1762194785033,NULL,'2025-11-03 15:33:05.033104',NULL),(177,1762194785042,NULL,'2025-11-03 15:33:05.042102',NULL),(178,1762194785051,NULL,'2025-11-03 15:33:05.051110',NULL),(179,1762194785059,NULL,'2025-11-03 15:33:05.059623',NULL),(180,1762194785067,NULL,'2025-11-03 15:33:05.067638',NULL),(181,1762194785076,NULL,'2025-11-03 15:33:05.076157',NULL),(182,1762194785085,NULL,'2025-11-03 15:33:05.085162',NULL),(183,1762194785092,NULL,'2025-11-03 15:33:05.092161',NULL),(184,1762194785101,NULL,'2025-11-03 15:33:05.101187',NULL),(185,1762194785109,NULL,'2025-11-03 15:33:05.109196',NULL),(186,1762194785119,NULL,'2025-11-03 15:33:05.119953',NULL),(187,1762194785127,NULL,'2025-11-03 15:33:05.127967',NULL),(188,1762194785135,NULL,'2025-11-03 15:33:05.135963',NULL),(189,1762194785144,NULL,'2025-11-03 15:33:05.144483',NULL),(190,1762194785153,NULL,'2025-11-03 15:33:05.153517',NULL),(191,1762194785160,NULL,'2025-11-03 15:33:05.160627',NULL),(192,1762194785168,NULL,'2025-11-03 15:33:05.168142',NULL),(193,1762194785175,NULL,'2025-11-03 15:33:05.175136',NULL),(194,1762194785182,NULL,'2025-11-03 15:33:05.182136',NULL),(195,1762194785188,NULL,'2025-11-03 15:33:05.189143',NULL),(196,1762194785196,NULL,'2025-11-03 15:33:05.196145',NULL),(197,1762194785203,NULL,'2025-11-03 15:33:05.203635',NULL),(198,1762194785211,NULL,'2025-11-03 15:33:05.211646',NULL),(199,1762194785221,NULL,'2025-11-03 15:33:05.221167',NULL),(200,1762194785229,NULL,'2025-11-03 15:33:05.229162',NULL),(201,1762194785237,NULL,'2025-11-03 15:33:05.237199',NULL),(202,1762194785245,NULL,'2025-11-03 15:33:05.245168',NULL),(203,1762194785257,NULL,'2025-11-03 15:33:05.258252',NULL),(204,1762194785266,NULL,'2025-11-03 15:33:05.266160',NULL),(205,1762194785275,NULL,'2025-11-03 15:33:05.275160',NULL),(206,1762194785285,NULL,'2025-11-03 15:33:05.285163',NULL),(207,1762194785293,NULL,'2025-11-03 15:33:05.293173',NULL),(208,1762194785302,NULL,'2025-11-03 15:33:05.302166',NULL),(209,1762194785311,NULL,'2025-11-03 15:33:05.311160',NULL),(210,1762194785319,NULL,'2025-11-03 15:33:05.319060',NULL),(211,1762194785327,NULL,'2025-11-03 15:33:05.327099',NULL),(212,1762194785337,NULL,'2025-11-03 15:33:05.337203',NULL),(213,1762194785345,NULL,'2025-11-03 15:33:05.345939',NULL),(214,1762194785355,NULL,'2025-11-03 15:33:05.355937',NULL),(215,1762194785366,NULL,'2025-11-03 15:33:05.366566',NULL),(216,1762194785375,NULL,'2025-11-03 15:33:05.375338',NULL),(217,1762194785384,NULL,'2025-11-03 15:33:05.384460',NULL),(218,1762194785393,NULL,'2025-11-03 15:33:05.393595',NULL),(219,1762194785401,NULL,'2025-11-03 15:33:05.401570',NULL),(220,1762194785410,NULL,'2025-11-03 15:33:05.410351',NULL),(221,1762194785419,NULL,'2025-11-03 15:33:05.419347',NULL),(222,1762194785429,NULL,'2025-11-03 15:33:05.429781',NULL),(223,1762194785438,NULL,'2025-11-03 15:33:05.438781',NULL),(224,1762194785448,NULL,'2025-11-03 15:33:05.448747',NULL),(225,1762194785458,NULL,'2025-11-03 15:33:05.458298',NULL),(226,1762194785467,NULL,'2025-11-03 15:33:05.467785',NULL),(227,1762194785477,NULL,'2025-11-03 15:33:05.477784',NULL),(228,1762194785487,NULL,'2025-11-03 15:33:05.487331',NULL),(229,1762194785497,NULL,'2025-11-03 15:33:05.497034',NULL),(230,1762194785505,NULL,'2025-11-03 15:33:05.505990',NULL),(231,1762194785514,NULL,'2025-11-03 15:33:05.514295',NULL),(232,1762194785522,NULL,'2025-11-03 15:33:05.522659',NULL),(233,1762194785529,NULL,'2025-11-03 15:33:05.529549',NULL),(234,1762194785536,NULL,'2025-11-03 15:33:05.536183',NULL),(235,1762194785543,NULL,'2025-11-03 15:33:05.543131',NULL),(236,1762194785550,NULL,'2025-11-03 15:33:05.550114',NULL),(237,1762194785557,NULL,'2025-11-03 15:33:05.557147',NULL),(238,1762194785565,NULL,'2025-11-03 15:33:05.565158',NULL),(239,1762194785571,NULL,'2025-11-03 15:33:05.571157',NULL),(240,1762194785576,NULL,'2025-11-03 15:33:05.576695',NULL),(241,1762194785584,NULL,'2025-11-03 15:33:05.584398',NULL),(242,1762194785592,NULL,'2025-11-03 15:33:05.592432',NULL),(243,1762194785599,NULL,'2025-11-03 15:33:05.599892',NULL),(244,1762194785608,NULL,'2025-11-03 15:33:05.608726',NULL),(245,1762194785617,NULL,'2025-11-03 15:33:05.617733',NULL),(246,1762194785625,NULL,'2025-11-03 15:33:05.625249',NULL),(247,1762194785634,NULL,'2025-11-03 15:33:05.634453',NULL),(248,1762194785642,NULL,'2025-11-03 15:33:05.642419',NULL),(249,1762194785651,NULL,'2025-11-03 15:33:05.651705',NULL),(250,1762194785658,NULL,'2025-11-03 15:33:05.658700',NULL),(251,1762194785667,NULL,'2025-11-03 15:33:05.667704',NULL),(252,1762194785676,NULL,'2025-11-03 15:33:05.676033',NULL),(253,1762194785687,NULL,'2025-11-03 15:33:05.688133',NULL),(254,1762194785696,NULL,'2025-11-03 15:33:05.696051',NULL),(255,1762194785702,NULL,'2025-11-03 15:33:05.702635',NULL),(256,1762194785712,NULL,'2025-11-03 15:33:05.712637',NULL),(257,1762194785721,NULL,'2025-11-03 15:33:05.722637',NULL),(258,1762194785730,NULL,'2025-11-03 15:33:05.730635',NULL),(259,1762194785737,NULL,'2025-11-03 15:33:05.737633',NULL),(260,1762194785743,NULL,'2025-11-03 15:33:05.743637',NULL),(261,1762194785750,NULL,'2025-11-03 15:33:05.750508',NULL),(262,1762194785757,NULL,'2025-11-03 15:33:05.757515',NULL),(263,1762194785765,NULL,'2025-11-03 15:33:05.765514',NULL),(264,1762194785774,NULL,'2025-11-03 15:33:05.774031',NULL),(265,1762194785781,NULL,'2025-11-03 15:33:05.781990',NULL),(266,1762194785790,NULL,'2025-11-03 15:33:05.790060',NULL),(267,1762194785799,NULL,'2025-11-03 15:33:05.799570',NULL),(268,1762194785809,NULL,'2025-11-03 15:33:05.809558',NULL),(269,1762194785819,NULL,'2025-11-03 15:33:05.819468',NULL),(270,1762194785831,NULL,'2025-11-03 15:33:05.831000',NULL),(271,1762194785840,NULL,'2025-11-03 15:33:05.840029',NULL),(272,1762194785849,NULL,'2025-11-03 15:33:05.849027',NULL),(273,1762194785858,NULL,'2025-11-03 15:33:05.858031',NULL),(274,1762194785867,NULL,'2025-11-03 15:33:05.867038',NULL),(275,1762194785875,NULL,'2025-11-03 15:33:05.875023',NULL),(276,1762194785883,NULL,'2025-11-03 15:33:05.883550',NULL),(277,1762194785892,NULL,'2025-11-03 15:33:05.892556',NULL),(278,1762194785902,NULL,'2025-11-03 15:33:05.902100',NULL),(279,1762194785910,NULL,'2025-11-03 15:33:05.910716',NULL),(280,1762194785917,NULL,'2025-11-03 15:33:05.917876',NULL),(281,1762194785927,NULL,'2025-11-03 15:33:05.927211',NULL),(282,1762194785936,NULL,'2025-11-03 15:33:05.936208',NULL),(283,1762194785945,NULL,'2025-11-03 15:33:05.945249',NULL),(284,1762194785954,NULL,'2025-11-03 15:33:05.954338',NULL),(285,1762194785963,NULL,'2025-11-03 15:33:05.963812',NULL),(286,1762194785973,NULL,'2025-11-03 15:33:05.973980',NULL),(287,1762195540029,NULL,'2025-11-03 15:45:40.029122',NULL),(302,1762195862913,'weventlyempresa@gmail.com','2025-11-03 15:51:02.916620',99),(306,1762196092173,NULL,'2025-11-03 15:54:52.173561',NULL),(307,1762196153055,NULL,'2025-11-03 15:55:53.063483',NULL),(308,1762196882243,'weventlyempresa@gmail.com','2025-11-03 16:08:02.243468',99),(309,1762196890025,'weventlyempresa@gmail.com','2025-11-03 16:08:10.026307',99),(352,1762197170155,'weventlyempresa@gmail.com','2025-11-03 16:12:50.158260',99);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `revision_seq` VALUES (451);
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
INSERT INTO `roles` VALUES (1,_binary '','Usuario que crea y gestiona eventos dentro de la plataforma','2025-11-03 15:44:15.000000',NULL,'Organizador','Inicio',_binary '\0'),(2,_binary '','Usuario que ofrece servicios para los eventos','2025-11-03 15:44:15.000000',NULL,'Prestador','Inicio',_binary '\0'),(3,_binary '','Usuario que registra y administra lugares en la plataforma','2025-11-03 15:44:15.000000',NULL,'Propietario','Inicio',_binary '\0'),(4,_binary '','Usuario que tiene privilegios','2025-11-03 15:44:15.000000',NULL,'Admin','Inicio',_binary '');
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
INSERT INTO `servicios` VALUES (1,'el mejor servicio de catering de mendoza','2025-11-03 15:44:15.000000',NULL,'catering rosales',1,2,1),(2,'el mejor servicio de fotografía de mendoza','2025-11-03 15:44:15.000000',NULL,'fotografía rosales',2,2,2),(3,'el mejor servicio de sonido de mendoza','2025-11-03 15:44:15.000000',NULL,'sonido rosales',1,2,3);
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
INSERT INTO `servicios_soportados` VALUES (1,'2025-11-03 15:44:15.000000',NULL,1,1),(2,'2025-11-03 15:44:15.000000',NULL,2,1);
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
INSERT INTO `tipos_de_eventos` VALUES (1,'2025-11-03 15:44:15.000000',NULL,'Conferencia'),(2,'2025-11-03 15:44:15.000000',NULL,'Fiesta'),(3,'2025-11-03 15:44:15.000000',NULL,'Seminario'),(4,'2025-11-03 15:44:15.000000',NULL,'Taller'),(5,'2025-11-03 15:44:15.000000',NULL,'Reunión');
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
INSERT INTO `tipos_de_lugares` VALUES (1,'2025-11-03 15:44:15.000000',NULL,'Salón'),(2,'2025-11-03 15:44:15.000000',NULL,'Quinta'),(3,'2025-11-03 15:44:15.000000',NULL,'Hotel'),(4,'2025-11-03 15:44:15.000000',NULL,'Club'),(5,'2025-11-03 15:44:15.000000',NULL,'Espacio Abierto');
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
INSERT INTO `tipos_de_servicios` VALUES (1,'2025-11-03 15:44:15.000000',NULL,'Catering'),(2,'2025-11-03 15:44:15.000000',NULL,'Fotografía'),(3,'2025-11-03 15:44:15.000000',NULL,'Sonido'),(4,'2025-11-03 15:44:15.000000',NULL,'Decoración'),(5,'2025-11-03 15:44:15.000000',NULL,'Transporte');
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
INSERT INTO `usuario_roles` VALUES (1,'2025-11-03 15:44:15.000000',NULL,1,1),(2,'2025-11-03 15:44:15.000000',NULL,2,2),(3,'2025-11-03 15:44:15.000000',NULL,3,3),(4,'2025-11-03 15:44:15.000000',NULL,1,4),(5,'2025-11-03 15:44:15.000000',NULL,1,5),(6,'2025-11-03 15:44:15.000000',NULL,4,99);
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
INSERT INTO `usuarios` VALUES (1,'$2a$10$.Ct40vQd5JJQoX294RwYYuhBB9XJhzUTPchwCOZztQbDJD5cE3g/S','Arce','$2a$10$mPP6dMRr/fsvVFqqSQJrQeYtRm9.qB9xZjuaj1cwQYPSgpo6XH6vy','alear12373@gmail.com','2025-11-03 15:44:15.000000',NULL,'2025-11-03 15:44:15.000000','Alejandro','02617233183',1,NULL),(2,'45357644','rosales','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','cristian123@gmail.com','2025-11-03 15:44:15.000000',NULL,'2025-11-03 15:44:15.000000','cristian','2613453456',1,NULL),(3,'45357644','silva','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','silva123@gmail.com','2025-11-03 15:44:15.000000',NULL,'2025-11-03 15:44:15.000000','enzo','2613453456',1,NULL),(4,'45357644','palazzo','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','marcio23@gmail.com','2025-11-03 15:44:15.000000',NULL,'2025-11-03 15:44:15.000000','marcio','2613453456',1,NULL),(5,'45357644','arce','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','arce123@gmail.com','2025-11-03 15:44:15.000000',NULL,'2025-11-03 15:44:15.000000','alejandro','2613453456',1,NULL),(99,'','','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','weventlyempresa@gmail.com','2025-11-03 15:44:15.000000',NULL,'1990-05-15 00:00:00.000000','Administrador','',1,NULL);
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
