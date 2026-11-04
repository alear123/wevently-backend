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
CREATE TABLE `backup_backup_estado_backup_aud` (
  `rev` int NOT NULL,
  `backup_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`backup_id`,`rev`,`id`),
  KEY `FKoe0fn8iagoton6k0eqdv2sfn2` (`rev`),
  CONSTRAINT `FKoe0fn8iagoton6k0eqdv2sfn2` FOREIGN KEY (`rev`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `backup_backup_estado_backup_aud` VALUES (274,1,1,0),(302,1,1,0);
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
INSERT INTO `caracteristicas` VALUES (1,'2025-10-30 16:08:15.000000',NULL,'Pileta'),(2,'2025-10-30 16:08:15.000000',NULL,'Estacionamiento'),(3,'2025-10-30 16:08:15.000000',NULL,'WiFi'),(4,'2025-10-30 16:08:15.000000',NULL,'Aire acondicionado'),(5,'2025-10-30 16:08:15.000000',NULL,'Accesibilidad');
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
INSERT INTO `chats` VALUES (1,'2025-10-30 16:08:15.000000',1,1,3,3,1),(2,'2025-10-30 16:08:15.000000',2,1,3,4,1);
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
INSERT INTO `estados_de_eventos` VALUES (1,'2025-10-30 16:08:15.000000',NULL,'Pendiente'),(2,'2025-10-30 16:08:15.000000',NULL,'Cancelado'),(3,'2025-10-30 16:08:15.000000',NULL,'Realizado');
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
INSERT INTO `eventos` VALUES (1,'casamiento de maria y jorge','2025-10-10','2025-10-30 16:08:15.000000',NULL,'12:00:00.000000','14:00:00.000000','casamiento jorge',100,1,3,1),(2,'casamiento de mario y jorge','2025-10-10','2025-10-30 16:08:15.000000',NULL,'12:00:00.000000','14:00:00.000000','casamiento mario',200,2,2,1),(3,'casamiento de robert y maria','2025-10-10','2025-10-30 16:08:15.000000',NULL,'12:00:00.000000','14:00:00.000000','casamiento maria',300,3,3,1);
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
INSERT INTO `eventos_soportados` VALUES (1,'2025-10-30 16:08:15.000000',NULL,1,1),(2,'2025-10-30 16:08:15.000000',NULL,2,1);
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
INSERT INTO `grupo_permiso` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,98),(1,99),(1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185),(1,186),(1,187),(1,188),(1,189),(1,190),(1,191),(1,192),(1,193),(1,194),(1,195),(1,196),(1,197),(1,198),(1,199),(1,200),(1,201),(1,202),(1,203),(1,204),(1,205),(1,206),(1,207),(1,208),(1,209),(1,210),(1,211),(1,212),(1,213),(1,214),(1,215),(1,216),(1,217),(1,218),(1,219),(1,220),(1,221),(1,222),(1,223),(1,224),(1,225),(1,226),(1,227),(1,228),(1,229),(1,230),(1,231),(1,232),(1,233),(1,234),(1,235),(1,236),(1,237),(1,238),(1,239),(1,240),(1,241),(1,242),(1,243),(1,244),(1,245),(1,246),(1,247),(1,248),(1,249),(1,250),(1,251),(1,252),(1,253),(1,254),(1,255),(1,256),(1,257),(1,258),(1,259),(1,260),(1,261),(1,262),(1,263),(1,264),(1,265),(1,266),(1,267),(1,268),(1,269),(1,270),(1,271),(1,272),(1,273),(1,274),(1,275),(1,276),(1,277),(1,278),(1,279),(1,280),(1,281),(1,282),(1,283),(1,284),(1,285),(1,286),(1,287),(1,288),(1,289),(1,290),(1,291),(1,292),(1,293),(1,294),(1,295),(1,296),(1,297),(1,298),(1,299),(1,300),(1,301),(1,302),(1,303),(1,304),(1,305),(1,306),(1,307),(1,308),(1,309),(1,310),(1,311),(1,312),(1,311),(2,10),(2,33),(2,35),(2,49),(2,73),(2,76),(2,94),(2,127),(2,131),(2,154),(2,166),(2,198),(2,199),(2,219),(2,225),(2,228),(2,233),(2,235),(2,237),(2,242),(2,243),(2,250),(2,260),(2,264),(2,272),(2,274),(2,276),(2,277),(2,289),(2,303),(2,310),(2,311),(2,312),(2,30),(2,63),(2,120),(2,141),(2,145),(2,150),(2,153),(2,175),(2,213),(2,220),(2,229),(2,253),(2,257),(2,281),(2,282),(2,283),(2,284),(2,285),(2,286),(2,299),(2,311),(3,2),(3,27),(3,52),(3,75),(3,80),(3,100),(3,104),(3,139),(3,144),(3,186),(3,194),(3,198),(3,215),(3,217),(3,219),(3,230),(3,252),(3,270),(3,288),(3,289),(3,290),(3,292),(4,7),(4,21),(4,24),(4,26),(4,32),(4,36),(4,43),(4,44),(4,46),(4,54),(4,57),(4,60),(4,73),(4,83),(4,84),(4,85),(4,99),(4,101),(4,103),(4,112),(4,114),(4,123),(4,133),(4,135),(4,143),(4,146),(4,151),(4,154),(4,157),(4,159),(4,160),(4,163),(4,164),(4,167),(4,169),(4,179),(4,182),(4,187),(4,201),(4,216),(4,234),(4,239),(4,248),(4,256),(4,262),(4,263),(4,265),(4,268),(4,269),(4,275),(4,276),(4,277),(4,278),(4,279),(4,281),(4,305),(4,306),(5,103),(5,110),(5,180),(5,187),(5,202);
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
INSERT INTO `grupos` VALUES (1,'Da acceso a todos los servicios que permiten configurar los parametros del sistema','2025-10-30 16:08:15.000000',NULL,'Configuraciones'),(2,'Da acceso a todas las acciones en el modulo de Eventos','2025-10-30 16:08:15.000000',NULL,'Eventos'),(3,'Da acceso a todas las acciones en el modulo de Servicios','2025-10-30 16:08:15.000000',NULL,'Servicios'),(4,'Da acceso a todas las acciones en el modulo de Lugares','2025-10-30 16:08:15.000000',NULL,'Lugares'),(5,'Da acceso a las acciones para recuperacion de usuario y contraseña ','2025-10-30 16:08:15.000000',NULL,'Seguridad');
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
  UNIQUE KEY `UK_cgxeyxk1t21a7fi9nexxg19yo` (`nombre`),
  KEY `FKpsu514uguuo384j979ub9dp4y` (`provincia_id`),
  CONSTRAINT `FKpsu514uguuo384j979ub9dp4y` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `localidades` VALUES (1,'2025-10-30 16:08:15.000000',NULL,'La Plata',1),(2,'2025-10-30 16:08:15.000000',NULL,'Mar del Plata',1),(3,'2025-10-30 16:08:15.000000',NULL,'Bahía Blanca',1),(4,'2025-10-30 16:08:15.000000',NULL,'Córdoba Capital',2),(5,'2025-10-30 16:08:15.000000',NULL,'Villa Carlos Paz',2),(6,'2025-10-30 16:08:15.000000',NULL,'Río Cuarto',2),(7,'2025-10-30 16:08:15.000000',NULL,'Rosario',3),(8,'2025-10-30 16:08:15.000000',NULL,'Santa Fe Capital',3),(9,'2025-10-30 16:08:15.000000',NULL,'Rafaela',3),(10,'2025-10-30 16:08:15.000000',NULL,'Mendoza Capital',4),(11,'2025-10-30 16:08:15.000000',NULL,'Godoy Cruz',4),(12,'2025-10-30 16:08:15.000000',NULL,'San Rafael',4),(13,'2025-10-30 16:08:15.000000',NULL,'Salta Capital',5),(14,'2025-10-30 16:08:15.000000',NULL,'Cafayate',5),(15,'2025-10-30 16:08:15.000000',NULL,'San Miguel de Tucumán',6),(16,'2025-10-30 16:08:15.000000',NULL,'Tafí del Valle',6),(17,'2025-10-30 16:08:15.000000',NULL,'Posadas',7),(18,'2025-10-30 16:08:15.000000',NULL,'Puerto Iguazú',7),(19,'2025-10-30 16:08:15.000000',NULL,'Rawson',8),(20,'2025-10-30 16:08:15.000000',NULL,'Comodoro Rivadavia',8),(21,'2025-10-30 16:08:15.000000',NULL,'Trelew',8),(22,'2025-10-30 19:56:08.395000',NULL,'aaaaaaa',4);
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
INSERT INTO `localidades_aud` VALUES (22,303,0,'2025-10-30 19:56:08.395000',NULL,'aaaaaaa');
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
INSERT INTO `lugar_precio` VALUES (1,'2025-10-30 16:08:15.000000',NULL,2000,1),(2,'2025-10-30 16:08:15.000000',NULL,2300,2),(3,'2025-10-30 16:08:15.000000',NULL,2500,3);
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
INSERT INTO `lugares` VALUES (1,200,'lugar ideal para realizar una fiesta a lo grande!','Av. San Martin 3453','2025-10-30 16:08:15.000000',NULL,'Quincho Silva',1,3,1),(2,300,'lugar ideal para realizar una fiesta a lo grande!','Av. San Martin 3453','2025-10-30 16:08:15.000000',NULL,'Bodega Silva',1,3,2),(3,200,'lugar ideal para realizar una fiesta a lo grande!','Av. San Martin 3453','2025-10-30 16:08:15.000000',NULL,'Hotel Silva',1,3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=2678 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `metricas_actividad` VALUES (1,345,'2024-01-01 22:08:57.000000',1),(2,1902,'2024-01-01 02:14:44.000000',2),(3,1016,'2024-01-01 11:19:31.000000',3),(4,192,'2024-01-01 02:58:21.000000',4),(5,489,'2024-01-02 02:32:56.000000',1),(6,1568,'2024-01-02 21:40:51.000000',2),(7,1381,'2024-01-02 04:59:50.000000',3),(8,119,'2024-01-02 19:49:22.000000',4),(9,1835,'2024-01-03 19:39:25.000000',1),(10,1781,'2024-01-03 03:04:41.000000',2),(11,1315,'2024-01-03 01:34:15.000000',3),(12,952,'2024-01-03 02:08:46.000000',4),(13,246,'2024-01-04 02:38:13.000000',1),(14,95,'2024-01-04 06:47:24.000000',2),(15,1584,'2024-01-04 09:16:40.000000',3),(16,1237,'2024-01-04 19:10:04.000000',4),(17,1244,'2024-01-05 16:41:15.000000',1),(18,500,'2024-01-05 00:33:09.000000',2),(19,299,'2024-01-05 04:18:44.000000',3),(20,1172,'2024-01-05 04:57:33.000000',4),(21,1577,'2024-01-06 07:25:08.000000',1),(22,1407,'2024-01-06 00:19:31.000000',2),(23,537,'2024-01-06 11:24:52.000000',3),(24,1536,'2024-01-06 21:56:49.000000',4),(25,338,'2024-01-07 02:15:43.000000',1),(26,596,'2024-01-07 13:27:27.000000',2),(27,272,'2024-01-07 19:20:08.000000',3),(28,1795,'2024-01-07 06:15:32.000000',4),(29,1658,'2024-01-08 16:54:01.000000',1),(30,1350,'2024-01-08 00:46:29.000000',2),(31,711,'2024-01-08 06:37:07.000000',3),(32,1362,'2024-01-08 22:47:05.000000',4),(33,1476,'2024-01-09 13:20:40.000000',1),(34,1775,'2024-01-09 00:28:52.000000',2),(35,444,'2024-01-09 09:02:31.000000',3),(36,450,'2024-01-09 23:28:13.000000',4),(37,551,'2024-01-10 04:33:30.000000',1),(38,422,'2024-01-10 19:22:45.000000',2),(39,1059,'2024-01-10 15:10:41.000000',3),(40,313,'2024-01-10 17:58:14.000000',4),(41,413,'2024-01-11 12:50:25.000000',1),(42,1026,'2024-01-11 10:13:58.000000',2),(43,1781,'2024-01-11 06:51:34.000000',3),(44,592,'2024-01-11 14:14:12.000000',4),(45,1211,'2024-01-12 16:45:38.000000',1),(46,1671,'2024-01-12 22:19:15.000000',2),(47,844,'2024-01-12 09:15:02.000000',3),(48,1002,'2024-01-12 22:52:41.000000',4),(49,1426,'2024-01-13 15:25:42.000000',1),(50,73,'2024-01-13 15:14:16.000000',2),(51,557,'2024-01-13 06:39:42.000000',3),(52,1926,'2024-01-13 13:25:54.000000',4),(53,1576,'2024-01-14 03:14:48.000000',1),(54,609,'2024-01-14 12:48:20.000000',2),(55,1378,'2024-01-14 22:05:08.000000',3),(56,692,'2024-01-14 16:22:31.000000',4),(57,744,'2024-01-15 16:21:43.000000',1),(58,1896,'2024-01-15 19:29:55.000000',2),(59,1322,'2024-01-15 07:13:00.000000',3),(60,49,'2024-01-15 09:37:45.000000',4),(61,1025,'2024-01-16 22:00:25.000000',1),(62,1039,'2024-01-16 19:28:12.000000',2),(63,499,'2024-01-16 03:52:16.000000',3),(64,137,'2024-01-16 18:19:13.000000',4),(65,111,'2024-01-17 01:14:58.000000',1),(66,861,'2024-01-17 02:51:23.000000',2),(67,1350,'2024-01-17 19:01:48.000000',3),(68,1896,'2024-01-17 23:51:49.000000',4),(69,1872,'2024-01-18 18:08:19.000000',1),(70,496,'2024-01-18 09:51:44.000000',2),(71,571,'2024-01-18 00:08:08.000000',3),(72,379,'2024-01-18 09:48:53.000000',4),(73,58,'2024-01-19 17:15:46.000000',1),(74,1686,'2024-01-19 23:39:35.000000',2),(75,1515,'2024-01-19 06:10:25.000000',3),(76,1607,'2024-01-19 00:21:37.000000',4),(77,884,'2024-01-20 23:17:00.000000',1),(78,326,'2024-01-20 07:08:25.000000',2),(79,239,'2024-01-20 22:07:03.000000',3),(80,1605,'2024-01-20 19:58:13.000000',4),(81,344,'2024-01-21 12:22:40.000000',1),(82,75,'2024-01-21 07:26:53.000000',2),(83,325,'2024-01-21 06:06:49.000000',3),(84,1496,'2024-01-21 01:07:32.000000',4),(85,1498,'2024-01-22 14:21:47.000000',1),(86,996,'2024-01-22 22:46:21.000000',2),(87,1436,'2024-01-22 15:24:42.000000',3),(88,308,'2024-01-22 15:52:17.000000',4),(89,931,'2024-01-23 18:50:58.000000',1),(90,916,'2024-01-23 23:17:59.000000',2),(91,1025,'2024-01-23 09:03:11.000000',3),(92,1223,'2024-01-23 10:18:40.000000',4),(93,13,'2024-01-24 18:26:01.000000',1),(94,1230,'2024-01-24 17:26:26.000000',2),(95,1257,'2024-01-24 21:28:13.000000',3),(96,803,'2024-01-24 10:58:15.000000',4),(97,1934,'2024-01-25 15:12:57.000000',1),(98,1519,'2024-01-25 22:21:58.000000',2),(99,1450,'2024-01-25 00:00:46.000000',3),(100,1881,'2024-01-25 14:57:02.000000',4),(101,672,'2024-01-26 19:56:53.000000',1),(102,1843,'2024-01-26 04:27:31.000000',2),(103,965,'2024-01-26 01:10:55.000000',3),(104,1745,'2024-01-26 06:19:58.000000',4),(105,468,'2024-01-27 13:41:01.000000',1),(106,1179,'2024-01-27 10:59:39.000000',2),(107,188,'2024-01-27 13:44:11.000000',3),(108,956,'2024-01-27 18:02:41.000000',4),(109,476,'2024-01-28 03:13:30.000000',1),(110,437,'2024-01-28 18:52:20.000000',2),(111,4,'2024-01-28 17:32:50.000000',3),(112,136,'2024-01-28 19:32:52.000000',4),(113,545,'2024-01-29 21:28:58.000000',1),(114,1135,'2024-01-29 16:14:48.000000',2),(115,656,'2024-01-29 19:20:36.000000',3),(116,243,'2024-01-29 05:18:07.000000',4),(117,710,'2024-01-30 22:38:59.000000',1),(118,1300,'2024-01-30 22:37:36.000000',2),(119,296,'2024-01-30 10:03:42.000000',3),(120,1920,'2024-01-30 11:31:59.000000',4),(121,1814,'2024-01-31 08:34:21.000000',1),(122,1179,'2024-01-31 11:05:00.000000',2),(123,63,'2024-01-31 13:25:55.000000',3),(124,586,'2024-01-31 11:27:22.000000',4),(125,568,'2024-02-01 00:46:47.000000',1),(126,1512,'2024-02-01 07:42:48.000000',2),(127,1607,'2024-02-01 19:32:15.000000',3),(128,928,'2024-02-01 13:47:40.000000',4),(129,1159,'2024-02-02 14:15:25.000000',1),(130,1664,'2024-02-02 02:43:56.000000',2),(131,1177,'2024-02-02 19:35:59.000000',3),(132,1389,'2024-02-02 11:48:22.000000',4),(133,1801,'2024-02-03 23:55:15.000000',1),(134,1702,'2024-02-03 12:14:40.000000',2),(135,127,'2024-02-03 17:21:17.000000',3),(136,1095,'2024-02-03 03:32:23.000000',4),(137,1661,'2024-02-04 07:03:59.000000',1),(138,1688,'2024-02-04 06:24:09.000000',2),(139,1126,'2024-02-04 10:03:11.000000',3),(140,201,'2024-02-04 13:23:07.000000',4),(141,1670,'2024-02-05 19:50:47.000000',1),(142,1915,'2024-02-05 16:36:46.000000',2),(143,1352,'2024-02-05 17:01:43.000000',3),(144,457,'2024-02-05 06:01:48.000000',4),(145,511,'2024-02-06 09:18:44.000000',1),(146,1581,'2024-02-06 02:39:57.000000',2),(147,1443,'2024-02-06 14:50:35.000000',3),(148,1184,'2024-02-06 18:01:33.000000',4),(149,1495,'2024-02-07 16:54:15.000000',1),(150,1746,'2024-02-07 14:56:57.000000',2),(151,1720,'2024-02-07 11:53:46.000000',3),(152,961,'2024-02-07 19:29:13.000000',4),(153,780,'2024-02-08 23:11:19.000000',1),(154,163,'2024-02-08 01:12:10.000000',2),(155,77,'2024-02-08 06:09:22.000000',3),(156,1996,'2024-02-08 10:08:29.000000',4),(157,1216,'2024-02-09 17:16:57.000000',1),(158,1143,'2024-02-09 21:05:43.000000',2),(159,768,'2024-02-09 05:16:06.000000',3),(160,298,'2024-02-09 06:14:25.000000',4),(161,753,'2024-02-10 23:09:03.000000',1),(162,1619,'2024-02-10 23:42:11.000000',2),(163,1979,'2024-02-10 02:00:05.000000',3),(164,1023,'2024-02-10 16:41:57.000000',4),(165,1629,'2024-02-11 11:16:21.000000',1),(166,1735,'2024-02-11 15:53:16.000000',2),(167,304,'2024-02-11 08:25:06.000000',3),(168,156,'2024-02-11 16:57:33.000000',4),(169,225,'2024-02-12 06:27:31.000000',1),(170,863,'2024-02-12 18:05:08.000000',2),(171,371,'2024-02-12 21:29:58.000000',3),(172,1273,'2024-02-12 05:43:11.000000',4),(173,842,'2024-02-13 11:10:52.000000',1),(174,544,'2024-02-13 16:57:55.000000',2),(175,749,'2024-02-13 05:42:33.000000',3),(176,1333,'2024-02-13 03:47:16.000000',4),(177,580,'2024-02-14 20:35:08.000000',1),(178,1027,'2024-02-14 21:02:19.000000',2),(179,281,'2024-02-14 22:27:46.000000',3),(180,96,'2024-02-14 21:26:55.000000',4),(181,1281,'2024-02-15 13:21:25.000000',1),(182,1470,'2024-02-15 12:44:40.000000',2),(183,397,'2024-02-15 01:55:55.000000',3),(184,315,'2024-02-15 18:00:41.000000',4),(185,403,'2024-02-16 12:49:45.000000',1),(186,815,'2024-02-16 09:39:06.000000',2),(187,1856,'2024-02-16 19:55:09.000000',3),(188,1933,'2024-02-16 03:36:02.000000',4),(189,12,'2024-02-17 09:08:22.000000',1),(190,820,'2024-02-17 21:14:48.000000',2),(191,1473,'2024-02-17 09:26:02.000000',3),(192,595,'2024-02-17 12:01:35.000000',4),(193,48,'2024-02-18 23:35:44.000000',1),(194,1558,'2024-02-18 04:04:55.000000',2),(195,1161,'2024-02-18 09:11:57.000000',3),(196,38,'2024-02-18 18:02:53.000000',4),(197,270,'2024-02-19 20:07:10.000000',1),(198,790,'2024-02-19 03:50:20.000000',2),(199,575,'2024-02-19 11:51:56.000000',3),(200,1815,'2024-02-19 22:53:41.000000',4),(201,1310,'2024-02-20 16:12:39.000000',1),(202,553,'2024-02-20 05:57:20.000000',2),(203,703,'2024-02-20 15:15:37.000000',3),(204,372,'2024-02-20 20:20:48.000000',4),(205,739,'2024-02-21 09:14:50.000000',1),(206,693,'2024-02-21 16:34:48.000000',2),(207,504,'2024-02-21 15:47:36.000000',3),(208,1346,'2024-02-21 06:51:28.000000',4),(209,1030,'2024-02-22 12:09:31.000000',1),(210,1451,'2024-02-22 01:17:41.000000',2),(211,303,'2024-02-22 11:10:25.000000',3),(212,696,'2024-02-22 08:38:56.000000',4),(213,484,'2024-02-23 15:46:00.000000',1),(214,936,'2024-02-23 05:43:41.000000',2),(215,1418,'2024-02-23 14:56:10.000000',3),(216,513,'2024-02-23 16:14:05.000000',4),(217,978,'2024-02-24 06:02:06.000000',1),(218,1966,'2024-02-24 16:33:19.000000',2),(219,538,'2024-02-24 20:14:15.000000',3),(220,521,'2024-02-24 19:31:03.000000',4),(221,1062,'2024-02-25 20:41:47.000000',1),(222,1473,'2024-02-25 01:34:24.000000',2),(223,429,'2024-02-25 11:37:47.000000',3),(224,885,'2024-02-25 14:48:20.000000',4),(225,948,'2024-02-26 08:38:28.000000',1),(226,46,'2024-02-26 06:55:56.000000',2),(227,341,'2024-02-26 05:56:43.000000',3),(228,51,'2024-02-26 02:34:14.000000',4),(229,1904,'2024-02-27 19:20:04.000000',1),(230,1715,'2024-02-27 08:13:20.000000',2),(231,1445,'2024-02-27 06:12:40.000000',3),(232,7,'2024-02-27 20:00:47.000000',4),(233,1127,'2024-02-28 12:20:58.000000',1),(234,1340,'2024-02-28 06:31:26.000000',2),(235,1320,'2024-02-28 12:48:42.000000',3),(236,1005,'2024-02-28 16:42:27.000000',4),(237,1211,'2024-02-29 10:08:13.000000',1),(238,1967,'2024-02-29 18:14:14.000000',2),(239,466,'2024-02-29 15:16:29.000000',3),(240,1141,'2024-02-29 06:05:13.000000',4),(241,1486,'2024-03-01 02:10:41.000000',1),(242,1962,'2024-03-01 10:36:15.000000',2),(243,1898,'2024-03-01 13:52:38.000000',3),(244,404,'2024-03-01 00:13:55.000000',4),(245,586,'2024-03-02 23:30:38.000000',1),(246,1500,'2024-03-02 12:36:56.000000',2),(247,1212,'2024-03-02 04:06:05.000000',3),(248,1528,'2024-03-02 12:23:25.000000',4),(249,126,'2024-03-03 06:30:02.000000',1),(250,625,'2024-03-03 11:59:59.000000',2),(251,747,'2024-03-03 01:29:23.000000',3),(252,558,'2024-03-03 16:18:39.000000',4),(253,1869,'2024-03-04 08:29:49.000000',1),(254,496,'2024-03-04 14:38:41.000000',2),(255,590,'2024-03-04 09:46:46.000000',3),(256,736,'2024-03-04 06:00:24.000000',4),(257,675,'2024-03-05 02:06:54.000000',1),(258,196,'2024-03-05 10:07:37.000000',2),(259,1653,'2024-03-05 05:22:39.000000',3),(260,1638,'2024-03-05 11:01:45.000000',4),(261,238,'2024-03-06 17:09:35.000000',1),(262,1777,'2024-03-06 10:46:25.000000',2),(263,1614,'2024-03-06 02:15:49.000000',3),(264,679,'2024-03-06 18:02:52.000000',4),(265,357,'2024-03-07 10:32:13.000000',1),(266,670,'2024-03-07 13:46:18.000000',2),(267,1506,'2024-03-07 22:49:46.000000',3),(268,576,'2024-03-07 21:49:07.000000',4),(269,1394,'2024-03-08 17:05:27.000000',1),(270,1302,'2024-03-08 08:21:38.000000',2),(271,191,'2024-03-08 05:01:51.000000',3),(272,1906,'2024-03-08 20:20:41.000000',4),(273,483,'2024-03-09 05:16:29.000000',1),(274,20,'2024-03-09 13:07:08.000000',2),(275,21,'2024-03-09 09:47:06.000000',3),(276,210,'2024-03-09 19:50:53.000000',4),(277,1808,'2024-03-10 01:02:55.000000',1),(278,450,'2024-03-10 09:17:33.000000',2),(279,284,'2024-03-10 23:07:08.000000',3),(280,1330,'2024-03-10 19:37:49.000000',4),(281,721,'2024-03-11 20:54:13.000000',1),(282,1715,'2024-03-11 04:30:02.000000',2),(283,97,'2024-03-11 17:22:36.000000',3),(284,400,'2024-03-11 01:39:11.000000',4),(285,726,'2024-03-12 19:01:02.000000',1),(286,180,'2024-03-12 10:27:05.000000',2),(287,889,'2024-03-12 03:25:29.000000',3),(288,1256,'2024-03-12 19:00:21.000000',4),(289,1856,'2024-03-13 18:17:24.000000',1),(290,1958,'2024-03-13 08:27:25.000000',2),(291,492,'2024-03-13 20:04:23.000000',3),(292,1725,'2024-03-13 17:16:39.000000',4),(293,335,'2024-03-14 03:37:04.000000',1),(294,847,'2024-03-14 09:14:32.000000',2),(295,1062,'2024-03-14 23:02:25.000000',3),(296,560,'2024-03-14 18:35:16.000000',4),(297,1074,'2024-03-15 01:48:20.000000',1),(298,1369,'2024-03-15 11:01:02.000000',2),(299,343,'2024-03-15 01:04:36.000000',3),(300,184,'2024-03-15 17:18:11.000000',4),(301,398,'2024-03-16 07:04:16.000000',1),(302,1901,'2024-03-16 02:37:20.000000',2),(303,541,'2024-03-16 10:11:02.000000',3),(304,1168,'2024-03-16 01:53:49.000000',4),(305,1325,'2024-03-17 16:23:17.000000',1),(306,652,'2024-03-17 06:18:00.000000',2),(307,466,'2024-03-17 20:12:34.000000',3),(308,972,'2024-03-17 15:16:52.000000',4),(309,276,'2024-03-18 12:27:25.000000',1),(310,487,'2024-03-18 03:09:04.000000',2),(311,774,'2024-03-18 19:45:42.000000',3),(312,311,'2024-03-18 11:06:42.000000',4),(313,932,'2024-03-19 09:16:02.000000',1),(314,904,'2024-03-19 04:04:21.000000',2),(315,780,'2024-03-19 17:58:25.000000',3),(316,682,'2024-03-19 16:50:50.000000',4),(317,1930,'2024-03-20 14:20:09.000000',1),(318,529,'2024-03-20 00:45:34.000000',2),(319,669,'2024-03-20 05:24:22.000000',3),(320,1946,'2024-03-20 23:52:50.000000',4),(321,947,'2024-03-21 21:04:42.000000',1),(322,479,'2024-03-21 17:33:47.000000',2),(323,563,'2024-03-21 23:59:33.000000',3),(324,392,'2024-03-21 09:47:27.000000',4),(325,367,'2024-03-22 18:05:40.000000',1),(326,1435,'2024-03-22 15:40:44.000000',2),(327,1967,'2024-03-22 15:02:57.000000',3),(328,446,'2024-03-22 00:49:38.000000',4),(329,778,'2024-03-23 00:16:33.000000',1),(330,752,'2024-03-23 21:47:51.000000',2),(331,1277,'2024-03-23 03:40:20.000000',3),(332,1501,'2024-03-23 17:35:45.000000',4),(333,1027,'2024-03-24 13:16:11.000000',1),(334,1990,'2024-03-24 21:45:50.000000',2),(335,569,'2024-03-24 06:05:24.000000',3),(336,894,'2024-03-24 15:50:13.000000',4),(337,1859,'2024-03-25 06:05:30.000000',1),(338,1263,'2024-03-25 21:12:32.000000',2),(339,1272,'2024-03-25 12:08:42.000000',3),(340,800,'2024-03-25 15:52:37.000000',4),(341,1750,'2024-03-26 00:21:21.000000',1),(342,34,'2024-03-26 07:52:23.000000',2),(343,895,'2024-03-26 02:23:16.000000',3),(344,697,'2024-03-26 22:30:44.000000',4),(345,1180,'2024-03-27 22:14:36.000000',1),(346,136,'2024-03-27 04:00:50.000000',2),(347,1959,'2024-03-27 20:04:25.000000',3),(348,1990,'2024-03-27 09:16:29.000000',4),(349,180,'2024-03-28 19:33:26.000000',1),(350,1510,'2024-03-28 00:07:02.000000',2),(351,1060,'2024-03-28 18:12:41.000000',3),(352,556,'2024-03-28 08:57:50.000000',4),(353,1008,'2024-03-29 06:24:48.000000',1),(354,138,'2024-03-29 17:10:52.000000',2),(355,1555,'2024-03-29 04:43:24.000000',3),(356,300,'2024-03-29 07:06:41.000000',4),(357,1691,'2024-03-30 20:36:39.000000',1),(358,1430,'2024-03-30 15:36:08.000000',2),(359,1940,'2024-03-30 14:56:40.000000',3),(360,1985,'2024-03-30 23:31:37.000000',4),(361,260,'2024-03-31 00:30:50.000000',1),(362,1065,'2024-03-31 14:01:18.000000',2),(363,1886,'2024-03-31 21:47:15.000000',3),(364,247,'2024-03-31 23:46:00.000000',4),(365,1713,'2024-04-01 15:28:59.000000',1),(366,314,'2024-04-01 08:16:44.000000',2),(367,542,'2024-04-01 17:57:14.000000',3),(368,1467,'2024-04-01 02:37:00.000000',4),(369,989,'2024-04-02 08:07:52.000000',1),(370,1593,'2024-04-02 10:56:34.000000',2),(371,1362,'2024-04-02 14:44:10.000000',3),(372,1541,'2024-04-02 13:30:13.000000',4),(373,1022,'2024-04-03 03:56:45.000000',1),(374,1536,'2024-04-03 01:26:14.000000',2),(375,1978,'2024-04-03 15:47:55.000000',3),(376,1752,'2024-04-03 23:14:25.000000',4),(377,1487,'2024-04-04 11:22:44.000000',1),(378,474,'2024-04-04 07:02:15.000000',2),(379,1623,'2024-04-04 07:18:09.000000',3),(380,557,'2024-04-04 03:24:51.000000',4),(381,1976,'2024-04-05 23:08:48.000000',1),(382,518,'2024-04-05 01:03:46.000000',2),(383,62,'2024-04-05 03:52:26.000000',3),(384,500,'2024-04-05 16:02:17.000000',4),(385,944,'2024-04-06 05:51:40.000000',1),(386,1428,'2024-04-06 15:01:07.000000',2),(387,636,'2024-04-06 16:36:16.000000',3),(388,1226,'2024-04-06 12:19:02.000000',4),(389,1569,'2024-04-07 12:35:26.000000',1),(390,779,'2024-04-07 08:21:52.000000',2),(391,670,'2024-04-07 21:36:36.000000',3),(392,1706,'2024-04-07 23:18:37.000000',4),(393,387,'2024-04-08 08:24:32.000000',1),(394,1997,'2024-04-08 21:58:36.000000',2),(395,460,'2024-04-08 05:52:44.000000',3),(396,752,'2024-04-08 09:54:32.000000',4),(397,146,'2024-04-09 15:21:30.000000',1),(398,1995,'2024-04-09 10:37:56.000000',2),(399,594,'2024-04-09 15:47:11.000000',3),(400,1325,'2024-04-09 12:15:08.000000',4),(401,1825,'2024-04-10 18:42:56.000000',1),(402,747,'2024-04-10 05:19:45.000000',2),(403,1766,'2024-04-10 04:48:46.000000',3),(404,822,'2024-04-10 19:28:58.000000',4),(405,1727,'2024-04-11 14:51:38.000000',1),(406,1407,'2024-04-11 11:00:25.000000',2),(407,1191,'2024-04-11 03:23:09.000000',3),(408,1959,'2024-04-11 13:16:18.000000',4),(409,496,'2024-04-12 05:41:26.000000',1),(410,1796,'2024-04-12 12:40:43.000000',2),(411,1648,'2024-04-12 21:40:46.000000',3),(412,1143,'2024-04-12 09:48:15.000000',4),(413,890,'2024-04-13 15:09:50.000000',1),(414,615,'2024-04-13 07:52:48.000000',2),(415,1675,'2024-04-13 13:14:43.000000',3),(416,285,'2024-04-13 12:44:28.000000',4),(417,343,'2024-04-14 02:52:28.000000',1),(418,1949,'2024-04-14 11:56:38.000000',2),(419,1933,'2024-04-14 09:03:52.000000',3),(420,1176,'2024-04-14 16:43:54.000000',4),(421,942,'2024-04-15 20:19:20.000000',1),(422,1316,'2024-04-15 19:32:20.000000',2),(423,528,'2024-04-15 20:20:25.000000',3),(424,176,'2024-04-15 18:37:04.000000',4),(425,588,'2024-04-16 02:40:26.000000',1),(426,1590,'2024-04-16 03:14:46.000000',2),(427,904,'2024-04-16 13:36:40.000000',3),(428,871,'2024-04-16 13:23:46.000000',4),(429,402,'2024-04-17 12:01:46.000000',1),(430,1794,'2024-04-17 11:59:43.000000',2),(431,471,'2024-04-17 23:38:44.000000',3),(432,800,'2024-04-17 05:18:31.000000',4),(433,959,'2024-04-18 08:03:28.000000',1),(434,1009,'2024-04-18 09:19:09.000000',2),(435,536,'2024-04-18 08:32:46.000000',3),(436,1104,'2024-04-18 06:30:17.000000',4),(437,140,'2024-04-19 22:40:39.000000',1),(438,720,'2024-04-19 12:19:51.000000',2),(439,421,'2024-04-19 06:11:28.000000',3),(440,1512,'2024-04-19 06:39:19.000000',4),(441,937,'2024-04-20 22:43:53.000000',1),(442,190,'2024-04-20 11:59:53.000000',2),(443,1175,'2024-04-20 23:23:00.000000',3),(444,603,'2024-04-20 00:17:59.000000',4),(445,880,'2024-04-21 11:14:58.000000',1),(446,1295,'2024-04-21 19:02:29.000000',2),(447,676,'2024-04-21 20:32:30.000000',3),(448,1190,'2024-04-21 02:55:11.000000',4),(449,517,'2024-04-22 14:36:13.000000',1),(450,1113,'2024-04-22 11:11:24.000000',2),(451,489,'2024-04-22 09:10:54.000000',3),(452,1262,'2024-04-22 01:44:34.000000',4),(453,1581,'2024-04-23 22:28:41.000000',1),(454,676,'2024-04-23 03:24:06.000000',2),(455,611,'2024-04-23 06:19:46.000000',3),(456,1522,'2024-04-23 17:38:48.000000',4),(457,1405,'2024-04-24 14:19:21.000000',1),(458,1000,'2024-04-24 17:18:40.000000',2),(459,341,'2024-04-24 08:00:37.000000',3),(460,1477,'2024-04-24 20:23:38.000000',4),(461,987,'2024-04-25 03:23:45.000000',1),(462,1449,'2024-04-25 00:58:36.000000',2),(463,651,'2024-04-25 11:59:33.000000',3),(464,1328,'2024-04-25 03:04:17.000000',4),(465,1362,'2024-04-26 22:25:29.000000',1),(466,1928,'2024-04-26 14:25:45.000000',2),(467,359,'2024-04-26 00:20:03.000000',3),(468,1463,'2024-04-26 20:29:21.000000',4),(469,565,'2024-04-27 02:17:10.000000',1),(470,1570,'2024-04-27 03:02:05.000000',2),(471,744,'2024-04-27 13:05:11.000000',3),(472,1991,'2024-04-27 05:19:42.000000',4),(473,1138,'2024-04-28 07:27:50.000000',1),(474,1696,'2024-04-28 21:51:36.000000',2),(475,1983,'2024-04-28 12:10:05.000000',3),(476,408,'2024-04-28 10:27:12.000000',4),(477,1904,'2024-04-29 17:06:13.000000',1),(478,494,'2024-04-29 14:53:18.000000',2),(479,247,'2024-04-29 08:56:45.000000',3),(480,250,'2024-04-29 11:58:39.000000',4),(481,527,'2024-04-30 03:03:45.000000',1),(482,1751,'2024-04-30 22:23:28.000000',2),(483,528,'2024-04-30 13:52:15.000000',3),(484,263,'2024-04-30 14:01:33.000000',4),(485,236,'2024-05-01 21:39:11.000000',1),(486,118,'2024-05-01 21:10:41.000000',2),(487,110,'2024-05-01 15:30:31.000000',3),(488,1030,'2024-05-01 08:03:37.000000',4),(489,566,'2024-05-02 13:34:04.000000',1),(490,1489,'2024-05-02 17:14:47.000000',2),(491,1189,'2024-05-02 13:34:14.000000',3),(492,1195,'2024-05-02 06:37:37.000000',4),(493,1992,'2024-05-03 03:46:46.000000',1),(494,1094,'2024-05-03 12:09:54.000000',2),(495,855,'2024-05-03 05:07:29.000000',3),(496,389,'2024-05-03 11:52:56.000000',4),(497,1688,'2024-05-04 11:38:38.000000',1),(498,563,'2024-05-04 18:17:48.000000',2),(499,1498,'2024-05-04 02:50:31.000000',3),(500,1394,'2024-05-04 09:19:32.000000',4),(501,993,'2024-05-05 07:36:41.000000',1),(502,311,'2024-05-05 12:41:14.000000',2),(503,968,'2024-05-05 04:33:22.000000',3),(504,1590,'2024-05-05 20:22:48.000000',4),(505,1490,'2024-05-06 10:13:05.000000',1),(506,1,'2024-05-06 10:43:33.000000',2),(507,595,'2024-05-06 15:49:37.000000',3),(508,1292,'2024-05-06 12:10:46.000000',4),(509,1196,'2024-05-07 16:58:15.000000',1),(510,1093,'2024-05-07 20:49:48.000000',2),(511,1989,'2024-05-07 03:02:03.000000',3),(512,1945,'2024-05-07 14:10:50.000000',4),(513,1052,'2024-05-08 02:07:19.000000',1),(514,471,'2024-05-08 08:41:46.000000',2),(515,1476,'2024-05-08 02:07:39.000000',3),(516,1806,'2024-05-08 10:09:28.000000',4),(517,1022,'2024-05-09 05:51:04.000000',1),(518,1166,'2024-05-09 19:45:10.000000',2),(519,940,'2024-05-09 10:38:32.000000',3),(520,1361,'2024-05-09 00:25:41.000000',4),(521,1400,'2024-05-10 08:21:18.000000',1),(522,341,'2024-05-10 10:53:35.000000',2),(523,1883,'2024-05-10 11:46:22.000000',3),(524,705,'2024-05-10 05:38:44.000000',4),(525,435,'2024-05-11 01:18:48.000000',1),(526,1924,'2024-05-11 22:08:47.000000',2),(527,631,'2024-05-11 00:57:42.000000',3),(528,674,'2024-05-11 10:57:27.000000',4),(529,1121,'2024-05-12 07:32:19.000000',1),(530,1228,'2024-05-12 20:36:53.000000',2),(531,1248,'2024-05-12 11:50:06.000000',3),(532,648,'2024-05-12 15:20:03.000000',4),(533,1072,'2024-05-13 16:49:57.000000',1),(534,541,'2024-05-13 13:48:48.000000',2),(535,615,'2024-05-13 14:57:48.000000',3),(536,817,'2024-05-13 15:59:05.000000',4),(537,1985,'2024-05-14 01:02:35.000000',1),(538,361,'2024-05-14 19:57:19.000000',2),(539,987,'2024-05-14 09:45:43.000000',3),(540,1493,'2024-05-14 05:52:58.000000',4),(541,1488,'2024-05-15 23:55:00.000000',1),(542,819,'2024-05-15 17:28:18.000000',2),(543,174,'2024-05-15 20:42:43.000000',3),(544,1932,'2024-05-15 20:17:07.000000',4),(545,1130,'2024-05-16 07:00:50.000000',1),(546,72,'2024-05-16 22:41:58.000000',2),(547,1190,'2024-05-16 08:10:01.000000',3),(548,1963,'2024-05-16 22:52:33.000000',4),(549,587,'2024-05-17 01:08:24.000000',1),(550,1483,'2024-05-17 07:46:52.000000',2),(551,880,'2024-05-17 17:34:50.000000',3),(552,1364,'2024-05-17 00:00:01.000000',4),(553,1988,'2024-05-18 09:46:58.000000',1),(554,1487,'2024-05-18 17:52:25.000000',2),(555,356,'2024-05-18 11:33:14.000000',3),(556,1378,'2024-05-18 10:39:52.000000',4),(557,969,'2024-05-19 02:38:23.000000',1),(558,2,'2024-05-19 02:10:31.000000',2),(559,1318,'2024-05-19 17:34:21.000000',3),(560,1009,'2024-05-19 02:18:08.000000',4),(561,1306,'2024-05-20 05:35:36.000000',1),(562,1731,'2024-05-20 13:33:11.000000',2),(563,1130,'2024-05-20 15:10:11.000000',3),(564,1883,'2024-05-20 22:14:55.000000',4),(565,1603,'2024-05-21 22:11:54.000000',1),(566,1499,'2024-05-21 05:31:52.000000',2),(567,51,'2024-05-21 01:18:30.000000',3),(568,1467,'2024-05-21 23:04:44.000000',4),(569,1404,'2024-05-22 18:43:25.000000',1),(570,1474,'2024-05-22 04:02:30.000000',2),(571,1363,'2024-05-22 04:16:46.000000',3),(572,636,'2024-05-22 20:56:18.000000',4),(573,1809,'2024-05-23 23:18:56.000000',1),(574,639,'2024-05-23 14:33:08.000000',2),(575,1858,'2024-05-23 18:39:16.000000',3),(576,1540,'2024-05-23 07:27:56.000000',4),(577,532,'2024-05-24 21:57:24.000000',1),(578,236,'2024-05-24 13:59:21.000000',2),(579,1704,'2024-05-24 20:11:12.000000',3),(580,243,'2024-05-24 17:38:45.000000',4),(581,1271,'2024-05-25 09:35:35.000000',1),(582,1961,'2024-05-25 23:27:13.000000',2),(583,1820,'2024-05-25 23:17:04.000000',3),(584,926,'2024-05-25 15:19:16.000000',4),(585,1202,'2024-05-26 09:32:41.000000',1),(586,505,'2024-05-26 19:27:43.000000',2),(587,769,'2024-05-26 19:52:37.000000',3),(588,70,'2024-05-26 10:30:13.000000',4),(589,406,'2024-05-27 20:40:33.000000',1),(590,1079,'2024-05-27 10:18:31.000000',2),(591,841,'2024-05-27 09:46:56.000000',3),(592,264,'2024-05-27 21:05:03.000000',4),(593,1444,'2024-05-28 00:33:48.000000',1),(594,1062,'2024-05-28 12:56:40.000000',2),(595,1181,'2024-05-28 00:52:40.000000',3),(596,868,'2024-05-28 20:10:44.000000',4),(597,1858,'2024-05-29 15:30:06.000000',1),(598,1480,'2024-05-29 16:55:18.000000',2),(599,1395,'2024-05-29 13:59:52.000000',3),(600,1177,'2024-05-29 17:39:48.000000',4),(601,1814,'2024-05-30 17:37:39.000000',1),(602,1871,'2024-05-30 07:57:01.000000',2),(603,1224,'2024-05-30 16:24:29.000000',3),(604,413,'2024-05-30 00:12:07.000000',4),(605,832,'2024-05-31 00:10:03.000000',1),(606,77,'2024-05-31 01:22:02.000000',2),(607,1968,'2024-05-31 00:28:19.000000',3),(608,706,'2024-05-31 20:39:43.000000',4),(609,1689,'2024-06-01 04:19:53.000000',1),(610,1743,'2024-06-01 16:20:31.000000',2),(611,1905,'2024-06-01 07:30:52.000000',3),(612,496,'2024-06-01 19:41:54.000000',4),(613,281,'2024-06-02 18:38:29.000000',1),(614,868,'2024-06-02 08:54:05.000000',2),(615,1962,'2024-06-02 01:21:13.000000',3),(616,1453,'2024-06-02 17:36:21.000000',4),(617,1947,'2024-06-03 10:19:48.000000',1),(618,1919,'2024-06-03 13:49:15.000000',2),(619,924,'2024-06-03 01:37:38.000000',3),(620,284,'2024-06-03 02:31:51.000000',4),(621,1083,'2024-06-04 09:26:32.000000',1),(622,14,'2024-06-04 12:37:32.000000',2),(623,505,'2024-06-04 10:54:16.000000',3),(624,1469,'2024-06-04 21:33:22.000000',4),(625,1358,'2024-06-05 23:25:43.000000',1),(626,571,'2024-06-05 11:08:30.000000',2),(627,635,'2024-06-05 00:50:01.000000',3),(628,917,'2024-06-05 11:34:02.000000',4),(629,1701,'2024-06-06 20:16:39.000000',1),(630,54,'2024-06-06 17:10:03.000000',2),(631,1711,'2024-06-06 23:41:13.000000',3),(632,15,'2024-06-06 07:32:52.000000',4),(633,884,'2024-06-07 02:13:29.000000',1),(634,660,'2024-06-07 22:20:38.000000',2),(635,569,'2024-06-07 20:30:33.000000',3),(636,871,'2024-06-07 20:34:55.000000',4),(637,1421,'2024-06-08 14:28:33.000000',1),(638,1157,'2024-06-08 17:48:11.000000',2),(639,1189,'2024-06-08 15:58:40.000000',3),(640,166,'2024-06-08 23:21:00.000000',4),(641,444,'2024-06-09 11:51:09.000000',1),(642,940,'2024-06-09 15:02:53.000000',2),(643,1866,'2024-06-09 11:14:38.000000',3),(644,988,'2024-06-09 06:12:03.000000',4),(645,1966,'2024-06-10 16:37:24.000000',1),(646,453,'2024-06-10 20:02:05.000000',2),(647,915,'2024-06-10 15:03:09.000000',3),(648,1295,'2024-06-10 09:41:14.000000',4),(649,362,'2024-06-11 00:35:07.000000',1),(650,1222,'2024-06-11 19:56:04.000000',2),(651,1956,'2024-06-11 13:29:14.000000',3),(652,155,'2024-06-11 04:50:50.000000',4),(653,1336,'2024-06-12 18:42:53.000000',1),(654,1977,'2024-06-12 23:57:20.000000',2),(655,1540,'2024-06-12 22:43:35.000000',3),(656,1465,'2024-06-12 00:11:59.000000',4),(657,1966,'2024-06-13 15:15:37.000000',1),(658,167,'2024-06-13 00:09:02.000000',2),(659,1468,'2024-06-13 09:31:09.000000',3),(660,392,'2024-06-13 11:30:28.000000',4),(661,233,'2024-06-14 12:58:37.000000',1),(662,885,'2024-06-14 22:59:39.000000',2),(663,721,'2024-06-14 08:06:00.000000',3),(664,1735,'2024-06-14 18:57:09.000000',4),(665,464,'2024-06-15 23:11:59.000000',1),(666,1201,'2024-06-15 06:13:14.000000',2),(667,646,'2024-06-15 05:23:51.000000',3),(668,1465,'2024-06-15 22:34:00.000000',4),(669,20,'2024-06-16 20:11:36.000000',1),(670,1182,'2024-06-16 12:34:22.000000',2),(671,267,'2024-06-16 09:08:37.000000',3),(672,439,'2024-06-16 12:34:22.000000',4),(673,1932,'2024-06-17 12:35:34.000000',1),(674,752,'2024-06-17 06:06:32.000000',2),(675,887,'2024-06-17 02:44:08.000000',3),(676,88,'2024-06-17 20:59:43.000000',4),(677,1692,'2024-06-18 14:17:34.000000',1),(678,1346,'2024-06-18 10:36:31.000000',2),(679,349,'2024-06-18 00:55:37.000000',3),(680,511,'2024-06-18 18:08:08.000000',4),(681,566,'2024-06-19 00:14:07.000000',1),(682,157,'2024-06-19 09:14:59.000000',2),(683,1877,'2024-06-19 05:37:42.000000',3),(684,244,'2024-06-19 23:41:34.000000',4),(685,1733,'2024-06-20 15:30:27.000000',1),(686,725,'2024-06-20 09:24:34.000000',2),(687,167,'2024-06-20 15:12:41.000000',3),(688,642,'2024-06-20 12:20:07.000000',4),(689,688,'2024-06-21 01:28:04.000000',1),(690,1300,'2024-06-21 12:52:22.000000',2),(691,507,'2024-06-21 15:22:33.000000',3),(692,1932,'2024-06-21 08:17:06.000000',4),(693,136,'2024-06-22 19:01:57.000000',1),(694,1198,'2024-06-22 23:03:10.000000',2),(695,1536,'2024-06-22 02:42:37.000000',3),(696,402,'2024-06-22 12:01:18.000000',4),(697,1804,'2024-06-23 12:01:09.000000',1),(698,660,'2024-06-23 00:10:12.000000',2),(699,297,'2024-06-23 15:03:40.000000',3),(700,1707,'2024-06-23 20:38:02.000000',4),(701,1754,'2024-06-24 16:29:44.000000',1),(702,1954,'2024-06-24 07:42:49.000000',2),(703,1346,'2024-06-24 22:05:50.000000',3),(704,1976,'2024-06-24 14:25:38.000000',4),(705,1426,'2024-06-25 03:14:40.000000',1),(706,1307,'2024-06-25 03:47:57.000000',2),(707,1992,'2024-06-25 18:59:08.000000',3),(708,82,'2024-06-25 14:32:07.000000',4),(709,1631,'2024-06-26 09:18:04.000000',1),(710,237,'2024-06-26 21:54:18.000000',2),(711,1826,'2024-06-26 20:29:06.000000',3),(712,554,'2024-06-26 00:04:19.000000',4),(713,92,'2024-06-27 09:00:18.000000',1),(714,747,'2024-06-27 02:26:54.000000',2),(715,1373,'2024-06-27 13:28:19.000000',3),(716,1356,'2024-06-27 17:56:03.000000',4),(717,1396,'2024-06-28 03:30:19.000000',1),(718,312,'2024-06-28 01:11:28.000000',2),(719,1354,'2024-06-28 15:05:13.000000',3),(720,913,'2024-06-28 11:56:01.000000',4),(721,1161,'2024-06-29 18:57:19.000000',1),(722,1832,'2024-06-29 12:44:55.000000',2),(723,352,'2024-06-29 23:37:44.000000',3),(724,200,'2024-06-29 22:12:39.000000',4),(725,629,'2024-06-30 17:20:46.000000',1),(726,147,'2024-06-30 09:40:42.000000',2),(727,1133,'2024-06-30 03:46:28.000000',3),(728,192,'2024-06-30 08:36:45.000000',4),(729,1454,'2024-07-01 09:40:09.000000',1),(730,1892,'2024-07-01 10:12:14.000000',2),(731,848,'2024-07-01 10:50:58.000000',3),(732,1086,'2024-07-01 18:18:30.000000',4),(733,999,'2024-07-02 10:12:47.000000',1),(734,1202,'2024-07-02 05:16:26.000000',2),(735,1849,'2024-07-02 08:17:22.000000',3),(736,303,'2024-07-02 14:02:01.000000',4),(737,1108,'2024-07-03 00:01:59.000000',1),(738,315,'2024-07-03 18:19:37.000000',2),(739,21,'2024-07-03 11:55:03.000000',3),(740,1559,'2024-07-03 13:29:25.000000',4),(741,1431,'2024-07-04 05:03:24.000000',1),(742,1154,'2024-07-04 22:40:06.000000',2),(743,1036,'2024-07-04 01:11:17.000000',3),(744,1294,'2024-07-04 10:33:35.000000',4),(745,1263,'2024-07-05 21:56:46.000000',1),(746,352,'2024-07-05 09:56:13.000000',2),(747,1315,'2024-07-05 15:17:14.000000',3),(748,1818,'2024-07-05 09:01:45.000000',4),(749,701,'2024-07-06 09:58:03.000000',1),(750,950,'2024-07-06 12:07:15.000000',2),(751,1731,'2024-07-06 20:35:18.000000',3),(752,346,'2024-07-06 18:05:36.000000',4),(753,995,'2024-07-07 14:28:41.000000',1),(754,1785,'2024-07-07 16:14:36.000000',2),(755,949,'2024-07-07 10:19:22.000000',3),(756,1965,'2024-07-07 01:56:43.000000',4),(757,797,'2024-07-08 16:03:29.000000',1),(758,1444,'2024-07-08 23:35:51.000000',2),(759,265,'2024-07-08 15:49:49.000000',3),(760,39,'2024-07-08 16:23:56.000000',4),(761,348,'2024-07-09 01:06:36.000000',1),(762,252,'2024-07-09 17:30:09.000000',2),(763,1645,'2024-07-09 10:33:19.000000',3),(764,994,'2024-07-09 19:01:40.000000',4),(765,75,'2024-07-10 02:32:02.000000',1),(766,482,'2024-07-10 20:53:45.000000',2),(767,479,'2024-07-10 14:13:05.000000',3),(768,765,'2024-07-10 10:04:59.000000',4),(769,214,'2024-07-11 15:36:57.000000',1),(770,1174,'2024-07-11 13:57:11.000000',2),(771,382,'2024-07-11 04:34:03.000000',3),(772,691,'2024-07-11 09:12:22.000000',4),(773,1684,'2024-07-12 13:48:42.000000',1),(774,1770,'2024-07-12 11:34:00.000000',2),(775,469,'2024-07-12 23:27:46.000000',3),(776,969,'2024-07-12 05:41:43.000000',4),(777,197,'2024-07-13 17:02:48.000000',1),(778,1007,'2024-07-13 08:37:40.000000',2),(779,1360,'2024-07-13 10:30:34.000000',3),(780,768,'2024-07-13 02:01:44.000000',4),(781,351,'2024-07-14 15:58:06.000000',1),(782,1756,'2024-07-14 21:08:17.000000',2),(783,197,'2024-07-14 17:54:33.000000',3),(784,1926,'2024-07-14 06:01:58.000000',4),(785,824,'2024-07-15 01:26:31.000000',1),(786,321,'2024-07-15 21:06:02.000000',2),(787,679,'2024-07-15 03:56:15.000000',3),(788,10,'2024-07-15 04:54:29.000000',4),(789,65,'2024-07-16 09:49:09.000000',1),(790,1138,'2024-07-16 22:23:31.000000',2),(791,1037,'2024-07-16 01:04:40.000000',3),(792,1454,'2024-07-16 10:56:57.000000',4),(793,282,'2024-07-17 06:20:19.000000',1),(794,276,'2024-07-17 21:53:21.000000',2),(795,695,'2024-07-17 22:50:54.000000',3),(796,717,'2024-07-17 21:07:06.000000',4),(797,1359,'2024-07-18 03:36:57.000000',1),(798,1358,'2024-07-18 22:38:13.000000',2),(799,1577,'2024-07-18 13:33:39.000000',3),(800,1739,'2024-07-18 05:55:34.000000',4),(801,846,'2024-07-19 14:32:54.000000',1),(802,416,'2024-07-19 07:05:00.000000',2),(803,277,'2024-07-19 03:39:07.000000',3),(804,1519,'2024-07-19 05:38:10.000000',4),(805,370,'2024-07-20 02:13:23.000000',1),(806,1355,'2024-07-20 15:30:42.000000',2),(807,404,'2024-07-20 10:43:03.000000',3),(808,1470,'2024-07-20 16:01:42.000000',4),(809,293,'2024-07-21 16:04:59.000000',1),(810,340,'2024-07-21 17:19:22.000000',2),(811,1811,'2024-07-21 16:23:11.000000',3),(812,1337,'2024-07-21 11:26:25.000000',4),(813,1110,'2024-07-22 21:53:15.000000',1),(814,1048,'2024-07-22 00:54:07.000000',2),(815,1921,'2024-07-22 12:09:05.000000',3),(816,1057,'2024-07-22 06:45:38.000000',4),(817,785,'2024-07-23 19:05:16.000000',1),(818,1406,'2024-07-23 13:49:23.000000',2),(819,1639,'2024-07-23 18:51:06.000000',3),(820,490,'2024-07-23 17:46:32.000000',4),(821,560,'2024-07-24 00:04:11.000000',1),(822,218,'2024-07-24 09:20:52.000000',2),(823,1092,'2024-07-24 08:58:54.000000',3),(824,779,'2024-07-24 14:31:26.000000',4),(825,966,'2024-07-25 03:07:14.000000',1),(826,1344,'2024-07-25 00:34:32.000000',2),(827,828,'2024-07-25 06:51:17.000000',3),(828,1627,'2024-07-25 05:03:28.000000',4),(829,1457,'2024-07-26 10:24:20.000000',1),(830,1041,'2024-07-26 08:11:08.000000',2),(831,662,'2024-07-26 13:52:45.000000',3),(832,1198,'2024-07-26 22:02:08.000000',4),(833,808,'2024-07-27 05:45:44.000000',1),(834,564,'2024-07-27 07:09:58.000000',2),(835,1434,'2024-07-27 12:17:43.000000',3),(836,165,'2024-07-27 01:06:57.000000',4),(837,234,'2024-07-28 06:32:50.000000',1),(838,948,'2024-07-28 18:21:15.000000',2),(839,1909,'2024-07-28 01:48:12.000000',3),(840,1725,'2024-07-28 13:04:40.000000',4),(841,1597,'2024-07-29 16:14:55.000000',1),(842,805,'2024-07-29 23:01:22.000000',2),(843,919,'2024-07-29 03:11:43.000000',3),(844,207,'2024-07-29 21:30:22.000000',4),(845,1656,'2024-07-30 19:51:34.000000',1),(846,1606,'2024-07-30 15:46:36.000000',2),(847,1608,'2024-07-30 01:01:13.000000',3),(848,94,'2024-07-30 21:23:58.000000',4),(849,1307,'2024-07-31 13:24:27.000000',1),(850,1976,'2024-07-31 14:08:46.000000',2),(851,1787,'2024-07-31 04:06:46.000000',3),(852,153,'2024-07-31 22:49:35.000000',4),(853,830,'2024-08-01 12:41:24.000000',1),(854,376,'2024-08-01 11:40:16.000000',2),(855,1682,'2024-08-01 11:32:27.000000',3),(856,557,'2024-08-01 18:14:23.000000',4),(857,1450,'2024-08-02 02:41:14.000000',1),(858,527,'2024-08-02 06:53:57.000000',2),(859,963,'2024-08-02 10:54:04.000000',3),(860,1543,'2024-08-02 01:01:48.000000',4),(861,649,'2024-08-03 17:27:45.000000',1),(862,437,'2024-08-03 10:30:58.000000',2),(863,460,'2024-08-03 18:38:50.000000',3),(864,809,'2024-08-03 19:39:02.000000',4),(865,1217,'2024-08-04 13:32:14.000000',1),(866,1833,'2024-08-04 08:21:17.000000',2),(867,1878,'2024-08-04 12:54:11.000000',3),(868,1187,'2024-08-04 01:58:10.000000',4),(869,1645,'2024-08-05 17:17:27.000000',1),(870,569,'2024-08-05 22:48:19.000000',2),(871,1997,'2024-08-05 13:41:04.000000',3),(872,826,'2024-08-05 06:45:30.000000',4),(873,1712,'2024-08-06 05:15:06.000000',1),(874,1097,'2024-08-06 14:57:25.000000',2),(875,1427,'2024-08-06 20:55:04.000000',3),(876,1232,'2024-08-06 22:49:29.000000',4),(877,561,'2024-08-07 05:24:43.000000',1),(878,1571,'2024-08-07 17:24:18.000000',2),(879,787,'2024-08-07 17:59:29.000000',3),(880,805,'2024-08-07 17:11:25.000000',4),(881,211,'2024-08-08 20:41:47.000000',1),(882,753,'2024-08-08 22:31:11.000000',2),(883,412,'2024-08-08 01:36:22.000000',3),(884,1035,'2024-08-08 19:50:30.000000',4),(885,1954,'2024-08-09 02:32:09.000000',1),(886,1809,'2024-08-09 13:36:24.000000',2),(887,784,'2024-08-09 19:42:14.000000',3),(888,615,'2024-08-09 11:55:02.000000',4),(889,613,'2024-08-10 01:05:28.000000',1),(890,112,'2024-08-10 09:28:35.000000',2),(891,598,'2024-08-10 02:13:56.000000',3),(892,345,'2024-08-10 05:07:29.000000',4),(893,1169,'2024-08-11 05:16:56.000000',1),(894,1097,'2024-08-11 06:14:33.000000',2),(895,323,'2024-08-11 23:04:09.000000',3),(896,256,'2024-08-11 22:08:06.000000',4),(897,1958,'2024-08-12 20:56:25.000000',1),(898,898,'2024-08-12 06:39:06.000000',2),(899,1441,'2024-08-12 09:55:18.000000',3),(900,1282,'2024-08-12 08:38:45.000000',4),(901,1396,'2024-08-13 02:58:41.000000',1),(902,970,'2024-08-13 02:46:17.000000',2),(903,1865,'2024-08-13 01:51:21.000000',3),(904,705,'2024-08-13 10:19:02.000000',4),(905,606,'2024-08-14 11:19:38.000000',1),(906,1168,'2024-08-14 02:21:50.000000',2),(907,735,'2024-08-14 14:58:15.000000',3),(908,1452,'2024-08-14 23:10:22.000000',4),(909,958,'2024-08-15 17:32:40.000000',1),(910,1125,'2024-08-15 04:47:23.000000',2),(911,754,'2024-08-15 05:06:17.000000',3),(912,192,'2024-08-15 05:53:02.000000',4),(913,865,'2024-08-16 17:51:18.000000',1),(914,695,'2024-08-16 22:17:17.000000',2),(915,1409,'2024-08-16 22:46:42.000000',3),(916,522,'2024-08-16 16:11:47.000000',4),(917,1238,'2024-08-17 06:43:38.000000',1),(918,811,'2024-08-17 06:03:11.000000',2),(919,262,'2024-08-17 06:27:47.000000',3),(920,1682,'2024-08-17 20:19:13.000000',4),(921,1590,'2024-08-18 15:55:15.000000',1),(922,1071,'2024-08-18 23:36:53.000000',2),(923,35,'2024-08-18 17:23:31.000000',3),(924,1028,'2024-08-18 21:55:02.000000',4),(925,1210,'2024-08-19 19:54:00.000000',1),(926,1725,'2024-08-19 12:50:40.000000',2),(927,1888,'2024-08-19 16:56:56.000000',3),(928,349,'2024-08-19 14:25:44.000000',4),(929,1626,'2024-08-20 01:36:34.000000',1),(930,1756,'2024-08-20 20:43:08.000000',2),(931,724,'2024-08-20 19:10:33.000000',3),(932,1943,'2024-08-20 09:52:15.000000',4),(933,407,'2024-08-21 14:57:53.000000',1),(934,237,'2024-08-21 03:29:40.000000',2),(935,837,'2024-08-21 03:42:40.000000',3),(936,1767,'2024-08-21 15:03:44.000000',4),(937,29,'2024-08-22 12:47:10.000000',1),(938,654,'2024-08-22 11:22:31.000000',2),(939,148,'2024-08-22 05:03:19.000000',3),(940,922,'2024-08-22 17:40:20.000000',4),(941,185,'2024-08-23 02:16:46.000000',1),(942,1220,'2024-08-23 04:15:34.000000',2),(943,1515,'2024-08-23 12:25:03.000000',3),(944,1791,'2024-08-23 05:35:55.000000',4),(945,387,'2024-08-24 18:37:01.000000',1),(946,1231,'2024-08-24 15:20:07.000000',2),(947,1901,'2024-08-24 03:49:15.000000',3),(948,1040,'2024-08-24 06:34:47.000000',4),(949,644,'2024-08-25 18:37:38.000000',1),(950,863,'2024-08-25 06:42:02.000000',2),(951,606,'2024-08-25 07:39:54.000000',3),(952,1740,'2024-08-25 13:19:59.000000',4),(953,1593,'2024-08-26 16:20:36.000000',1),(954,610,'2024-08-26 22:31:46.000000',2),(955,1244,'2024-08-26 16:58:13.000000',3),(956,135,'2024-08-26 23:40:22.000000',4),(957,1369,'2024-08-27 09:03:07.000000',1),(958,784,'2024-08-27 06:55:52.000000',2),(959,577,'2024-08-27 02:13:34.000000',3),(960,1903,'2024-08-27 03:55:04.000000',4),(961,960,'2024-08-28 06:24:08.000000',1),(962,1114,'2024-08-28 14:23:01.000000',2),(963,522,'2024-08-28 23:40:15.000000',3),(964,1891,'2024-08-28 08:17:39.000000',4),(965,1227,'2024-08-29 16:33:18.000000',1),(966,280,'2024-08-29 23:53:51.000000',2),(967,270,'2024-08-29 17:03:27.000000',3),(968,616,'2024-08-29 13:01:08.000000',4),(969,1257,'2024-08-30 21:50:39.000000',1),(970,342,'2024-08-30 09:52:07.000000',2),(971,1187,'2024-08-30 14:54:36.000000',3),(972,1470,'2024-08-30 02:28:12.000000',4),(973,1236,'2024-08-31 08:44:40.000000',1),(974,257,'2024-08-31 23:54:51.000000',2),(975,1760,'2024-08-31 15:40:18.000000',3),(976,1113,'2024-08-31 10:32:14.000000',4),(977,1314,'2024-09-01 11:09:52.000000',1),(978,931,'2024-09-01 21:17:14.000000',2),(979,1867,'2024-09-01 15:58:48.000000',3),(980,1084,'2024-09-01 16:02:15.000000',4),(981,1790,'2024-09-02 16:53:41.000000',1),(982,243,'2024-09-02 08:39:48.000000',2),(983,503,'2024-09-02 12:33:04.000000',3),(984,1368,'2024-09-02 16:30:04.000000',4),(985,1465,'2024-09-03 08:33:48.000000',1),(986,1521,'2024-09-03 14:11:47.000000',2),(987,1714,'2024-09-03 00:39:49.000000',3),(988,876,'2024-09-03 04:50:31.000000',4),(989,1216,'2024-09-04 14:01:26.000000',1),(990,1219,'2024-09-04 06:52:42.000000',2),(991,209,'2024-09-04 04:28:25.000000',3),(992,999,'2024-09-04 23:05:52.000000',4),(993,1088,'2024-09-05 14:35:52.000000',1),(994,1685,'2024-09-05 21:28:32.000000',2),(995,221,'2024-09-05 12:39:32.000000',3),(996,1022,'2024-09-05 23:14:15.000000',4),(997,1429,'2024-09-06 15:34:59.000000',1),(998,1941,'2024-09-06 14:56:27.000000',2),(999,23,'2024-09-06 23:37:45.000000',3),(1000,969,'2024-09-06 02:29:19.000000',4),(1001,188,'2024-09-07 02:37:14.000000',1),(1002,853,'2024-09-07 03:23:47.000000',2),(1003,505,'2024-09-07 16:56:46.000000',3),(1004,1909,'2024-09-07 03:24:41.000000',4),(1005,1732,'2024-09-08 08:18:02.000000',1),(1006,1726,'2024-09-08 07:00:38.000000',2),(1007,1198,'2024-09-08 10:29:48.000000',3),(1008,1219,'2024-09-08 16:20:41.000000',4),(1009,378,'2024-09-09 00:04:47.000000',1),(1010,208,'2024-09-09 22:24:56.000000',2),(1011,536,'2024-09-09 17:10:34.000000',3),(1012,314,'2024-09-09 04:36:29.000000',4),(1013,1132,'2024-09-10 04:58:19.000000',1),(1014,687,'2024-09-10 04:59:47.000000',2),(1015,851,'2024-09-10 02:10:58.000000',3),(1016,1993,'2024-09-10 20:30:31.000000',4),(1017,198,'2024-09-11 10:01:12.000000',1),(1018,1826,'2024-09-11 05:48:15.000000',2),(1019,900,'2024-09-11 20:06:01.000000',3),(1020,664,'2024-09-11 17:40:11.000000',4),(1021,519,'2024-09-12 10:49:31.000000',1),(1022,1884,'2024-09-12 22:39:19.000000',2),(1023,1110,'2024-09-12 21:01:15.000000',3),(1024,131,'2024-09-12 03:29:58.000000',4),(1025,488,'2024-09-13 21:18:22.000000',1),(1026,89,'2024-09-13 13:19:19.000000',2),(1027,1303,'2024-09-13 13:21:55.000000',3),(1028,1945,'2024-09-13 14:02:38.000000',4),(1029,1228,'2024-09-14 02:32:46.000000',1),(1030,1812,'2024-09-14 17:58:57.000000',2),(1031,1380,'2024-09-14 06:45:17.000000',3),(1032,1903,'2024-09-14 14:29:54.000000',4),(1033,1741,'2024-09-15 22:40:45.000000',1),(1034,1952,'2024-09-15 12:25:09.000000',2),(1035,1418,'2024-09-15 07:51:15.000000',3),(1036,1357,'2024-09-15 13:27:28.000000',4),(1037,1019,'2024-09-16 17:00:33.000000',1),(1038,1136,'2024-09-16 10:03:21.000000',2),(1039,419,'2024-09-16 13:58:54.000000',3),(1040,1725,'2024-09-16 07:09:01.000000',4),(1041,1002,'2024-09-17 10:01:16.000000',1),(1042,1515,'2024-09-17 06:02:57.000000',2),(1043,1767,'2024-09-17 00:44:51.000000',3),(1044,1934,'2024-09-17 07:45:35.000000',4),(1045,829,'2024-09-18 20:42:26.000000',1),(1046,349,'2024-09-18 11:36:14.000000',2),(1047,1167,'2024-09-18 10:06:41.000000',3),(1048,1034,'2024-09-18 15:41:01.000000',4),(1049,1142,'2024-09-19 14:59:04.000000',1),(1050,390,'2024-09-19 23:33:17.000000',2),(1051,1118,'2024-09-19 00:40:57.000000',3),(1052,1723,'2024-09-19 16:58:34.000000',4),(1053,668,'2024-09-20 04:24:08.000000',1),(1054,1189,'2024-09-20 02:51:34.000000',2),(1055,565,'2024-09-20 14:42:35.000000',3),(1056,37,'2024-09-20 13:45:09.000000',4),(1057,1606,'2024-09-21 08:54:45.000000',1),(1058,172,'2024-09-21 21:34:01.000000',2),(1059,805,'2024-09-21 17:33:42.000000',3),(1060,1741,'2024-09-21 19:34:05.000000',4),(1061,1837,'2024-09-22 21:44:26.000000',1),(1062,1225,'2024-09-22 20:57:35.000000',2),(1063,732,'2024-09-22 10:34:05.000000',3),(1064,874,'2024-09-22 12:09:37.000000',4),(1065,18,'2024-09-23 15:55:51.000000',1),(1066,467,'2024-09-23 01:14:40.000000',2),(1067,712,'2024-09-23 00:16:05.000000',3),(1068,1322,'2024-09-23 17:53:47.000000',4),(1069,710,'2024-09-24 01:37:09.000000',1),(1070,1580,'2024-09-24 13:41:55.000000',2),(1071,1637,'2024-09-24 05:42:09.000000',3),(1072,867,'2024-09-24 09:03:38.000000',4),(1073,1745,'2024-09-25 00:49:42.000000',1),(1074,1348,'2024-09-25 06:11:41.000000',2),(1075,1894,'2024-09-25 14:14:37.000000',3),(1076,1853,'2024-09-25 22:52:48.000000',4),(1077,162,'2024-09-26 18:31:42.000000',1),(1078,398,'2024-09-26 02:07:03.000000',2),(1079,93,'2024-09-26 17:28:55.000000',3),(1080,181,'2024-09-26 01:05:58.000000',4),(1081,606,'2024-09-27 07:33:20.000000',1),(1082,1876,'2024-09-27 13:39:38.000000',2),(1083,187,'2024-09-27 23:33:03.000000',3),(1084,659,'2024-09-27 12:31:14.000000',4),(1085,833,'2024-09-28 01:56:12.000000',1),(1086,1884,'2024-09-28 20:06:39.000000',2),(1087,299,'2024-09-28 04:40:35.000000',3),(1088,713,'2024-09-28 03:51:22.000000',4),(1089,854,'2024-09-29 07:10:44.000000',1),(1090,1813,'2024-09-29 05:41:50.000000',2),(1091,747,'2024-09-29 19:38:17.000000',3),(1092,1866,'2024-09-29 09:51:00.000000',4),(1093,739,'2024-09-30 10:24:22.000000',1),(1094,1232,'2024-09-30 13:04:15.000000',2),(1095,759,'2024-09-30 10:41:19.000000',3),(1096,1329,'2024-09-30 13:27:01.000000',4),(1097,414,'2024-10-01 15:21:31.000000',1),(1098,1909,'2024-10-01 02:45:41.000000',2),(1099,541,'2024-10-01 10:14:22.000000',3),(1100,1087,'2024-10-01 01:41:47.000000',4),(1101,1774,'2024-10-02 12:04:37.000000',1),(1102,1928,'2024-10-02 22:11:49.000000',2),(1103,656,'2024-10-02 01:02:59.000000',3),(1104,1106,'2024-10-02 12:10:19.000000',4),(1105,1109,'2024-10-03 05:49:19.000000',1),(1106,1119,'2024-10-03 01:04:10.000000',2),(1107,1278,'2024-10-03 15:55:18.000000',3),(1108,204,'2024-10-03 04:53:12.000000',4),(1109,370,'2024-10-04 21:33:09.000000',1),(1110,1191,'2024-10-04 05:31:02.000000',2),(1111,1288,'2024-10-04 06:51:34.000000',3),(1112,1753,'2024-10-04 08:40:36.000000',4),(1113,1710,'2024-10-05 07:07:18.000000',1),(1114,715,'2024-10-05 09:13:29.000000',2),(1115,181,'2024-10-05 15:10:29.000000',3),(1116,1001,'2024-10-05 13:18:03.000000',4),(1117,1392,'2024-10-06 20:08:45.000000',1),(1118,1435,'2024-10-06 23:03:43.000000',2),(1119,726,'2024-10-06 16:52:05.000000',3),(1120,880,'2024-10-06 16:56:04.000000',4),(1121,172,'2024-10-07 01:56:29.000000',1),(1122,1352,'2024-10-07 04:28:53.000000',2),(1123,141,'2024-10-07 19:40:17.000000',3),(1124,507,'2024-10-07 21:25:44.000000',4),(1125,359,'2024-10-08 14:06:24.000000',1),(1126,246,'2024-10-08 03:09:59.000000',2),(1127,1434,'2024-10-08 05:12:14.000000',3),(1128,1026,'2024-10-08 22:22:48.000000',4),(1129,584,'2024-10-09 18:22:58.000000',1),(1130,1856,'2024-10-09 03:51:09.000000',2),(1131,2000,'2024-10-09 03:45:21.000000',3),(1132,1289,'2024-10-09 12:41:14.000000',4),(1133,491,'2024-10-10 15:15:21.000000',1),(1134,1728,'2024-10-10 07:40:48.000000',2),(1135,407,'2024-10-10 08:36:55.000000',3),(1136,184,'2024-10-10 22:34:14.000000',4),(1137,1827,'2024-10-11 15:18:16.000000',1),(1138,1044,'2024-10-11 15:39:12.000000',2),(1139,1399,'2024-10-11 15:40:21.000000',3),(1140,1180,'2024-10-11 12:54:03.000000',4),(1141,1822,'2024-10-12 08:03:44.000000',1),(1142,1987,'2024-10-12 13:04:43.000000',2),(1143,1347,'2024-10-12 07:55:57.000000',3),(1144,1714,'2024-10-12 09:00:37.000000',4),(1145,445,'2024-10-13 03:48:23.000000',1),(1146,1014,'2024-10-13 15:13:51.000000',2),(1147,1263,'2024-10-13 15:07:42.000000',3),(1148,864,'2024-10-13 06:21:45.000000',4),(1149,1049,'2024-10-14 08:44:05.000000',1),(1150,146,'2024-10-14 12:41:51.000000',2),(1151,1332,'2024-10-14 18:38:35.000000',3),(1152,1982,'2024-10-14 23:56:19.000000',4),(1153,1661,'2024-10-15 23:03:01.000000',1),(1154,1729,'2024-10-15 06:30:23.000000',2),(1155,1888,'2024-10-15 12:10:23.000000',3),(1156,309,'2024-10-15 04:43:47.000000',4),(1157,870,'2024-10-16 04:18:25.000000',1),(1158,1753,'2024-10-16 15:16:06.000000',2),(1159,1466,'2024-10-16 11:20:02.000000',3),(1160,75,'2024-10-16 05:55:53.000000',4),(1161,231,'2024-10-17 10:41:25.000000',1),(1162,1699,'2024-10-17 05:44:02.000000',2),(1163,209,'2024-10-17 12:43:52.000000',3),(1164,664,'2024-10-17 22:17:24.000000',4),(1165,732,'2024-10-18 20:55:56.000000',1),(1166,1931,'2024-10-18 05:06:02.000000',2),(1167,95,'2024-10-18 04:31:30.000000',3),(1168,414,'2024-10-18 16:04:14.000000',4),(1169,1016,'2024-10-19 00:37:03.000000',1),(1170,1577,'2024-10-19 11:05:50.000000',2),(1171,809,'2024-10-19 13:17:27.000000',3),(1172,1179,'2024-10-19 08:39:08.000000',4),(1173,1121,'2024-10-20 20:46:35.000000',1),(1174,675,'2024-10-20 04:52:59.000000',2),(1175,725,'2024-10-20 01:47:28.000000',3),(1176,1697,'2024-10-20 14:05:09.000000',4),(1177,1709,'2024-10-21 11:30:45.000000',1),(1178,1195,'2024-10-21 19:57:58.000000',2),(1179,1312,'2024-10-21 11:44:41.000000',3),(1180,172,'2024-10-21 19:27:15.000000',4),(1181,1456,'2024-10-22 23:55:44.000000',1),(1182,118,'2024-10-22 15:33:47.000000',2),(1183,1124,'2024-10-22 08:20:22.000000',3),(1184,291,'2024-10-22 18:23:06.000000',4),(1185,1405,'2024-10-23 10:15:34.000000',1),(1186,65,'2024-10-23 05:27:54.000000',2),(1187,597,'2024-10-23 11:30:00.000000',3),(1188,759,'2024-10-23 01:19:04.000000',4),(1189,1034,'2024-10-24 17:32:19.000000',1),(1190,807,'2024-10-24 09:22:32.000000',2),(1191,33,'2024-10-24 20:17:19.000000',3),(1192,1362,'2024-10-24 13:06:19.000000',4),(1193,1582,'2024-10-25 18:24:06.000000',1),(1194,1792,'2024-10-25 15:41:14.000000',2),(1195,1811,'2024-10-25 12:26:41.000000',3),(1196,265,'2024-10-25 23:16:02.000000',4),(1197,738,'2024-10-26 18:04:28.000000',1),(1198,1626,'2024-10-26 14:00:36.000000',2),(1199,258,'2024-10-26 07:31:27.000000',3),(1200,257,'2024-10-26 16:52:06.000000',4),(1201,557,'2024-10-27 12:46:59.000000',1),(1202,273,'2024-10-27 19:03:44.000000',2),(1203,157,'2024-10-27 07:08:04.000000',3),(1204,530,'2024-10-27 11:59:55.000000',4),(1205,648,'2024-10-28 19:45:56.000000',1),(1206,1541,'2024-10-28 03:33:35.000000',2),(1207,1440,'2024-10-28 09:44:48.000000',3),(1208,1493,'2024-10-28 09:08:51.000000',4),(1209,1393,'2024-10-29 14:05:04.000000',1),(1210,1024,'2024-10-29 17:16:47.000000',2),(1211,912,'2024-10-29 09:33:20.000000',3),(1212,114,'2024-10-29 02:02:13.000000',4),(1213,1952,'2024-10-30 00:42:07.000000',1),(1214,65,'2024-10-30 19:00:31.000000',2),(1215,1660,'2024-10-30 18:50:48.000000',3),(1216,944,'2024-10-30 19:00:36.000000',4),(1217,992,'2024-10-31 23:34:23.000000',1),(1218,357,'2024-10-31 12:47:50.000000',2),(1219,1845,'2024-10-31 06:59:30.000000',3),(1220,1831,'2024-10-31 17:40:11.000000',4),(1221,176,'2024-11-01 08:47:56.000000',1),(1222,870,'2024-11-01 08:09:07.000000',2),(1223,934,'2024-11-01 03:41:53.000000',3),(1224,1908,'2024-11-01 20:53:45.000000',4),(1225,1837,'2024-11-02 03:44:22.000000',1),(1226,1735,'2024-11-02 02:59:17.000000',2),(1227,430,'2024-11-02 23:07:16.000000',3),(1228,549,'2024-11-02 04:24:28.000000',4),(1229,548,'2024-11-03 19:39:36.000000',1),(1230,1470,'2024-11-03 21:52:10.000000',2),(1231,1000,'2024-11-03 22:34:50.000000',3),(1232,1757,'2024-11-03 16:12:31.000000',4),(1233,373,'2024-11-04 08:44:16.000000',1),(1234,1276,'2024-11-04 20:08:38.000000',2),(1235,880,'2024-11-04 16:05:37.000000',3),(1236,1232,'2024-11-04 04:29:11.000000',4),(1237,1475,'2024-11-05 12:24:07.000000',1),(1238,936,'2024-11-05 03:15:41.000000',2),(1239,505,'2024-11-05 22:20:50.000000',3),(1240,1173,'2024-11-05 11:14:55.000000',4),(1241,1733,'2024-11-06 12:35:55.000000',1),(1242,360,'2024-11-06 18:08:07.000000',2),(1243,1248,'2024-11-06 15:11:05.000000',3),(1244,463,'2024-11-06 05:17:29.000000',4),(1245,1561,'2024-11-07 11:52:26.000000',1),(1246,1481,'2024-11-07 09:59:09.000000',2),(1247,86,'2024-11-07 10:51:49.000000',3),(1248,302,'2024-11-07 20:32:19.000000',4),(1249,955,'2024-11-08 04:27:40.000000',1),(1250,1434,'2024-11-08 19:54:56.000000',2),(1251,636,'2024-11-08 02:14:43.000000',3),(1252,1186,'2024-11-08 07:25:24.000000',4),(1253,793,'2024-11-09 00:50:08.000000',1),(1254,401,'2024-11-09 21:04:10.000000',2),(1255,467,'2024-11-09 08:48:00.000000',3),(1256,1258,'2024-11-09 01:34:33.000000',4),(1257,1703,'2024-11-10 22:44:31.000000',1),(1258,1025,'2024-11-10 09:55:00.000000',2),(1259,150,'2024-11-10 07:44:16.000000',3),(1260,1622,'2024-11-10 09:46:09.000000',4),(1261,1459,'2024-11-11 19:58:26.000000',1),(1262,1119,'2024-11-11 03:35:08.000000',2),(1263,128,'2024-11-11 08:21:32.000000',3),(1264,348,'2024-11-11 06:32:58.000000',4),(1265,1462,'2024-11-12 01:12:43.000000',1),(1266,648,'2024-11-12 12:04:50.000000',2),(1267,1150,'2024-11-12 02:37:24.000000',3),(1268,17,'2024-11-12 13:07:10.000000',4),(1269,1974,'2024-11-13 09:39:32.000000',1),(1270,1348,'2024-11-13 17:26:41.000000',2),(1271,1842,'2024-11-13 04:31:19.000000',3),(1272,859,'2024-11-13 00:55:04.000000',4),(1273,1735,'2024-11-14 00:44:28.000000',1),(1274,1223,'2024-11-14 05:49:13.000000',2),(1275,1631,'2024-11-14 07:55:05.000000',3),(1276,1969,'2024-11-14 02:03:43.000000',4),(1277,727,'2024-11-15 15:54:53.000000',1),(1278,82,'2024-11-15 19:49:30.000000',2),(1279,1023,'2024-11-15 17:26:37.000000',3),(1280,686,'2024-11-15 09:00:21.000000',4),(1281,1827,'2024-11-16 14:07:17.000000',1),(1282,542,'2024-11-16 19:15:13.000000',2),(1283,1846,'2024-11-16 22:43:41.000000',3),(1284,194,'2024-11-16 18:33:08.000000',4),(1285,1062,'2024-11-17 03:56:24.000000',1),(1286,437,'2024-11-17 03:53:37.000000',2),(1287,741,'2024-11-17 14:31:16.000000',3),(1288,137,'2024-11-17 00:51:27.000000',4),(1289,1927,'2024-11-18 05:36:16.000000',1),(1290,1375,'2024-11-18 02:46:06.000000',2),(1291,778,'2024-11-18 02:09:40.000000',3),(1292,397,'2024-11-18 16:08:47.000000',4),(1293,535,'2024-11-19 23:20:07.000000',1),(1294,586,'2024-11-19 10:03:10.000000',2),(1295,321,'2024-11-19 04:59:15.000000',3),(1296,825,'2024-11-19 04:17:24.000000',4),(1297,785,'2024-11-20 12:37:19.000000',1),(1298,1484,'2024-11-20 09:12:38.000000',2),(1299,1133,'2024-11-20 13:24:09.000000',3),(1300,167,'2024-11-20 03:45:22.000000',4),(1301,976,'2024-11-21 22:44:35.000000',1),(1302,1038,'2024-11-21 14:18:52.000000',2),(1303,925,'2024-11-21 19:17:11.000000',3),(1304,233,'2024-11-21 21:36:53.000000',4),(1305,97,'2024-11-22 21:06:16.000000',1),(1306,1733,'2024-11-22 14:27:00.000000',2),(1307,58,'2024-11-22 12:36:50.000000',3),(1308,1501,'2024-11-22 13:36:54.000000',4),(1309,1984,'2024-11-23 01:09:39.000000',1),(1310,185,'2024-11-23 19:31:29.000000',2),(1311,1663,'2024-11-23 00:31:16.000000',3),(1312,1921,'2024-11-23 02:10:43.000000',4),(1313,1532,'2024-11-24 12:42:12.000000',1),(1314,1807,'2024-11-24 05:45:31.000000',2),(1315,535,'2024-11-24 19:05:06.000000',3),(1316,1894,'2024-11-24 22:47:19.000000',4),(1317,1162,'2024-11-25 21:13:04.000000',1),(1318,1033,'2024-11-25 06:02:28.000000',2),(1319,1163,'2024-11-25 19:49:28.000000',3),(1320,802,'2024-11-25 10:17:49.000000',4),(1321,771,'2024-11-26 17:13:24.000000',1),(1322,1426,'2024-11-26 18:34:12.000000',2),(1323,149,'2024-11-26 05:49:13.000000',3),(1324,1996,'2024-11-26 15:27:31.000000',4),(1325,570,'2024-11-27 01:19:56.000000',1),(1326,868,'2024-11-27 06:11:00.000000',2),(1327,1356,'2024-11-27 09:29:53.000000',3),(1328,1940,'2024-11-27 04:48:43.000000',4),(1329,660,'2024-11-28 05:56:52.000000',1),(1330,1065,'2024-11-28 21:42:00.000000',2),(1331,295,'2024-11-28 22:46:14.000000',3),(1332,11,'2024-11-28 21:20:39.000000',4),(1333,1554,'2024-11-29 08:36:14.000000',1),(1334,1416,'2024-11-29 19:22:49.000000',2),(1335,917,'2024-11-29 02:47:28.000000',3),(1336,671,'2024-11-29 22:36:28.000000',4),(1337,501,'2024-11-30 20:25:56.000000',1),(1338,1475,'2024-11-30 16:44:34.000000',2),(1339,1505,'2024-11-30 14:13:33.000000',3),(1340,1323,'2024-11-30 23:36:26.000000',4),(1341,1578,'2024-12-01 08:30:23.000000',1),(1342,83,'2024-12-01 21:09:34.000000',2),(1343,1366,'2024-12-01 13:28:18.000000',3),(1344,1207,'2024-12-01 17:31:43.000000',4),(1345,631,'2024-12-02 19:47:58.000000',1),(1346,1122,'2024-12-02 02:25:52.000000',2),(1347,1635,'2024-12-02 11:59:51.000000',3),(1348,961,'2024-12-02 14:04:27.000000',4),(1349,1549,'2024-12-03 15:26:06.000000',1),(1350,772,'2024-12-03 22:35:56.000000',2),(1351,714,'2024-12-03 02:27:52.000000',3),(1352,625,'2024-12-03 11:26:16.000000',4),(1353,1436,'2024-12-04 03:08:22.000000',1),(1354,1656,'2024-12-04 04:42:30.000000',2),(1355,537,'2024-12-04 13:12:23.000000',3),(1356,1287,'2024-12-04 16:32:52.000000',4),(1357,1620,'2024-12-05 03:33:04.000000',1),(1358,1201,'2024-12-05 14:32:39.000000',2),(1359,225,'2024-12-05 04:22:48.000000',3),(1360,1463,'2024-12-05 00:19:30.000000',4),(1361,1762,'2024-12-06 14:45:15.000000',1),(1362,303,'2024-12-06 13:24:21.000000',2),(1363,1895,'2024-12-06 01:55:23.000000',3),(1364,1271,'2024-12-06 11:53:16.000000',4),(1365,1090,'2024-12-07 16:33:45.000000',1),(1366,1271,'2024-12-07 15:41:45.000000',2),(1367,338,'2024-12-07 05:09:38.000000',3),(1368,983,'2024-12-07 04:47:28.000000',4),(1369,1631,'2024-12-08 20:35:18.000000',1),(1370,134,'2024-12-08 12:03:31.000000',2),(1371,1860,'2024-12-08 19:49:20.000000',3),(1372,128,'2024-12-08 04:05:38.000000',4),(1373,1694,'2024-12-09 19:23:02.000000',1),(1374,1025,'2024-12-09 19:27:00.000000',2),(1375,218,'2024-12-09 03:05:48.000000',3),(1376,924,'2024-12-09 03:47:12.000000',4),(1377,1594,'2024-12-10 20:04:40.000000',1),(1378,1969,'2024-12-10 11:24:01.000000',2),(1379,1056,'2024-12-10 11:54:19.000000',3),(1380,334,'2024-12-10 03:35:53.000000',4),(1381,841,'2024-12-11 09:13:10.000000',1),(1382,973,'2024-12-11 22:47:14.000000',2),(1383,910,'2024-12-11 13:59:08.000000',3),(1384,538,'2024-12-11 12:38:30.000000',4),(1385,23,'2024-12-12 18:19:30.000000',1),(1386,1598,'2024-12-12 18:23:57.000000',2),(1387,150,'2024-12-12 16:39:38.000000',3),(1388,454,'2024-12-12 06:57:40.000000',4),(1389,1273,'2024-12-13 06:19:09.000000',1),(1390,104,'2024-12-13 09:24:48.000000',2),(1391,515,'2024-12-13 01:58:54.000000',3),(1392,845,'2024-12-13 00:55:55.000000',4),(1393,1414,'2024-12-14 23:52:21.000000',1),(1394,1257,'2024-12-14 13:11:32.000000',2),(1395,1149,'2024-12-14 11:48:10.000000',3),(1396,521,'2024-12-14 09:31:18.000000',4),(1397,1559,'2024-12-15 02:41:27.000000',1),(1398,922,'2024-12-15 13:25:55.000000',2),(1399,1482,'2024-12-15 14:59:28.000000',3),(1400,1864,'2024-12-15 19:56:33.000000',4),(1401,72,'2024-12-16 03:59:18.000000',1),(1402,578,'2024-12-16 16:17:51.000000',2),(1403,335,'2024-12-16 09:45:41.000000',3),(1404,1159,'2024-12-16 14:47:22.000000',4),(1405,1002,'2024-12-17 01:08:47.000000',1),(1406,611,'2024-12-17 08:40:41.000000',2),(1407,573,'2024-12-17 10:33:59.000000',3),(1408,1390,'2024-12-17 02:39:31.000000',4),(1409,1255,'2024-12-18 03:25:05.000000',1),(1410,1328,'2024-12-18 17:01:09.000000',2),(1411,1934,'2024-12-18 04:35:59.000000',3),(1412,794,'2024-12-18 06:13:34.000000',4),(1413,1664,'2024-12-19 04:54:04.000000',1),(1414,464,'2024-12-19 13:05:10.000000',2),(1415,1830,'2024-12-19 12:31:31.000000',3),(1416,598,'2024-12-19 00:12:28.000000',4),(1417,885,'2024-12-20 11:13:25.000000',1),(1418,1422,'2024-12-20 19:22:39.000000',2),(1419,1053,'2024-12-20 03:09:37.000000',3),(1420,1199,'2024-12-20 05:39:03.000000',4),(1421,1293,'2024-12-21 06:55:36.000000',1),(1422,1769,'2024-12-21 08:44:56.000000',2),(1423,1980,'2024-12-21 07:53:17.000000',3),(1424,1700,'2024-12-21 23:08:02.000000',4),(1425,467,'2024-12-22 08:33:13.000000',1),(1426,1567,'2024-12-22 02:19:02.000000',2),(1427,1569,'2024-12-22 15:02:36.000000',3),(1428,1699,'2024-12-22 00:58:06.000000',4),(1429,159,'2024-12-23 03:00:33.000000',1),(1430,1719,'2024-12-23 00:27:45.000000',2),(1431,1222,'2024-12-23 05:42:13.000000',3),(1432,1754,'2024-12-23 08:12:22.000000',4),(1433,318,'2024-12-24 08:35:10.000000',1),(1434,249,'2024-12-24 17:16:55.000000',2),(1435,1873,'2024-12-24 11:05:07.000000',3),(1436,1335,'2024-12-24 07:04:57.000000',4),(1437,499,'2024-12-25 10:48:08.000000',1),(1438,1463,'2024-12-25 21:29:56.000000',2),(1439,1305,'2024-12-25 23:15:41.000000',3),(1440,1620,'2024-12-25 08:28:46.000000',4),(1441,1039,'2024-12-26 23:45:25.000000',1),(1442,1162,'2024-12-26 15:04:06.000000',2),(1443,719,'2024-12-26 00:29:17.000000',3),(1444,1203,'2024-12-26 17:39:35.000000',4),(1445,371,'2024-12-27 19:08:37.000000',1),(1446,220,'2024-12-27 12:47:34.000000',2),(1447,831,'2024-12-27 22:46:13.000000',3),(1448,1803,'2024-12-27 05:30:12.000000',4),(1449,772,'2024-12-28 19:37:45.000000',1),(1450,445,'2024-12-28 11:25:28.000000',2),(1451,1502,'2024-12-28 16:24:20.000000',3),(1452,532,'2024-12-28 16:53:15.000000',4),(1453,579,'2024-12-29 05:12:53.000000',1),(1454,218,'2024-12-29 19:05:25.000000',2),(1455,925,'2024-12-29 03:47:09.000000',3),(1456,1610,'2024-12-29 20:07:10.000000',4),(1457,255,'2024-12-30 12:11:48.000000',1),(1458,348,'2024-12-30 02:39:52.000000',2),(1459,314,'2024-12-30 12:51:11.000000',3),(1460,824,'2024-12-30 04:13:55.000000',4),(1461,833,'2024-12-31 12:43:40.000000',1),(1462,397,'2024-12-31 11:44:30.000000',2),(1463,39,'2024-12-31 12:32:41.000000',3),(1464,1167,'2024-12-31 12:40:35.000000',4),(1465,1815,'2025-01-01 07:57:04.000000',1),(1466,1969,'2025-01-01 12:59:09.000000',2),(1467,1083,'2025-01-01 07:10:24.000000',3),(1468,846,'2025-01-01 19:25:25.000000',4),(1469,332,'2025-01-02 16:29:16.000000',1),(1470,694,'2025-01-02 18:27:20.000000',2),(1471,196,'2025-01-02 10:15:58.000000',3),(1472,1479,'2025-01-02 04:57:34.000000',4),(1473,330,'2025-01-03 01:50:09.000000',1),(1474,949,'2025-01-03 14:14:49.000000',2),(1475,1059,'2025-01-03 14:10:13.000000',3),(1476,1581,'2025-01-03 21:00:58.000000',4),(1477,498,'2025-01-04 07:46:24.000000',1),(1478,1236,'2025-01-04 06:32:55.000000',2),(1479,989,'2025-01-04 06:27:56.000000',3),(1480,1664,'2025-01-04 15:54:31.000000',4),(1481,709,'2025-01-05 04:04:34.000000',1),(1482,488,'2025-01-05 06:16:06.000000',2),(1483,879,'2025-01-05 10:24:53.000000',3),(1484,309,'2025-01-05 21:27:58.000000',4),(1485,1960,'2025-01-06 02:07:33.000000',1),(1486,454,'2025-01-06 15:11:53.000000',2),(1487,986,'2025-01-06 05:37:59.000000',3),(1488,645,'2025-01-06 18:14:41.000000',4),(1489,1381,'2025-01-07 07:57:19.000000',1),(1490,422,'2025-01-07 10:56:55.000000',2),(1491,1582,'2025-01-07 16:25:42.000000',3),(1492,258,'2025-01-07 21:36:14.000000',4),(1493,653,'2025-01-08 22:37:01.000000',1),(1494,80,'2025-01-08 19:17:13.000000',2),(1495,1639,'2025-01-08 18:54:12.000000',3),(1496,411,'2025-01-08 17:34:50.000000',4),(1497,1061,'2025-01-09 19:54:04.000000',1),(1498,445,'2025-01-09 03:54:01.000000',2),(1499,914,'2025-01-09 14:59:42.000000',3),(1500,1346,'2025-01-09 09:48:16.000000',4),(1501,1351,'2025-01-10 03:19:51.000000',1),(1502,1551,'2025-01-10 23:02:41.000000',2),(1503,1297,'2025-01-10 23:52:20.000000',3),(1504,682,'2025-01-10 06:10:12.000000',4),(1505,1281,'2025-01-11 22:22:47.000000',1),(1506,196,'2025-01-11 09:41:22.000000',2),(1507,198,'2025-01-11 06:40:59.000000',3),(1508,1982,'2025-01-11 15:46:30.000000',4),(1509,1879,'2025-01-12 23:34:34.000000',1),(1510,1855,'2025-01-12 17:58:28.000000',2),(1511,325,'2025-01-12 09:19:44.000000',3),(1512,1478,'2025-01-12 15:28:58.000000',4),(1513,1157,'2025-01-13 18:12:50.000000',1),(1514,666,'2025-01-13 14:43:15.000000',2),(1515,241,'2025-01-13 19:46:12.000000',3),(1516,587,'2025-01-13 03:08:34.000000',4),(1517,984,'2025-01-14 01:47:11.000000',1),(1518,1407,'2025-01-14 05:39:25.000000',2),(1519,1868,'2025-01-14 19:24:23.000000',3),(1520,819,'2025-01-14 05:48:31.000000',4),(1521,756,'2025-01-15 07:42:31.000000',1),(1522,979,'2025-01-15 22:11:07.000000',2),(1523,1793,'2025-01-15 16:08:44.000000',3),(1524,1248,'2025-01-15 11:05:51.000000',4),(1525,1568,'2025-01-16 17:32:33.000000',1),(1526,561,'2025-01-16 17:25:53.000000',2),(1527,536,'2025-01-16 05:19:04.000000',3),(1528,1127,'2025-01-16 16:09:23.000000',4),(1529,586,'2025-01-17 19:06:51.000000',1),(1530,979,'2025-01-17 01:45:35.000000',2),(1531,1321,'2025-01-17 05:24:41.000000',3),(1532,281,'2025-01-17 14:58:44.000000',4),(1533,1450,'2025-01-18 19:53:53.000000',1),(1534,1010,'2025-01-18 03:15:23.000000',2),(1535,135,'2025-01-18 02:47:28.000000',3),(1536,1481,'2025-01-18 23:43:30.000000',4),(1537,916,'2025-01-19 17:39:22.000000',1),(1538,65,'2025-01-19 01:56:40.000000',2),(1539,990,'2025-01-19 22:02:18.000000',3),(1540,212,'2025-01-19 17:13:48.000000',4),(1541,1126,'2025-01-20 09:01:40.000000',1),(1542,1481,'2025-01-20 16:27:28.000000',2),(1543,1997,'2025-01-20 15:27:04.000000',3),(1544,615,'2025-01-20 01:27:08.000000',4),(1545,1711,'2025-01-21 08:31:50.000000',1),(1546,960,'2025-01-21 05:00:55.000000',2),(1547,837,'2025-01-21 18:30:56.000000',3),(1548,1265,'2025-01-21 18:39:34.000000',4),(1549,494,'2025-01-22 19:53:23.000000',1),(1550,6,'2025-01-22 17:58:13.000000',2),(1551,1663,'2025-01-22 18:25:50.000000',3),(1552,1535,'2025-01-22 20:27:03.000000',4),(1553,187,'2025-01-23 06:41:32.000000',1),(1554,1732,'2025-01-23 15:05:48.000000',2),(1555,1226,'2025-01-23 10:36:28.000000',3),(1556,1691,'2025-01-23 17:40:41.000000',4),(1557,1102,'2025-01-24 00:25:02.000000',1),(1558,1707,'2025-01-24 16:49:27.000000',2),(1559,509,'2025-01-24 03:54:21.000000',3),(1560,305,'2025-01-24 18:47:34.000000',4),(1561,1217,'2025-01-25 09:54:49.000000',1),(1562,363,'2025-01-25 19:13:35.000000',2),(1563,1945,'2025-01-25 12:04:38.000000',3),(1564,1681,'2025-01-25 08:25:56.000000',4),(1565,427,'2025-01-26 03:31:15.000000',1),(1566,974,'2025-01-26 15:00:13.000000',2),(1567,657,'2025-01-26 13:22:56.000000',3),(1568,1711,'2025-01-26 23:13:46.000000',4),(1569,588,'2025-01-27 08:55:23.000000',1),(1570,1769,'2025-01-27 08:28:22.000000',2),(1571,311,'2025-01-27 08:40:32.000000',3),(1572,1979,'2025-01-27 16:34:55.000000',4),(1573,806,'2025-01-28 20:58:49.000000',1),(1574,1496,'2025-01-28 09:23:21.000000',2),(1575,1169,'2025-01-28 13:34:20.000000',3),(1576,734,'2025-01-28 05:22:15.000000',4),(1577,1423,'2025-01-29 03:53:44.000000',1),(1578,433,'2025-01-29 01:40:55.000000',2),(1579,1410,'2025-01-29 20:53:46.000000',3),(1580,892,'2025-01-29 21:53:18.000000',4),(1581,250,'2025-01-30 11:49:04.000000',1),(1582,726,'2025-01-30 03:32:27.000000',2),(1583,1539,'2025-01-30 08:55:06.000000',3),(1584,710,'2025-01-30 17:34:58.000000',4),(1585,1625,'2025-01-31 13:48:23.000000',1),(1586,492,'2025-01-31 08:04:41.000000',2),(1587,706,'2025-01-31 05:13:39.000000',3),(1588,977,'2025-01-31 02:37:09.000000',4),(1589,205,'2025-02-01 02:43:07.000000',1),(1590,1090,'2025-02-01 04:05:01.000000',2),(1591,865,'2025-02-01 05:07:13.000000',3),(1592,629,'2025-02-01 12:32:09.000000',4),(1593,157,'2025-02-02 00:06:00.000000',1),(1594,1315,'2025-02-02 09:04:45.000000',2),(1595,1561,'2025-02-02 03:36:21.000000',3),(1596,1819,'2025-02-02 10:47:55.000000',4),(1597,513,'2025-02-03 04:43:29.000000',1),(1598,1372,'2025-02-03 16:34:55.000000',2),(1599,1443,'2025-02-03 08:32:11.000000',3),(1600,1070,'2025-02-03 12:57:13.000000',4),(1601,1332,'2025-02-04 01:17:34.000000',1),(1602,1667,'2025-02-04 03:58:55.000000',2),(1603,1678,'2025-02-04 16:01:18.000000',3),(1604,875,'2025-02-04 04:34:33.000000',4),(1605,1522,'2025-02-05 14:44:57.000000',1),(1606,1040,'2025-02-05 23:03:01.000000',2),(1607,55,'2025-02-05 17:12:55.000000',3),(1608,1686,'2025-02-05 23:38:22.000000',4),(1609,1532,'2025-02-06 06:12:43.000000',1),(1610,1936,'2025-02-06 01:16:25.000000',2),(1611,982,'2025-02-06 16:17:24.000000',3),(1612,1242,'2025-02-06 10:02:55.000000',4),(1613,742,'2025-02-07 20:18:53.000000',1),(1614,919,'2025-02-07 07:32:35.000000',2),(1615,781,'2025-02-07 08:29:11.000000',3),(1616,558,'2025-02-07 21:21:26.000000',4),(1617,1580,'2025-02-08 17:24:28.000000',1),(1618,985,'2025-02-08 18:32:05.000000',2),(1619,501,'2025-02-08 03:29:37.000000',3),(1620,651,'2025-02-08 19:34:05.000000',4),(1621,1861,'2025-02-09 04:21:05.000000',1),(1622,1489,'2025-02-09 02:33:59.000000',2),(1623,1535,'2025-02-09 09:35:57.000000',3),(1624,1766,'2025-02-09 15:17:14.000000',4),(1625,1732,'2025-02-10 12:04:05.000000',1),(1626,1016,'2025-02-10 19:42:27.000000',2),(1627,1716,'2025-02-10 01:49:57.000000',3),(1628,1458,'2025-02-10 01:27:08.000000',4),(1629,253,'2025-02-11 11:06:00.000000',1),(1630,1674,'2025-02-11 05:49:58.000000',2),(1631,1532,'2025-02-11 10:55:32.000000',3),(1632,28,'2025-02-11 11:05:19.000000',4),(1633,734,'2025-02-12 16:21:16.000000',1),(1634,1692,'2025-02-12 18:56:25.000000',2),(1635,1541,'2025-02-12 20:40:37.000000',3),(1636,46,'2025-02-12 06:24:06.000000',4),(1637,1004,'2025-02-13 07:32:19.000000',1),(1638,664,'2025-02-13 13:37:16.000000',2),(1639,1574,'2025-02-13 22:57:21.000000',3),(1640,1933,'2025-02-13 01:34:11.000000',4),(1641,548,'2025-02-14 15:13:30.000000',1),(1642,1005,'2025-02-14 11:08:57.000000',2),(1643,159,'2025-02-14 02:48:43.000000',3),(1644,1977,'2025-02-14 01:05:14.000000',4),(1645,132,'2025-02-15 19:20:55.000000',1),(1646,705,'2025-02-15 21:50:16.000000',2),(1647,213,'2025-02-15 00:47:07.000000',3),(1648,1689,'2025-02-15 10:22:55.000000',4),(1649,179,'2025-02-16 22:11:19.000000',1),(1650,194,'2025-02-16 16:08:57.000000',2),(1651,62,'2025-02-16 11:08:16.000000',3),(1652,1431,'2025-02-16 18:16:29.000000',4),(1653,619,'2025-02-17 06:58:47.000000',1),(1654,874,'2025-02-17 16:08:46.000000',2),(1655,1031,'2025-02-17 03:57:38.000000',3),(1656,1717,'2025-02-17 01:56:14.000000',4),(1657,1337,'2025-02-18 01:09:49.000000',1),(1658,1940,'2025-02-18 04:40:29.000000',2),(1659,827,'2025-02-18 06:20:52.000000',3),(1660,246,'2025-02-18 06:32:18.000000',4),(1661,1222,'2025-02-19 19:05:49.000000',1),(1662,1002,'2025-02-19 15:59:50.000000',2),(1663,29,'2025-02-19 12:04:33.000000',3),(1664,1527,'2025-02-19 13:28:04.000000',4),(1665,757,'2025-02-20 03:12:30.000000',1),(1666,627,'2025-02-20 11:44:58.000000',2),(1667,1106,'2025-02-20 02:22:01.000000',3),(1668,1362,'2025-02-20 11:13:40.000000',4),(1669,1926,'2025-02-21 00:01:35.000000',1),(1670,329,'2025-02-21 19:27:10.000000',2),(1671,916,'2025-02-21 09:21:50.000000',3),(1672,438,'2025-02-21 02:50:35.000000',4),(1673,81,'2025-02-22 17:44:45.000000',1),(1674,1586,'2025-02-22 23:34:57.000000',2),(1675,1394,'2025-02-22 00:21:22.000000',3),(1676,207,'2025-02-22 10:31:39.000000',4),(1677,1388,'2025-02-23 04:49:01.000000',1),(1678,497,'2025-02-23 20:46:40.000000',2),(1679,940,'2025-02-23 15:25:35.000000',3),(1680,1391,'2025-02-23 10:06:14.000000',4),(1681,1969,'2025-02-24 05:08:22.000000',1),(1682,891,'2025-02-24 06:42:49.000000',2),(1683,1206,'2025-02-24 09:18:27.000000',3),(1684,891,'2025-02-24 20:25:04.000000',4),(1685,68,'2025-02-25 16:10:19.000000',1),(1686,1261,'2025-02-25 03:30:30.000000',2),(1687,1349,'2025-02-25 17:06:49.000000',3),(1688,280,'2025-02-25 05:34:56.000000',4),(1689,1178,'2025-02-26 00:02:24.000000',1),(1690,1854,'2025-02-26 22:31:29.000000',2),(1691,612,'2025-02-26 19:36:38.000000',3),(1692,947,'2025-02-26 01:52:37.000000',4),(1693,481,'2025-02-27 03:10:07.000000',1),(1694,607,'2025-02-27 19:18:54.000000',2),(1695,1208,'2025-02-27 02:28:02.000000',3),(1696,1479,'2025-02-27 17:02:32.000000',4),(1697,1231,'2025-02-28 13:36:02.000000',1),(1698,72,'2025-02-28 09:01:52.000000',2),(1699,282,'2025-02-28 01:11:18.000000',3),(1700,698,'2025-02-28 13:17:53.000000',4),(1701,728,'2025-03-01 01:58:13.000000',1),(1702,1547,'2025-03-01 13:45:05.000000',2),(1703,838,'2025-03-01 03:32:41.000000',3),(1704,1985,'2025-03-01 15:35:27.000000',4),(1705,180,'2025-03-02 00:19:19.000000',1),(1706,1546,'2025-03-02 09:48:07.000000',2),(1707,1755,'2025-03-02 15:20:25.000000',3),(1708,1423,'2025-03-02 11:14:49.000000',4),(1709,1246,'2025-03-03 03:38:00.000000',1),(1710,853,'2025-03-03 15:48:41.000000',2),(1711,992,'2025-03-03 03:43:05.000000',3),(1712,1168,'2025-03-03 00:20:32.000000',4),(1713,1265,'2025-03-04 21:02:35.000000',1),(1714,1515,'2025-03-04 12:44:15.000000',2),(1715,1386,'2025-03-04 04:37:37.000000',3),(1716,707,'2025-03-04 21:16:31.000000',4),(1717,958,'2025-03-05 02:35:12.000000',1),(1718,1825,'2025-03-05 01:40:15.000000',2),(1719,55,'2025-03-05 08:28:09.000000',3),(1720,618,'2025-03-05 01:52:32.000000',4),(1721,1237,'2025-03-06 07:24:45.000000',1),(1722,1941,'2025-03-06 03:57:37.000000',2),(1723,1735,'2025-03-06 08:32:01.000000',3),(1724,1503,'2025-03-06 06:29:49.000000',4),(1725,928,'2025-03-07 22:38:31.000000',1),(1726,104,'2025-03-07 11:43:40.000000',2),(1727,1627,'2025-03-07 19:03:03.000000',3),(1728,1962,'2025-03-07 16:24:53.000000',4),(1729,627,'2025-03-08 20:25:29.000000',1),(1730,261,'2025-03-08 00:20:22.000000',2),(1731,1313,'2025-03-08 14:37:37.000000',3),(1732,587,'2025-03-08 10:51:24.000000',4),(1733,1338,'2025-03-09 02:38:06.000000',1),(1734,136,'2025-03-09 00:21:19.000000',2),(1735,528,'2025-03-09 07:02:19.000000',3),(1736,809,'2025-03-09 10:32:17.000000',4),(1737,607,'2025-03-10 16:52:27.000000',1),(1738,251,'2025-03-10 09:46:07.000000',2),(1739,1306,'2025-03-10 09:44:17.000000',3),(1740,546,'2025-03-10 01:06:31.000000',4),(1741,621,'2025-03-11 05:25:09.000000',1),(1742,884,'2025-03-11 20:59:21.000000',2),(1743,1194,'2025-03-11 14:01:23.000000',3),(1744,727,'2025-03-11 05:32:11.000000',4),(1745,1064,'2025-03-12 02:59:00.000000',1),(1746,1667,'2025-03-12 06:51:20.000000',2),(1747,89,'2025-03-12 07:24:30.000000',3),(1748,677,'2025-03-12 07:03:30.000000',4),(1749,69,'2025-03-13 19:26:14.000000',1),(1750,1205,'2025-03-13 17:46:58.000000',2),(1751,277,'2025-03-13 18:56:21.000000',3),(1752,419,'2025-03-13 07:47:54.000000',4),(1753,1461,'2025-03-14 01:43:05.000000',1),(1754,1979,'2025-03-14 10:27:42.000000',2),(1755,445,'2025-03-14 15:18:39.000000',3),(1756,647,'2025-03-14 04:45:14.000000',4),(1757,280,'2025-03-15 00:31:30.000000',1),(1758,1492,'2025-03-15 15:11:27.000000',2),(1759,1819,'2025-03-15 19:54:06.000000',3),(1760,1135,'2025-03-15 01:25:02.000000',4),(1761,1186,'2025-03-16 15:48:42.000000',1),(1762,307,'2025-03-16 23:40:03.000000',2),(1763,1156,'2025-03-16 19:22:44.000000',3),(1764,1197,'2025-03-16 11:11:29.000000',4),(1765,339,'2025-03-17 14:13:48.000000',1),(1766,1670,'2025-03-17 01:38:49.000000',2),(1767,669,'2025-03-17 23:13:26.000000',3),(1768,1675,'2025-03-17 18:25:56.000000',4),(1769,1808,'2025-03-18 21:11:52.000000',1),(1770,1274,'2025-03-18 20:52:18.000000',2),(1771,1924,'2025-03-18 13:47:02.000000',3),(1772,1085,'2025-03-18 02:02:59.000000',4),(1773,1287,'2025-03-19 10:53:32.000000',1),(1774,686,'2025-03-19 20:30:25.000000',2),(1775,1445,'2025-03-19 03:36:05.000000',3),(1776,1277,'2025-03-19 03:51:51.000000',4),(1777,1256,'2025-03-20 17:00:22.000000',1),(1778,375,'2025-03-20 00:20:28.000000',2),(1779,1806,'2025-03-20 21:25:35.000000',3),(1780,932,'2025-03-20 20:02:03.000000',4),(1781,1460,'2025-03-21 19:48:50.000000',1),(1782,1353,'2025-03-21 04:09:27.000000',2),(1783,555,'2025-03-21 20:40:08.000000',3),(1784,374,'2025-03-21 19:17:33.000000',4),(1785,105,'2025-03-22 12:32:28.000000',1),(1786,625,'2025-03-22 16:39:03.000000',2),(1787,918,'2025-03-22 11:29:41.000000',3),(1788,1808,'2025-03-22 20:32:32.000000',4),(1789,97,'2025-03-23 22:50:59.000000',1),(1790,1572,'2025-03-23 09:16:10.000000',2),(1791,983,'2025-03-23 18:28:16.000000',3),(1792,524,'2025-03-23 03:31:45.000000',4),(1793,1104,'2025-03-24 20:48:58.000000',1),(1794,250,'2025-03-24 03:44:34.000000',2),(1795,822,'2025-03-24 03:46:14.000000',3),(1796,1352,'2025-03-24 13:57:22.000000',4),(1797,292,'2025-03-25 15:13:51.000000',1),(1798,1369,'2025-03-25 19:46:56.000000',2),(1799,1387,'2025-03-25 22:47:02.000000',3),(1800,30,'2025-03-25 14:51:25.000000',4),(1801,88,'2025-03-26 05:13:31.000000',1),(1802,1393,'2025-03-26 13:34:22.000000',2),(1803,1677,'2025-03-26 18:51:11.000000',3),(1804,1326,'2025-03-26 20:03:14.000000',4),(1805,87,'2025-03-27 19:21:00.000000',1),(1806,1725,'2025-03-27 19:09:55.000000',2),(1807,1989,'2025-03-27 21:59:24.000000',3),(1808,254,'2025-03-27 05:19:24.000000',4),(1809,922,'2025-03-28 23:14:12.000000',1),(1810,1231,'2025-03-28 09:35:16.000000',2),(1811,1077,'2025-03-28 21:02:23.000000',3),(1812,1381,'2025-03-28 01:27:47.000000',4),(1813,544,'2025-03-29 06:26:41.000000',1),(1814,1904,'2025-03-29 13:16:52.000000',2),(1815,1266,'2025-03-29 02:20:21.000000',3),(1816,919,'2025-03-29 20:54:58.000000',4),(1817,61,'2025-03-30 16:21:25.000000',1),(1818,877,'2025-03-30 02:32:14.000000',2),(1819,118,'2025-03-30 20:59:42.000000',3),(1820,344,'2025-03-30 16:04:20.000000',4),(1821,1477,'2025-03-31 20:25:08.000000',1),(1822,951,'2025-03-31 03:18:35.000000',2),(1823,779,'2025-03-31 23:06:50.000000',3),(1824,238,'2025-03-31 01:22:34.000000',4),(1825,1507,'2025-04-01 10:07:32.000000',1),(1826,482,'2025-04-01 12:00:04.000000',2),(1827,1594,'2025-04-01 16:53:31.000000',3),(1828,1945,'2025-04-01 20:56:22.000000',4),(1829,595,'2025-04-02 05:49:22.000000',1),(1830,1793,'2025-04-02 18:10:44.000000',2),(1831,705,'2025-04-02 04:59:37.000000',3),(1832,1251,'2025-04-02 03:16:19.000000',4),(1833,1425,'2025-04-03 17:13:25.000000',1),(1834,1811,'2025-04-03 09:48:10.000000',2),(1835,1585,'2025-04-03 07:14:21.000000',3),(1836,1799,'2025-04-03 01:19:20.000000',4),(1837,1924,'2025-04-04 07:58:10.000000',1),(1838,362,'2025-04-04 19:31:11.000000',2),(1839,1562,'2025-04-04 11:09:14.000000',3),(1840,419,'2025-04-04 12:14:56.000000',4),(1841,1889,'2025-04-05 12:20:34.000000',1),(1842,116,'2025-04-05 04:16:22.000000',2),(1843,1196,'2025-04-05 18:05:53.000000',3),(1844,1669,'2025-04-05 17:24:34.000000',4),(1845,952,'2025-04-06 23:53:55.000000',1),(1846,1059,'2025-04-06 09:23:23.000000',2),(1847,1541,'2025-04-06 11:18:58.000000',3),(1848,1754,'2025-04-06 10:30:04.000000',4),(1849,1440,'2025-04-07 01:40:35.000000',1),(1850,1575,'2025-04-07 09:20:32.000000',2),(1851,953,'2025-04-07 18:25:07.000000',3),(1852,1925,'2025-04-07 01:52:24.000000',4),(1853,1990,'2025-04-08 13:49:45.000000',1),(1854,487,'2025-04-08 05:53:35.000000',2),(1855,1336,'2025-04-08 11:30:23.000000',3),(1856,990,'2025-04-08 21:35:17.000000',4),(1857,787,'2025-04-09 18:36:49.000000',1),(1858,44,'2025-04-09 15:22:15.000000',2),(1859,1754,'2025-04-09 04:31:26.000000',3),(1860,915,'2025-04-09 19:37:00.000000',4),(1861,1592,'2025-04-10 20:00:05.000000',1),(1862,10,'2025-04-10 11:28:48.000000',2),(1863,1851,'2025-04-10 14:06:29.000000',3),(1864,1087,'2025-04-10 20:44:04.000000',4),(1865,1983,'2025-04-11 02:58:51.000000',1),(1866,1896,'2025-04-11 14:01:34.000000',2),(1867,176,'2025-04-11 23:40:17.000000',3),(1868,274,'2025-04-11 11:31:16.000000',4),(1869,1621,'2025-04-12 05:51:35.000000',1),(1870,324,'2025-04-12 07:38:38.000000',2),(1871,1570,'2025-04-12 20:29:51.000000',3),(1872,901,'2025-04-12 08:39:29.000000',4),(1873,978,'2025-04-13 04:01:36.000000',1),(1874,477,'2025-04-13 22:35:03.000000',2),(1875,262,'2025-04-13 08:51:43.000000',3),(1876,683,'2025-04-13 13:07:22.000000',4),(1877,609,'2025-04-14 01:34:25.000000',1),(1878,1422,'2025-04-14 07:47:37.000000',2),(1879,1535,'2025-04-14 13:55:11.000000',3),(1880,368,'2025-04-14 02:19:58.000000',4),(1881,1167,'2025-04-15 15:02:42.000000',1),(1882,860,'2025-04-15 00:51:44.000000',2),(1883,1830,'2025-04-15 00:58:39.000000',3),(1884,1019,'2025-04-15 10:48:47.000000',4),(1885,884,'2025-04-16 04:39:03.000000',1),(1886,1621,'2025-04-16 15:02:55.000000',2),(1887,835,'2025-04-16 04:04:05.000000',3),(1888,1271,'2025-04-16 13:51:20.000000',4),(1889,625,'2025-04-17 10:38:38.000000',1),(1890,434,'2025-04-17 05:32:13.000000',2),(1891,619,'2025-04-17 09:24:27.000000',3),(1892,1856,'2025-04-17 08:54:34.000000',4),(1893,1690,'2025-04-18 12:36:53.000000',1),(1894,1390,'2025-04-18 15:29:46.000000',2),(1895,1204,'2025-04-18 12:53:35.000000',3),(1896,352,'2025-04-18 09:30:22.000000',4),(1897,1854,'2025-04-19 16:34:48.000000',1),(1898,51,'2025-04-19 13:27:55.000000',2),(1899,276,'2025-04-19 10:37:27.000000',3),(1900,787,'2025-04-19 08:40:27.000000',4),(1901,470,'2025-04-20 21:11:33.000000',1),(1902,1838,'2025-04-20 12:35:20.000000',2),(1903,680,'2025-04-20 00:27:24.000000',3),(1904,371,'2025-04-20 15:22:44.000000',4),(1905,927,'2025-04-21 00:05:29.000000',1),(1906,274,'2025-04-21 07:19:44.000000',2),(1907,857,'2025-04-21 18:25:31.000000',3),(1908,1814,'2025-04-21 20:07:11.000000',4),(1909,748,'2025-04-22 00:27:08.000000',1),(1910,1888,'2025-04-22 19:30:56.000000',2),(1911,1140,'2025-04-22 06:43:35.000000',3),(1912,650,'2025-04-22 00:09:38.000000',4),(1913,99,'2025-04-23 14:31:02.000000',1),(1914,30,'2025-04-23 10:23:03.000000',2),(1915,1680,'2025-04-23 18:38:45.000000',3),(1916,1635,'2025-04-23 20:48:43.000000',4),(1917,1938,'2025-04-24 11:36:58.000000',1),(1918,104,'2025-04-24 09:23:56.000000',2),(1919,537,'2025-04-24 02:02:03.000000',3),(1920,1251,'2025-04-24 02:03:34.000000',4),(1921,927,'2025-04-25 20:49:23.000000',1),(1922,349,'2025-04-25 17:06:16.000000',2),(1923,280,'2025-04-25 17:34:37.000000',3),(1924,172,'2025-04-25 12:01:19.000000',4),(1925,747,'2025-04-26 22:13:35.000000',1),(1926,639,'2025-04-26 02:06:21.000000',2),(1927,1408,'2025-04-26 07:58:25.000000',3),(1928,1005,'2025-04-26 12:32:46.000000',4),(1929,411,'2025-04-27 22:36:52.000000',1),(1930,754,'2025-04-27 04:45:35.000000',2),(1931,618,'2025-04-27 06:54:15.000000',3),(1932,958,'2025-04-27 16:20:45.000000',4),(1933,642,'2025-04-28 08:26:08.000000',1),(1934,1562,'2025-04-28 13:09:55.000000',2),(1935,1907,'2025-04-28 06:13:18.000000',3),(1936,167,'2025-04-28 23:43:39.000000',4),(1937,11,'2025-04-29 10:49:36.000000',1),(1938,703,'2025-04-29 16:09:44.000000',2),(1939,1245,'2025-04-29 17:38:36.000000',3),(1940,1335,'2025-04-29 21:45:58.000000',4),(1941,150,'2025-04-30 14:46:03.000000',1),(1942,838,'2025-04-30 12:41:21.000000',2),(1943,566,'2025-04-30 12:11:13.000000',3),(1944,1202,'2025-04-30 21:21:10.000000',4),(1945,1739,'2025-05-01 08:01:22.000000',1),(1946,225,'2025-05-01 08:15:27.000000',2),(1947,615,'2025-05-01 12:41:27.000000',3),(1948,1660,'2025-05-01 22:48:27.000000',4),(1949,1992,'2025-05-02 07:07:30.000000',1),(1950,906,'2025-05-02 02:06:41.000000',2),(1951,1282,'2025-05-02 23:59:39.000000',3),(1952,193,'2025-05-02 04:53:10.000000',4),(1953,127,'2025-05-03 20:53:19.000000',1),(1954,667,'2025-05-03 16:54:33.000000',2),(1955,1532,'2025-05-03 13:16:36.000000',3),(1956,1104,'2025-05-03 04:04:41.000000',4),(1957,1187,'2025-05-04 05:59:41.000000',1),(1958,607,'2025-05-04 05:11:49.000000',2),(1959,844,'2025-05-04 20:47:25.000000',3),(1960,572,'2025-05-04 12:14:43.000000',4),(1961,1265,'2025-05-05 21:33:00.000000',1),(1962,890,'2025-05-05 11:14:28.000000',2),(1963,1513,'2025-05-05 19:37:58.000000',3),(1964,736,'2025-05-05 07:51:16.000000',4),(1965,354,'2025-05-06 20:32:26.000000',1),(1966,99,'2025-05-06 07:34:46.000000',2),(1967,685,'2025-05-06 07:08:58.000000',3),(1968,124,'2025-05-06 19:37:26.000000',4),(1969,177,'2025-05-07 20:30:37.000000',1),(1970,253,'2025-05-07 21:04:45.000000',2),(1971,1207,'2025-05-07 23:54:45.000000',3),(1972,644,'2025-05-07 00:37:42.000000',4),(1973,1373,'2025-05-08 12:43:42.000000',1),(1974,293,'2025-05-08 20:11:08.000000',2),(1975,1195,'2025-05-08 04:58:08.000000',3),(1976,60,'2025-05-08 08:44:27.000000',4),(1977,387,'2025-05-09 01:21:25.000000',1),(1978,807,'2025-05-09 19:07:06.000000',2),(1979,1845,'2025-05-09 15:02:00.000000',3),(1980,1789,'2025-05-09 17:34:22.000000',4),(1981,1379,'2025-05-10 06:35:04.000000',1),(1982,94,'2025-05-10 14:56:59.000000',2),(1983,1379,'2025-05-10 08:47:07.000000',3),(1984,1353,'2025-05-10 08:22:26.000000',4),(1985,1292,'2025-05-11 08:02:18.000000',1),(1986,361,'2025-05-11 05:21:45.000000',2),(1987,1230,'2025-05-11 05:32:46.000000',3),(1988,110,'2025-05-11 09:06:46.000000',4),(1989,1018,'2025-05-12 03:13:51.000000',1),(1990,352,'2025-05-12 03:22:18.000000',2),(1991,1522,'2025-05-12 10:59:00.000000',3),(1992,1744,'2025-05-12 10:20:19.000000',4),(1993,1431,'2025-05-13 01:35:10.000000',1),(1994,1496,'2025-05-13 09:05:28.000000',2),(1995,1537,'2025-05-13 14:27:22.000000',3),(1996,1744,'2025-05-13 00:50:58.000000',4),(1997,1286,'2025-05-14 06:02:10.000000',1),(1998,743,'2025-05-14 11:02:23.000000',2),(1999,537,'2025-05-14 11:26:02.000000',3),(2000,1510,'2025-05-14 21:53:10.000000',4),(2001,1860,'2025-05-15 00:55:58.000000',1),(2002,1734,'2025-05-15 12:44:49.000000',2),(2003,214,'2025-05-15 17:47:50.000000',3),(2004,455,'2025-05-15 07:25:42.000000',4),(2005,706,'2025-05-16 04:57:49.000000',1),(2006,1323,'2025-05-16 03:27:17.000000',2),(2007,772,'2025-05-16 20:58:15.000000',3),(2008,751,'2025-05-16 07:21:12.000000',4),(2009,1322,'2025-05-17 22:58:36.000000',1),(2010,359,'2025-05-17 10:22:40.000000',2),(2011,919,'2025-05-17 14:23:13.000000',3),(2012,226,'2025-05-17 11:57:15.000000',4),(2013,12,'2025-05-18 01:38:58.000000',1),(2014,195,'2025-05-18 19:45:01.000000',2),(2015,1589,'2025-05-18 00:24:46.000000',3),(2016,439,'2025-05-18 22:05:33.000000',4),(2017,35,'2025-05-19 08:02:30.000000',1),(2018,713,'2025-05-19 01:57:32.000000',2),(2019,1216,'2025-05-19 12:50:39.000000',3),(2020,692,'2025-05-19 10:24:48.000000',4),(2021,200,'2025-05-20 10:15:27.000000',1),(2022,1559,'2025-05-20 05:10:23.000000',2),(2023,1815,'2025-05-20 05:58:22.000000',3),(2024,444,'2025-05-20 18:55:37.000000',4),(2025,109,'2025-05-21 17:51:24.000000',1),(2026,66,'2025-05-21 00:56:17.000000',2),(2027,268,'2025-05-21 01:06:48.000000',3),(2028,494,'2025-05-21 12:42:39.000000',4),(2029,973,'2025-05-22 15:29:20.000000',1),(2030,37,'2025-05-22 11:53:25.000000',2),(2031,1940,'2025-05-22 14:31:02.000000',3),(2032,522,'2025-05-22 00:48:55.000000',4),(2033,452,'2025-05-23 04:50:13.000000',1),(2034,1882,'2025-05-23 12:33:51.000000',2),(2035,1685,'2025-05-23 03:11:22.000000',3),(2036,1080,'2025-05-23 19:31:20.000000',4),(2037,1352,'2025-05-24 06:12:59.000000',1),(2038,1953,'2025-05-24 14:24:47.000000',2),(2039,937,'2025-05-24 01:54:16.000000',3),(2040,219,'2025-05-24 02:27:55.000000',4),(2041,1721,'2025-05-25 05:42:04.000000',1),(2042,728,'2025-05-25 14:08:06.000000',2),(2043,340,'2025-05-25 01:15:18.000000',3),(2044,1910,'2025-05-25 16:37:48.000000',4),(2045,1221,'2025-05-26 16:40:40.000000',1),(2046,8,'2025-05-26 23:12:27.000000',2),(2047,1162,'2025-05-26 02:50:37.000000',3),(2048,2000,'2025-05-26 13:09:41.000000',4),(2049,1535,'2025-05-27 08:28:42.000000',1),(2050,1162,'2025-05-27 18:38:10.000000',2),(2051,259,'2025-05-27 13:47:05.000000',3),(2052,467,'2025-05-27 22:11:02.000000',4),(2053,532,'2025-05-28 09:25:57.000000',1),(2054,1892,'2025-05-28 03:33:45.000000',2),(2055,1159,'2025-05-28 06:47:57.000000',3),(2056,992,'2025-05-28 01:07:23.000000',4),(2057,419,'2025-05-29 08:08:46.000000',1),(2058,1025,'2025-05-29 00:40:19.000000',2),(2059,1700,'2025-05-29 11:27:15.000000',3),(2060,1063,'2025-05-29 19:34:56.000000',4),(2061,887,'2025-05-30 04:58:27.000000',1),(2062,1287,'2025-05-30 14:16:12.000000',2),(2063,461,'2025-05-30 10:21:55.000000',3),(2064,1166,'2025-05-30 20:30:32.000000',4),(2065,1998,'2025-05-31 08:23:01.000000',1),(2066,1470,'2025-05-31 22:42:38.000000',2),(2067,1946,'2025-05-31 20:03:04.000000',3),(2068,1738,'2025-05-31 08:34:35.000000',4),(2069,1494,'2025-06-01 06:29:28.000000',1),(2070,746,'2025-06-01 22:08:35.000000',2),(2071,724,'2025-06-01 02:18:11.000000',3),(2072,1028,'2025-06-01 12:28:18.000000',4),(2073,1015,'2025-06-02 00:13:57.000000',1),(2074,30,'2025-06-02 12:10:35.000000',2),(2075,1436,'2025-06-02 13:15:34.000000',3),(2076,1004,'2025-06-02 22:20:32.000000',4),(2077,145,'2025-06-03 17:10:14.000000',1),(2078,1717,'2025-06-03 05:09:39.000000',2),(2079,1318,'2025-06-03 15:31:19.000000',3),(2080,1579,'2025-06-03 08:28:19.000000',4),(2081,130,'2025-06-04 21:16:20.000000',1),(2082,249,'2025-06-04 15:55:30.000000',2),(2083,1558,'2025-06-04 15:07:32.000000',3),(2084,1355,'2025-06-04 00:03:49.000000',4),(2085,1720,'2025-06-05 09:04:48.000000',1),(2086,487,'2025-06-05 03:56:57.000000',2),(2087,1757,'2025-06-05 17:18:51.000000',3),(2088,994,'2025-06-05 05:25:46.000000',4),(2089,1075,'2025-06-06 19:19:57.000000',1),(2090,1467,'2025-06-06 06:27:10.000000',2),(2091,190,'2025-06-06 20:36:40.000000',3),(2092,406,'2025-06-06 21:32:15.000000',4),(2093,1998,'2025-06-07 07:42:44.000000',1),(2094,300,'2025-06-07 00:41:53.000000',2),(2095,1709,'2025-06-07 15:51:11.000000',3),(2096,1762,'2025-06-07 06:55:31.000000',4),(2097,93,'2025-06-08 12:54:13.000000',1),(2098,1908,'2025-06-08 14:50:37.000000',2),(2099,1403,'2025-06-08 21:53:55.000000',3),(2100,1492,'2025-06-08 18:28:55.000000',4),(2101,1721,'2025-06-09 10:04:12.000000',1),(2102,1254,'2025-06-09 00:59:36.000000',2),(2103,341,'2025-06-09 00:14:39.000000',3),(2104,1188,'2025-06-09 19:42:06.000000',4),(2105,1495,'2025-06-10 12:08:03.000000',1),(2106,1701,'2025-06-10 05:14:16.000000',2),(2107,862,'2025-06-10 14:18:35.000000',3),(2108,1060,'2025-06-10 08:44:41.000000',4),(2109,389,'2025-06-11 13:21:53.000000',1),(2110,1846,'2025-06-11 07:13:35.000000',2),(2111,1558,'2025-06-11 17:01:15.000000',3),(2112,980,'2025-06-11 18:21:38.000000',4),(2113,589,'2025-06-12 03:39:41.000000',1),(2114,370,'2025-06-12 00:19:25.000000',2),(2115,1725,'2025-06-12 21:11:55.000000',3),(2116,1436,'2025-06-12 15:51:35.000000',4),(2117,1757,'2025-06-13 14:33:01.000000',1),(2118,448,'2025-06-13 13:43:07.000000',2),(2119,701,'2025-06-13 09:42:11.000000',3),(2120,1273,'2025-06-13 12:53:38.000000',4),(2121,1874,'2025-06-14 13:39:24.000000',1),(2122,145,'2025-06-14 23:26:05.000000',2),(2123,1880,'2025-06-14 10:21:02.000000',3),(2124,422,'2025-06-14 09:44:50.000000',4),(2125,1088,'2025-06-15 20:02:41.000000',1),(2126,873,'2025-06-15 05:07:34.000000',2),(2127,796,'2025-06-15 12:59:42.000000',3),(2128,1267,'2025-06-15 08:46:13.000000',4),(2129,902,'2025-06-16 01:41:02.000000',1),(2130,1737,'2025-06-16 01:03:44.000000',2),(2131,886,'2025-06-16 05:01:49.000000',3),(2132,1185,'2025-06-16 14:00:54.000000',4),(2133,536,'2025-06-17 05:00:45.000000',1),(2134,1520,'2025-06-17 17:06:17.000000',2),(2135,56,'2025-06-17 15:52:37.000000',3),(2136,1383,'2025-06-17 03:43:09.000000',4),(2137,1760,'2025-06-18 23:46:30.000000',1),(2138,993,'2025-06-18 10:15:07.000000',2),(2139,1028,'2025-06-18 04:48:54.000000',3),(2140,592,'2025-06-18 23:13:13.000000',4),(2141,1996,'2025-06-19 13:51:00.000000',1),(2142,584,'2025-06-19 06:10:01.000000',2),(2143,1134,'2025-06-19 16:31:22.000000',3),(2144,281,'2025-06-19 18:25:59.000000',4),(2145,1127,'2025-06-20 09:31:20.000000',1),(2146,883,'2025-06-20 15:01:42.000000',2),(2147,620,'2025-06-20 07:50:12.000000',3),(2148,1828,'2025-06-20 13:38:42.000000',4),(2149,1153,'2025-06-21 20:43:34.000000',1),(2150,1455,'2025-06-21 06:59:31.000000',2),(2151,1266,'2025-06-21 18:18:46.000000',3),(2152,959,'2025-06-21 21:00:53.000000',4),(2153,820,'2025-06-22 18:28:01.000000',1),(2154,936,'2025-06-22 17:44:31.000000',2),(2155,401,'2025-06-22 02:53:47.000000',3),(2156,1196,'2025-06-22 15:21:17.000000',4),(2157,1111,'2025-06-23 01:40:26.000000',1),(2158,340,'2025-06-23 13:36:36.000000',2),(2159,453,'2025-06-23 03:31:48.000000',3),(2160,1550,'2025-06-23 16:34:45.000000',4),(2161,1368,'2025-06-24 19:14:17.000000',1),(2162,29,'2025-06-24 00:18:38.000000',2),(2163,232,'2025-06-24 00:45:30.000000',3),(2164,145,'2025-06-24 11:36:45.000000',4),(2165,658,'2025-06-25 21:49:03.000000',1),(2166,1202,'2025-06-25 22:01:08.000000',2),(2167,899,'2025-06-25 06:00:16.000000',3),(2168,269,'2025-06-25 11:54:57.000000',4),(2169,1012,'2025-06-26 04:21:35.000000',1),(2170,799,'2025-06-26 23:35:49.000000',2),(2171,66,'2025-06-26 01:06:20.000000',3),(2172,68,'2025-06-26 00:38:08.000000',4),(2173,685,'2025-06-27 02:07:40.000000',1),(2174,407,'2025-06-27 10:42:24.000000',2),(2175,1564,'2025-06-27 16:16:48.000000',3),(2176,45,'2025-06-27 20:57:43.000000',4),(2177,768,'2025-06-28 11:45:33.000000',1),(2178,184,'2025-06-28 10:45:54.000000',2),(2179,578,'2025-06-28 02:42:24.000000',3),(2180,1326,'2025-06-28 02:32:28.000000',4),(2181,1990,'2025-06-29 23:55:16.000000',1),(2182,1878,'2025-06-29 23:38:06.000000',2),(2183,1772,'2025-06-29 17:46:25.000000',3),(2184,762,'2025-06-29 04:59:06.000000',4),(2185,529,'2025-06-30 06:45:11.000000',1),(2186,1184,'2025-06-30 11:26:41.000000',2),(2187,1730,'2025-06-30 12:40:18.000000',3),(2188,213,'2025-06-30 17:45:49.000000',4),(2189,473,'2025-07-01 07:27:48.000000',1),(2190,1056,'2025-07-01 05:55:52.000000',2),(2191,1803,'2025-07-01 21:31:27.000000',3),(2192,752,'2025-07-01 19:34:51.000000',4),(2193,47,'2025-07-02 10:19:11.000000',1),(2194,129,'2025-07-02 19:50:44.000000',2),(2195,28,'2025-07-02 20:11:33.000000',3),(2196,1356,'2025-07-02 13:02:53.000000',4),(2197,1511,'2025-07-03 18:11:02.000000',1),(2198,496,'2025-07-03 12:03:43.000000',2),(2199,1817,'2025-07-03 17:31:31.000000',3),(2200,60,'2025-07-03 08:25:25.000000',4),(2201,789,'2025-07-04 02:19:23.000000',1),(2202,438,'2025-07-04 16:19:35.000000',2),(2203,1227,'2025-07-04 01:17:43.000000',3),(2204,1354,'2025-07-04 21:40:29.000000',4),(2205,675,'2025-07-05 16:09:40.000000',1),(2206,639,'2025-07-05 15:59:24.000000',2),(2207,67,'2025-07-05 14:21:35.000000',3),(2208,1520,'2025-07-05 08:55:43.000000',4),(2209,278,'2025-07-06 16:24:29.000000',1),(2210,1585,'2025-07-06 15:23:46.000000',2),(2211,1604,'2025-07-06 00:51:10.000000',3),(2212,207,'2025-07-06 21:38:26.000000',4),(2213,1503,'2025-07-07 19:29:46.000000',1),(2214,685,'2025-07-07 07:39:41.000000',2),(2215,1489,'2025-07-07 18:06:07.000000',3),(2216,114,'2025-07-07 10:59:20.000000',4),(2217,771,'2025-07-08 21:52:14.000000',1),(2218,1621,'2025-07-08 04:38:25.000000',2),(2219,1860,'2025-07-08 11:19:58.000000',3),(2220,740,'2025-07-08 05:33:46.000000',4),(2221,1321,'2025-07-09 03:41:47.000000',1),(2222,441,'2025-07-09 20:10:00.000000',2),(2223,472,'2025-07-09 13:54:02.000000',3),(2224,1007,'2025-07-09 10:36:46.000000',4),(2225,873,'2025-07-10 04:32:19.000000',1),(2226,1516,'2025-07-10 14:43:05.000000',2),(2227,952,'2025-07-10 22:47:53.000000',3),(2228,439,'2025-07-10 12:42:11.000000',4),(2229,1759,'2025-07-11 12:10:30.000000',1),(2230,1474,'2025-07-11 20:59:55.000000',2),(2231,164,'2025-07-11 01:23:58.000000',3),(2232,1845,'2025-07-11 05:36:12.000000',4),(2233,1580,'2025-07-12 21:52:17.000000',1),(2234,1400,'2025-07-12 05:07:40.000000',2),(2235,380,'2025-07-12 20:35:17.000000',3),(2236,622,'2025-07-12 09:01:32.000000',4),(2237,384,'2025-07-13 10:11:33.000000',1),(2238,1695,'2025-07-13 16:25:42.000000',2),(2239,752,'2025-07-13 04:24:19.000000',3),(2240,1017,'2025-07-13 07:50:52.000000',4),(2241,559,'2025-07-14 13:27:40.000000',1),(2242,1463,'2025-07-14 17:07:58.000000',2),(2243,767,'2025-07-14 12:22:19.000000',3),(2244,1399,'2025-07-14 08:52:30.000000',4),(2245,1672,'2025-07-15 09:16:47.000000',1),(2246,1170,'2025-07-15 00:26:27.000000',2),(2247,1182,'2025-07-15 20:51:27.000000',3),(2248,1925,'2025-07-15 08:19:40.000000',4),(2249,1938,'2025-07-16 18:30:35.000000',1),(2250,1495,'2025-07-16 12:44:20.000000',2),(2251,956,'2025-07-16 03:27:08.000000',3),(2252,696,'2025-07-16 22:56:42.000000',4),(2253,616,'2025-07-17 20:53:04.000000',1),(2254,1445,'2025-07-17 22:18:03.000000',2),(2255,1900,'2025-07-17 19:45:27.000000',3),(2256,1089,'2025-07-17 06:41:12.000000',4),(2257,1581,'2025-07-18 21:13:40.000000',1),(2258,239,'2025-07-18 07:09:07.000000',2),(2259,302,'2025-07-18 16:50:16.000000',3),(2260,1577,'2025-07-18 15:33:08.000000',4),(2261,1250,'2025-07-19 23:57:11.000000',1),(2262,1559,'2025-07-19 03:08:24.000000',2),(2263,360,'2025-07-19 12:05:01.000000',3),(2264,810,'2025-07-19 09:19:54.000000',4),(2265,136,'2025-07-20 20:33:02.000000',1),(2266,1293,'2025-07-20 18:28:42.000000',2),(2267,1344,'2025-07-20 22:08:01.000000',3),(2268,1899,'2025-07-20 14:14:01.000000',4),(2269,1985,'2025-07-21 23:14:08.000000',1),(2270,619,'2025-07-21 01:22:24.000000',2),(2271,1885,'2025-07-21 08:58:29.000000',3),(2272,246,'2025-07-21 14:09:34.000000',4),(2273,1705,'2025-07-22 20:15:38.000000',1),(2274,183,'2025-07-22 17:30:52.000000',2),(2275,132,'2025-07-22 06:25:54.000000',3),(2276,846,'2025-07-22 12:34:25.000000',4),(2277,886,'2025-07-23 13:00:50.000000',1),(2278,1219,'2025-07-23 14:06:04.000000',2),(2279,1178,'2025-07-23 06:47:50.000000',3),(2280,1402,'2025-07-23 02:14:19.000000',4),(2281,30,'2025-07-24 05:21:34.000000',1),(2282,1947,'2025-07-24 09:40:56.000000',2),(2283,715,'2025-07-24 15:43:44.000000',3),(2284,68,'2025-07-24 19:42:38.000000',4),(2285,856,'2025-07-25 16:56:36.000000',1),(2286,1653,'2025-07-25 00:31:42.000000',2),(2287,1690,'2025-07-25 01:33:00.000000',3),(2288,1223,'2025-07-25 00:41:47.000000',4),(2289,33,'2025-07-26 23:16:56.000000',1),(2290,1611,'2025-07-26 04:05:52.000000',2),(2291,303,'2025-07-26 12:19:14.000000',3),(2292,1262,'2025-07-26 05:12:31.000000',4),(2293,1249,'2025-07-27 12:04:48.000000',1),(2294,358,'2025-07-27 14:38:43.000000',2),(2295,1568,'2025-07-27 01:32:25.000000',3),(2296,570,'2025-07-27 17:27:25.000000',4),(2297,717,'2025-07-28 05:49:22.000000',1),(2298,484,'2025-07-28 01:31:11.000000',2),(2299,745,'2025-07-28 00:28:14.000000',3),(2300,1794,'2025-07-28 19:15:56.000000',4),(2301,1374,'2025-07-29 01:48:36.000000',1),(2302,1962,'2025-07-29 04:59:59.000000',2),(2303,911,'2025-07-29 06:42:33.000000',3),(2304,1636,'2025-07-29 10:28:45.000000',4),(2305,892,'2025-07-30 18:43:10.000000',1),(2306,224,'2025-07-30 21:21:30.000000',2),(2307,220,'2025-07-30 21:20:12.000000',3),(2308,163,'2025-07-30 21:10:14.000000',4),(2309,1102,'2025-07-31 18:12:36.000000',1),(2310,1470,'2025-07-31 11:27:29.000000',2),(2311,14,'2025-07-31 05:48:58.000000',3),(2312,1036,'2025-07-31 07:23:10.000000',4),(2313,1556,'2025-08-01 15:59:26.000000',1),(2314,229,'2025-08-01 21:20:45.000000',2),(2315,339,'2025-08-01 21:39:22.000000',3),(2316,383,'2025-08-01 03:21:26.000000',4),(2317,220,'2025-08-02 12:52:54.000000',1),(2318,732,'2025-08-02 22:32:16.000000',2),(2319,1924,'2025-08-02 00:17:05.000000',3),(2320,1966,'2025-08-02 18:34:07.000000',4),(2321,37,'2025-08-03 14:14:29.000000',1),(2322,1003,'2025-08-03 07:28:11.000000',2),(2323,723,'2025-08-03 13:45:15.000000',3),(2324,709,'2025-08-03 02:06:18.000000',4),(2325,961,'2025-08-04 12:12:33.000000',1),(2326,1879,'2025-08-04 21:01:38.000000',2),(2327,1047,'2025-08-04 01:38:19.000000',3),(2328,980,'2025-08-04 09:53:15.000000',4),(2329,1193,'2025-08-05 05:06:54.000000',1),(2330,1839,'2025-08-05 08:11:55.000000',2),(2331,208,'2025-08-05 13:44:21.000000',3),(2332,1401,'2025-08-05 19:15:34.000000',4),(2333,746,'2025-08-06 02:16:37.000000',1),(2334,1566,'2025-08-06 13:55:37.000000',2),(2335,1023,'2025-08-06 04:07:17.000000',3),(2336,1336,'2025-08-06 00:57:49.000000',4),(2337,169,'2025-08-07 05:13:07.000000',1),(2338,1194,'2025-08-07 18:28:53.000000',2),(2339,1162,'2025-08-07 16:10:56.000000',3),(2340,1321,'2025-08-07 21:07:47.000000',4),(2341,633,'2025-08-08 15:49:28.000000',1),(2342,143,'2025-08-08 14:29:51.000000',2),(2343,1005,'2025-08-08 13:02:02.000000',3),(2344,1807,'2025-08-08 21:10:05.000000',4),(2345,1284,'2025-08-09 20:53:12.000000',1),(2346,125,'2025-08-09 14:20:16.000000',2),(2347,811,'2025-08-09 12:26:18.000000',3),(2348,275,'2025-08-09 11:17:28.000000',4),(2349,1922,'2025-08-10 06:35:08.000000',1),(2350,32,'2025-08-10 23:30:31.000000',2),(2351,1318,'2025-08-10 03:23:36.000000',3),(2352,754,'2025-08-10 20:53:51.000000',4),(2353,453,'2025-08-11 06:30:41.000000',1),(2354,1827,'2025-08-11 07:38:38.000000',2),(2355,618,'2025-08-11 14:37:48.000000',3),(2356,1304,'2025-08-11 17:10:38.000000',4),(2357,1214,'2025-08-12 02:42:02.000000',1),(2358,1324,'2025-08-12 16:42:52.000000',2),(2359,227,'2025-08-12 05:16:21.000000',3),(2360,385,'2025-08-12 21:44:59.000000',4),(2361,1263,'2025-08-13 05:47:41.000000',1),(2362,528,'2025-08-13 10:21:12.000000',2),(2363,654,'2025-08-13 00:33:50.000000',3),(2364,1679,'2025-08-13 13:32:10.000000',4),(2365,11,'2025-08-14 12:06:39.000000',1),(2366,1088,'2025-08-14 12:16:58.000000',2),(2367,563,'2025-08-14 04:22:33.000000',3),(2368,896,'2025-08-14 20:35:47.000000',4),(2369,1959,'2025-08-15 15:56:56.000000',1),(2370,1152,'2025-08-15 21:39:57.000000',2),(2371,258,'2025-08-15 04:06:36.000000',3),(2372,521,'2025-08-15 03:05:59.000000',4),(2373,1568,'2025-08-16 21:54:23.000000',1),(2374,1100,'2025-08-16 04:19:22.000000',2),(2375,776,'2025-08-16 04:58:31.000000',3),(2376,852,'2025-08-16 07:37:47.000000',4),(2377,1191,'2025-08-17 04:11:06.000000',1),(2378,951,'2025-08-17 10:51:01.000000',2),(2379,1354,'2025-08-17 00:29:33.000000',3),(2380,1152,'2025-08-17 07:42:17.000000',4),(2381,1696,'2025-08-18 21:57:32.000000',1),(2382,1861,'2025-08-18 11:52:31.000000',2),(2383,87,'2025-08-18 04:00:07.000000',3),(2384,892,'2025-08-18 17:09:34.000000',4),(2385,165,'2025-08-19 02:00:53.000000',1),(2386,1108,'2025-08-19 03:50:37.000000',2),(2387,1554,'2025-08-19 06:53:56.000000',3),(2388,1544,'2025-08-19 00:29:12.000000',4),(2389,1352,'2025-08-20 19:09:28.000000',1),(2390,1787,'2025-08-20 23:37:09.000000',2),(2391,1784,'2025-08-20 12:20:45.000000',3),(2392,1815,'2025-08-20 21:59:59.000000',4),(2393,425,'2025-08-21 18:53:08.000000',1),(2394,1738,'2025-08-21 16:49:40.000000',2),(2395,1188,'2025-08-21 05:45:34.000000',3),(2396,930,'2025-08-21 05:58:57.000000',4),(2397,975,'2025-08-22 13:49:54.000000',1),(2398,144,'2025-08-22 16:57:35.000000',2),(2399,1966,'2025-08-22 05:45:08.000000',3),(2400,44,'2025-08-22 04:39:14.000000',4),(2401,1142,'2025-08-23 12:39:17.000000',1),(2402,1306,'2025-08-23 06:33:19.000000',2),(2403,525,'2025-08-23 10:39:32.000000',3),(2404,227,'2025-08-23 23:31:20.000000',4),(2405,1570,'2025-08-24 14:59:43.000000',1),(2406,1796,'2025-08-24 01:12:44.000000',2),(2407,1979,'2025-08-24 08:04:28.000000',3),(2408,1441,'2025-08-24 22:30:16.000000',4),(2409,1562,'2025-08-25 18:55:06.000000',1),(2410,696,'2025-08-25 12:54:35.000000',2),(2411,1172,'2025-08-25 03:01:14.000000',3),(2412,1989,'2025-08-25 13:12:15.000000',4),(2413,1241,'2025-08-26 07:41:39.000000',1),(2414,1677,'2025-08-26 03:21:19.000000',2),(2415,681,'2025-08-26 18:30:07.000000',3),(2416,1851,'2025-08-26 09:20:32.000000',4),(2417,1027,'2025-08-27 10:59:03.000000',1),(2418,848,'2025-08-27 04:37:21.000000',2),(2419,863,'2025-08-27 12:58:15.000000',3),(2420,764,'2025-08-27 12:50:36.000000',4),(2421,747,'2025-08-28 07:17:21.000000',1),(2422,1306,'2025-08-28 22:54:18.000000',2),(2423,83,'2025-08-28 09:35:39.000000',3),(2424,1814,'2025-08-28 00:08:36.000000',4),(2425,1717,'2025-08-29 12:22:34.000000',1),(2426,292,'2025-08-29 17:51:28.000000',2),(2427,91,'2025-08-29 11:54:58.000000',3),(2428,1099,'2025-08-29 17:41:19.000000',4),(2429,55,'2025-08-30 12:50:23.000000',1),(2430,1153,'2025-08-30 12:45:31.000000',2),(2431,1401,'2025-08-30 06:51:25.000000',3),(2432,239,'2025-08-30 15:27:17.000000',4),(2433,1924,'2025-08-31 15:55:52.000000',1),(2434,397,'2025-08-31 19:35:57.000000',2),(2435,228,'2025-08-31 13:00:11.000000',3),(2436,762,'2025-08-31 22:40:04.000000',4),(2437,410,'2025-09-01 01:39:50.000000',1),(2438,939,'2025-09-01 19:36:15.000000',2),(2439,146,'2025-09-01 21:30:28.000000',3),(2440,318,'2025-09-01 16:12:33.000000',4),(2441,719,'2025-09-02 18:24:27.000000',1),(2442,789,'2025-09-02 11:51:43.000000',2),(2443,515,'2025-09-02 11:42:37.000000',3),(2444,681,'2025-09-02 19:44:18.000000',4),(2445,308,'2025-09-03 05:38:24.000000',1),(2446,1709,'2025-09-03 01:30:47.000000',2),(2447,1703,'2025-09-03 01:59:18.000000',3),(2448,963,'2025-09-03 00:09:52.000000',4),(2449,960,'2025-09-04 09:13:50.000000',1),(2450,1581,'2025-09-04 05:54:12.000000',2),(2451,1381,'2025-09-04 05:05:24.000000',3),(2452,16,'2025-09-04 19:34:44.000000',4),(2453,1867,'2025-09-05 14:11:24.000000',1),(2454,1320,'2025-09-05 21:24:13.000000',2),(2455,275,'2025-09-05 14:57:36.000000',3),(2456,1346,'2025-09-05 19:36:32.000000',4),(2457,1100,'2025-09-06 21:55:41.000000',1),(2458,768,'2025-09-06 00:09:21.000000',2),(2459,700,'2025-09-06 21:36:31.000000',3),(2460,385,'2025-09-06 01:09:44.000000',4),(2461,1015,'2025-09-07 19:36:16.000000',1),(2462,1804,'2025-09-07 02:01:44.000000',2),(2463,1136,'2025-09-07 06:06:35.000000',3),(2464,1353,'2025-09-07 01:49:29.000000',4),(2465,1477,'2025-09-08 03:41:00.000000',1),(2466,1888,'2025-09-08 05:33:53.000000',2),(2467,578,'2025-09-08 00:34:48.000000',3),(2468,1991,'2025-09-08 08:56:19.000000',4),(2469,618,'2025-09-09 20:36:48.000000',1),(2470,1819,'2025-09-09 23:12:35.000000',2),(2471,990,'2025-09-09 15:28:00.000000',3),(2472,440,'2025-09-09 12:58:48.000000',4),(2473,1442,'2025-09-10 11:25:24.000000',1),(2474,1435,'2025-09-10 04:13:16.000000',2),(2475,278,'2025-09-10 01:23:34.000000',3),(2476,366,'2025-09-10 12:28:32.000000',4),(2477,447,'2025-09-11 08:30:13.000000',1),(2478,1198,'2025-09-11 01:17:23.000000',2),(2479,730,'2025-09-11 19:58:23.000000',3),(2480,1094,'2025-09-11 07:52:47.000000',4),(2481,203,'2025-09-12 17:57:31.000000',1),(2482,15,'2025-09-12 06:17:44.000000',2),(2483,453,'2025-09-12 05:59:28.000000',3),(2484,465,'2025-09-12 09:10:15.000000',4),(2485,745,'2025-09-13 00:19:44.000000',1),(2486,1979,'2025-09-13 19:42:43.000000',2),(2487,885,'2025-09-13 11:34:03.000000',3),(2488,1003,'2025-09-13 18:22:30.000000',4),(2489,1084,'2025-09-14 05:01:06.000000',1),(2490,1572,'2025-09-14 01:58:28.000000',2),(2491,100,'2025-09-14 16:21:05.000000',3),(2492,1747,'2025-09-14 04:54:25.000000',4),(2493,291,'2025-09-15 18:04:25.000000',1),(2494,1809,'2025-09-15 11:14:02.000000',2),(2495,1735,'2025-09-15 02:46:54.000000',3),(2496,691,'2025-09-15 23:44:50.000000',4),(2497,1498,'2025-09-16 18:09:44.000000',1),(2498,242,'2025-09-16 11:21:42.000000',2),(2499,1114,'2025-09-16 04:24:46.000000',3),(2500,988,'2025-09-16 05:35:17.000000',4),(2501,731,'2025-09-17 18:27:34.000000',1),(2502,993,'2025-09-17 12:26:21.000000',2),(2503,279,'2025-09-17 22:12:40.000000',3),(2504,358,'2025-09-17 22:03:36.000000',4),(2505,280,'2025-09-18 03:14:33.000000',1),(2506,105,'2025-09-18 07:04:00.000000',2),(2507,1472,'2025-09-18 09:05:07.000000',3),(2508,1012,'2025-09-18 13:01:18.000000',4),(2509,1983,'2025-09-19 21:38:38.000000',1),(2510,568,'2025-09-19 06:02:20.000000',2),(2511,941,'2025-09-19 15:56:38.000000',3),(2512,757,'2025-09-19 08:35:05.000000',4),(2513,1905,'2025-09-20 19:36:54.000000',1),(2514,1380,'2025-09-20 07:25:26.000000',2),(2515,1078,'2025-09-20 12:31:11.000000',3),(2516,46,'2025-09-20 03:03:48.000000',4),(2517,1167,'2025-09-21 17:31:36.000000',1),(2518,1765,'2025-09-21 17:26:09.000000',2),(2519,1018,'2025-09-21 05:32:41.000000',3),(2520,1458,'2025-09-21 20:25:32.000000',4),(2521,537,'2025-09-22 02:11:01.000000',1),(2522,1083,'2025-09-22 01:39:47.000000',2),(2523,1732,'2025-09-22 11:56:50.000000',3),(2524,1152,'2025-09-22 20:01:42.000000',4),(2525,302,'2025-09-23 09:00:52.000000',1),(2526,1356,'2025-09-23 15:01:18.000000',2),(2527,1052,'2025-09-23 12:17:06.000000',3),(2528,1771,'2025-09-23 02:13:05.000000',4),(2529,181,'2025-09-24 03:34:57.000000',1),(2530,1501,'2025-09-24 00:06:13.000000',2),(2531,885,'2025-09-24 17:43:41.000000',3),(2532,1305,'2025-09-24 23:53:58.000000',4),(2533,814,'2025-09-25 06:32:28.000000',1),(2534,1722,'2025-09-25 05:11:20.000000',2),(2535,1387,'2025-09-25 15:43:16.000000',3),(2536,842,'2025-09-25 11:59:59.000000',4),(2537,1519,'2025-09-26 14:30:21.000000',1),(2538,1283,'2025-09-26 23:36:49.000000',2),(2539,699,'2025-09-26 06:06:37.000000',3),(2540,1727,'2025-09-26 23:34:19.000000',4),(2541,519,'2025-09-27 08:52:36.000000',1),(2542,322,'2025-09-27 04:30:29.000000',2),(2543,1437,'2025-09-27 05:45:47.000000',3),(2544,410,'2025-09-27 20:55:43.000000',4),(2545,846,'2025-09-28 09:46:34.000000',1),(2546,378,'2025-09-28 21:23:30.000000',2),(2547,1559,'2025-09-28 06:27:22.000000',3),(2548,218,'2025-09-28 02:08:39.000000',4),(2549,112,'2025-09-29 06:38:11.000000',1),(2550,164,'2025-09-29 10:47:46.000000',2),(2551,93,'2025-09-29 01:23:49.000000',3),(2552,297,'2025-09-29 01:22:49.000000',4),(2553,800,'2025-09-30 13:39:13.000000',1),(2554,519,'2025-09-30 06:59:55.000000',2),(2555,651,'2025-09-30 10:05:28.000000',3),(2556,1694,'2025-09-30 08:44:45.000000',4),(2557,318,'2025-10-01 03:21:14.000000',1),(2558,801,'2025-10-01 09:00:34.000000',2),(2559,348,'2025-10-01 20:59:51.000000',3),(2560,1403,'2025-10-01 05:52:08.000000',4),(2561,1516,'2025-10-02 18:32:03.000000',1),(2562,175,'2025-10-02 11:19:50.000000',2),(2563,1675,'2025-10-02 00:28:28.000000',3),(2564,243,'2025-10-02 03:02:16.000000',4),(2565,1544,'2025-10-03 05:27:10.000000',1),(2566,1145,'2025-10-03 04:15:44.000000',2),(2567,1861,'2025-10-03 07:54:30.000000',3),(2568,1045,'2025-10-03 15:54:05.000000',4),(2569,1097,'2025-10-04 14:56:58.000000',1),(2570,1431,'2025-10-04 20:55:38.000000',2),(2571,1323,'2025-10-04 23:04:37.000000',3),(2572,248,'2025-10-04 10:06:53.000000',4),(2573,797,'2025-10-05 08:29:30.000000',1),(2574,907,'2025-10-05 22:18:31.000000',2),(2575,49,'2025-10-05 11:26:26.000000',3),(2576,769,'2025-10-05 16:35:39.000000',4),(2577,164,'2025-10-06 20:19:31.000000',1),(2578,191,'2025-10-06 20:50:07.000000',2),(2579,155,'2025-10-06 20:56:45.000000',3),(2580,1226,'2025-10-06 18:27:20.000000',4),(2581,1884,'2025-10-07 18:08:32.000000',1),(2582,768,'2025-10-07 10:36:20.000000',2),(2583,1626,'2025-10-07 14:13:36.000000',3),(2584,1981,'2025-10-07 06:51:26.000000',4),(2585,996,'2025-10-08 02:14:56.000000',1),(2586,1101,'2025-10-08 05:00:45.000000',2),(2587,1949,'2025-10-08 03:00:01.000000',3),(2588,1112,'2025-10-08 11:53:45.000000',4),(2589,1589,'2025-10-09 07:00:58.000000',1),(2590,172,'2025-10-09 02:14:47.000000',2),(2591,961,'2025-10-09 03:32:16.000000',3),(2592,704,'2025-10-09 23:00:08.000000',4),(2593,725,'2025-10-10 21:12:19.000000',1),(2594,1443,'2025-10-10 03:52:53.000000',2),(2595,881,'2025-10-10 02:53:55.000000',3),(2596,1752,'2025-10-10 20:08:43.000000',4),(2597,1360,'2025-10-11 20:40:30.000000',1),(2598,56,'2025-10-11 19:31:04.000000',2),(2599,820,'2025-10-11 16:45:53.000000',3),(2600,1072,'2025-10-11 22:52:16.000000',4),(2601,982,'2025-10-12 19:40:12.000000',1),(2602,1011,'2025-10-12 23:53:34.000000',2),(2603,359,'2025-10-12 12:56:04.000000',3),(2604,1724,'2025-10-12 06:43:04.000000',4),(2605,1511,'2025-10-13 11:13:48.000000',1),(2606,1184,'2025-10-13 08:54:43.000000',2),(2607,891,'2025-10-13 20:15:24.000000',3),(2608,275,'2025-10-13 16:40:22.000000',4),(2609,1206,'2025-10-14 14:28:21.000000',1),(2610,436,'2025-10-14 04:55:35.000000',2),(2611,1423,'2025-10-14 11:20:55.000000',3),(2612,1103,'2025-10-14 03:17:07.000000',4),(2613,145,'2025-10-15 08:17:04.000000',1),(2614,832,'2025-10-15 07:50:21.000000',2),(2615,498,'2025-10-15 02:22:58.000000',3),(2616,1975,'2025-10-15 22:43:19.000000',4),(2617,1026,'2025-10-16 02:16:26.000000',1),(2618,1718,'2025-10-16 06:42:21.000000',2),(2619,1409,'2025-10-16 10:56:55.000000',3),(2620,1304,'2025-10-16 03:40:11.000000',4),(2621,86,'2025-10-17 19:11:15.000000',1),(2622,1887,'2025-10-17 19:32:20.000000',2),(2623,1073,'2025-10-17 06:33:13.000000',3),(2624,1397,'2025-10-17 20:40:18.000000',4),(2625,885,'2025-10-18 21:46:39.000000',1),(2626,235,'2025-10-18 11:43:47.000000',2),(2627,494,'2025-10-18 02:52:14.000000',3),(2628,1261,'2025-10-18 20:58:32.000000',4),(2629,1511,'2025-10-19 12:41:58.000000',1),(2630,1349,'2025-10-19 04:30:35.000000',2),(2631,35,'2025-10-19 19:23:39.000000',3),(2632,521,'2025-10-19 15:53:58.000000',4),(2633,1581,'2025-10-20 07:32:33.000000',1),(2634,1347,'2025-10-20 00:12:45.000000',2),(2635,1359,'2025-10-20 08:09:24.000000',3),(2636,1702,'2025-10-20 09:04:05.000000',4),(2637,98,'2025-10-21 02:53:09.000000',1),(2638,547,'2025-10-21 21:13:00.000000',2),(2639,1505,'2025-10-21 17:08:49.000000',3),(2640,1671,'2025-10-21 14:50:36.000000',4),(2641,199,'2025-10-22 07:42:13.000000',1),(2642,730,'2025-10-22 12:46:42.000000',2),(2643,85,'2025-10-22 05:27:33.000000',3),(2644,1046,'2025-10-22 12:43:12.000000',4),(2645,1093,'2025-10-23 00:32:50.000000',1),(2646,1356,'2025-10-23 15:55:13.000000',2),(2647,1917,'2025-10-23 09:33:32.000000',3),(2648,224,'2025-10-23 14:20:13.000000',4),(2649,986,'2025-10-24 18:22:18.000000',1),(2650,722,'2025-10-24 04:01:48.000000',2),(2651,846,'2025-10-24 07:13:41.000000',3),(2652,1573,'2025-10-24 05:03:45.000000',4),(2653,258,'2025-10-25 07:08:10.000000',1),(2654,739,'2025-10-25 18:01:24.000000',2),(2655,1711,'2025-10-25 14:13:11.000000',3),(2656,1855,'2025-10-25 11:57:52.000000',4),(2657,1833,'2025-10-26 03:20:52.000000',1),(2658,139,'2025-10-26 03:55:42.000000',2),(2659,131,'2025-10-26 20:30:32.000000',3),(2660,1240,'2025-10-26 18:18:58.000000',4),(2661,376,'2025-10-27 19:25:29.000000',1),(2662,1970,'2025-10-27 12:13:41.000000',2),(2663,55,'2025-10-27 09:30:48.000000',3),(2664,1298,'2025-10-27 22:42:13.000000',4),(2665,170,'2025-10-28 09:45:00.000000',1),(2666,1540,'2025-10-28 04:54:56.000000',2),(2667,1734,'2025-10-28 05:38:55.000000',3),(2668,1084,'2025-10-28 15:05:06.000000',4),(2669,991,'2025-10-29 19:46:51.000000',1),(2670,1060,'2025-10-29 00:04:21.000000',2),(2671,1218,'2025-10-29 15:21:00.000000',3),(2672,1598,'2025-10-29 02:59:59.000000',4),(2673,1394,'2025-10-30 14:50:41.000000',1),(2674,94,'2025-10-30 15:03:21.000000',2),(2675,1244,'2025-10-30 08:27:32.000000',3),(2676,777,'2025-10-30 01:12:56.000000',4),(2677,1,'2025-10-30 16:08:25.903000',99);
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
INSERT INTO `metricas_actividad_aud` VALUES (2677,273,0,1,'2025-10-30 16:08:25.903000',99);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `permisos` VALUES (1,'','2025-10-30 16:08:00.471636',NULL,3,'/api/datos-bancarios/{id}','API'),(2,'','2025-10-30 16:08:00.599358',NULL,1,'/api/servicios/{id}','API'),(3,'','2025-10-30 16:08:00.620628',NULL,3,'/api/estados-servicio/get','API'),(4,'','2025-10-30 16:08:00.632676',NULL,0,'/api/seguridad/grupos/nuevo','API'),(5,'','2025-10-30 16:08:00.646239',NULL,3,'/api/provincias','API'),(6,'','2025-10-30 16:08:00.658408',NULL,3,'/api/seguridad/usuarios/foto','API'),(7,'','2025-10-30 16:08:00.669730',NULL,2,'/api/reportes/vistasPorLugar/{id}','API'),(8,'','2025-10-30 16:08:00.683515',NULL,2,'/api/reportes/vistasPorServicio/{id}','API'),(9,'','2025-10-30 16:08:00.697255',NULL,3,'/api/notificaciones/{id}','API'),(10,'','2025-10-30 16:08:00.712109',NULL,0,'/api/eventos/nuevo','API'),(11,'','2025-10-30 16:08:00.722413',NULL,3,'/api/estado-backup/{id}','API'),(12,'','2025-10-30 16:08:00.739119',NULL,2,'/api/backups/{id}','API'),(13,'','2025-10-30 16:08:00.751975',NULL,2,'/api/tipo-de-servicio/{id}','API'),(14,'','2025-10-30 16:08:00.767802',NULL,2,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(15,'','2025-10-30 16:08:00.781270',NULL,3,'/api/notificaciones/get','API'),(16,'','2025-10-30 16:08:00.792919',NULL,1,'/api/seguridad/permisos/actualizar/{id}','API'),(17,'','2025-10-30 16:08:00.806102',NULL,3,'/api/parametro-comision/vigente','API'),(18,'','2025-10-30 16:08:00.811564',NULL,1,'/api/estados-servicio/{id}','API'),(19,'','2025-10-30 16:08:00.824677',NULL,0,'/api/localidades','API'),(20,'','2025-10-30 16:08:00.842973',NULL,1,'/api/notificaciones/{id}','API'),(21,'','2025-10-30 16:08:00.844983',NULL,1,'/api/tipo-de-lugar/{id}','API'),(22,'','2025-10-30 16:08:00.857287',NULL,3,'/api/tipo-de-servicio/get','API'),(23,'','2025-10-30 16:08:00.872000',NULL,0,'/api/parametro-comision','API'),(24,'','2025-10-30 16:08:00.887685',NULL,3,'/api/caracteristica-de-lugar/{id}','API'),(25,'','2025-10-30 16:08:00.904452',NULL,1,'/api/resena/update/{idReseña}','API'),(26,'','2025-10-30 16:08:00.922390',NULL,0,'/api/tipo-de-lugar','API'),(27,'','2025-10-30 16:08:00.937199',NULL,0,'/api/servicios/crearServicio','API'),(28,'','2025-10-30 16:08:00.937199',NULL,3,'/api/localidades','API'),(29,'','2025-10-30 16:08:00.951059',NULL,1,'/api/seguridad/permisos/{id}','API'),(30,'','2025-10-30 16:08:00.969385',NULL,0,'/api/factura/crear','API'),(31,'','2025-10-30 16:08:00.971396',NULL,3,'/api/reportes/vistasPorServicio','API'),(32,'','2025-10-30 16:08:00.989440',NULL,1,'/api/reservas/confirmar-reserva','API'),(33,'','2025-10-30 16:08:01.002189',NULL,1,'/api/eventos/cancelar/{idEvento}','API'),(34,'','2025-10-30 16:08:01.010339',NULL,0,'/api/backups/limpiar-retencion','API'),(35,'','2025-10-30 16:08:01.017326',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles-por-grupos','API'),(36,'','2025-10-30 16:08:01.029750',NULL,1,'/api/lugares/baja/{id}','API'),(37,'','2025-10-30 16:08:01.039799',NULL,3,'/api/reportes/vistasPorServicio/obtener','API'),(38,'','2025-10-30 16:08:01.045634',NULL,3,'/api/resena/{id}','API'),(39,'','2025-10-30 16:08:01.053890',NULL,2,'/api/backups/baja-fisica-backup/{idBackup}','API'),(40,'','2025-10-30 16:08:01.062972',NULL,0,'/api/resena/getResenaPorUsuario','API'),(41,'','2025-10-30 16:08:01.075666',NULL,1,'/api/seguridad/grupos/permisos/agregar','API'),(42,'','2025-10-30 16:08:01.077403',NULL,3,'/api/estado-backup/get','API'),(43,'','2025-10-30 16:08:01.093776',NULL,3,'/api/tipo-de-lugar','API'),(44,'','2025-10-30 16:08:01.093776',NULL,1,'/api/caracteristica-de-lugar/{id}','API'),(45,'','2025-10-30 16:08:01.109964',NULL,3,'/api/parametro-comision/get','API'),(46,'','2025-10-30 16:08:01.109964',NULL,1,'/api/reportes/vistasPorLugar/{id}','API'),(47,'','2025-10-30 16:08:01.129564',NULL,1,'/api/tipo-de-servicio/baja/{id}','API'),(48,'','2025-10-30 16:08:01.129564',NULL,1,'/api/estado-backup/baja/{id}','API'),(49,'','2025-10-30 16:08:01.144848',NULL,3,'/api/eventos/{id}','API'),(50,'','2025-10-30 16:08:01.157114',NULL,3,'/api/tipo-de-servicio','API'),(51,'','2025-10-30 16:08:01.157114',NULL,3,'/api/seguridad/grupos/get','API'),(52,'','2025-10-30 16:08:01.172930',NULL,3,'/api/reportes/serviciosMasSolicitados','API'),(53,'','2025-10-30 16:08:01.188717',NULL,1,'/api/notificaciones/baja/{id}','API'),(54,'','2025-10-30 16:08:01.188717',NULL,3,'/api/lugares/get','API'),(55,'','2025-10-30 16:08:01.204558',NULL,3,'/api/seguridad/usuarios/get','API'),(56,'','2025-10-30 16:08:01.204558',NULL,3,'/api/localidades/{id}','API'),(57,'','2025-10-30 16:08:01.220570',NULL,0,'/api/reservas','API'),(58,'','2025-10-30 16:08:01.220570',NULL,0,'/api/resena','API'),(59,'','2025-10-30 16:08:01.236352',NULL,0,'/api/estado-backup','API'),(60,'','2025-10-30 16:08:01.236352',NULL,1,'/api/reportes/vistasPorLugar/baja/{id}','API'),(61,'','2025-10-30 16:08:01.252403',NULL,2,'/api/parametro-comision/{id}','API'),(62,'','2025-10-30 16:08:01.252403',NULL,0,'/api/backups/realizar-backups','API'),(63,'','2025-10-30 16:08:01.268284',NULL,3,'/api/pagos','API'),(64,'','2025-10-30 16:08:01.268284',NULL,0,'/api/seguridad/usuarios/recuperar','API'),(65,'','2025-10-30 16:08:01.284177',NULL,1,'/api/seguridad/usuarios/{id}','API'),(66,'','2025-10-30 16:08:01.300348',NULL,1,'/api/estados-servicio/baja/{id}','API'),(67,'','2025-10-30 16:08:01.305244',NULL,2,'/api/estado-del-evento/{id}','API'),(68,'','2025-10-30 16:08:01.316391',NULL,1,'/api/notificaciones/{notificacionId}/leer','API'),(69,'','2025-10-30 16:08:01.325964',NULL,3,'/api/reportes/vistasPorServicio/{id}','API'),(70,'','2025-10-30 16:08:01.335548',NULL,1,'/api/localidades/baja/{id}','API'),(71,'','2025-10-30 16:08:01.337641',NULL,3,'/api/backups/{id}','API'),(72,'','2025-10-30 16:08:01.348935',NULL,1,'/api/seguridad/permisos/baja/{id}','API'),(73,'','2025-10-30 16:08:01.357765',NULL,3,'/api/eventos/obtenerLugar/{idEvento}','API'),(74,'','2025-10-30 16:08:01.362694',NULL,3,'/api/tipo-de-servicio/{id}','API'),(75,'','2025-10-30 16:08:01.362694',NULL,3,'/api/reportes/serviciosMasSolicitados/filtros','API'),(76,'','2025-10-30 16:08:01.378724',NULL,1,'/api/eventos/editar/{idEvento}','API'),(77,'','2025-10-30 16:08:01.378724',NULL,0,'/api/seguridad/permisos','API'),(78,'','2025-10-30 16:08:01.394674',NULL,0,'/api/seguridad/usuarios','API'),(79,'','2025-10-30 16:08:01.394674',NULL,1,'/api/parametro-comision/baja/{id}','API'),(80,'','2025-10-30 16:08:01.414691',NULL,1,'/api/servicios/iniciarChat','API'),(81,'','2025-10-30 16:08:01.426421',NULL,3,'/api/seguridad/grupos/{id}','API'),(82,'','2025-10-30 16:08:01.426421',NULL,3,'/api/reportes/CantidadUsuariosActivos/get','API'),(83,'','2025-10-30 16:08:01.442380',NULL,3,'/api/reservas/get','API'),(84,'','2025-10-30 16:08:01.451141',NULL,3,'/api/reportes/vistasPorLugar/get','API'),(85,'','2025-10-30 16:08:01.458319',NULL,2,'/api/lugares/{id}','API'),(86,'','2025-10-30 16:08:01.458319',NULL,3,'/api/seguridad/usuarios','API'),(87,'','2025-10-30 16:08:01.474813',NULL,0,'/api/seguridad/usuarios/reenviar-codigo','API'),(88,'','2025-10-30 16:08:01.474813',NULL,2,'/api/notificaciones/{notificacionId}','API'),(89,'','2025-10-30 16:08:01.474813',NULL,0,'/mail/test','API'),(90,'','2025-10-30 16:08:01.494061',NULL,3,'/api/notificaciones/count','API'),(91,'','2025-10-30 16:08:01.502100',NULL,3,'/api/notificaciones/mias','API'),(92,'','2025-10-30 16:08:01.506457',NULL,3,'/api/provincias/obtenerDtosProvincia','API'),(93,'','2025-10-30 16:08:01.521819',NULL,1,'/api/seguridad/grupos/{id}','API'),(94,'','2025-10-30 16:08:01.521819',NULL,3,'/api/tipo-de-evento','API'),(95,'','2025-10-30 16:08:01.537601',NULL,0,'/api/resena/crear','API'),(96,'','2025-10-30 16:08:01.542609',NULL,1,'/api/provincias/{id}','API'),(97,'','2025-10-30 16:08:01.553251',NULL,1,'/api/seguridad/grupos/baja/{id}','API'),(98,'','2025-10-30 16:08:01.553251',NULL,1,'/api/datos-bancarios/baja/{id}','API'),(99,'','2025-10-30 16:08:01.569896',NULL,0,'/api/caracteristica-de-lugar','API'),(100,'','2025-10-30 16:08:01.569896',NULL,2,'/api/servicios/{id}','API'),(101,'','2025-10-30 16:08:01.588954',NULL,1,'/api/lugares/bajaLugar/{idLugar}','API'),(102,'','2025-10-30 16:08:01.595485',NULL,3,'/api/seguridad/permisos/pantallas','API'),(103,'','2025-10-30 16:08:01.605949',NULL,3,'/api/tipo-de-lugar/obtenerDtosTipoLugar','API'),(104,'','2025-10-30 16:08:01.616911',NULL,3,'/api/servicios/verDetalleServicio/{idServicio}','API'),(105,'','2025-10-30 16:08:01.616911',NULL,0,'/api/seguridad/usuarios/registrarse','API'),(106,'','2025-10-30 16:08:01.616911',NULL,0,'/api/seguridad/usuarios/validar-codigo','API'),(107,'','2025-10-30 16:08:01.632960',NULL,0,'/api/seguridad/roles/nuevo','API'),(108,'','2025-10-30 16:08:01.640182',NULL,3,'/api/parametro-comision/{id}','API'),(109,'','2025-10-30 16:08:01.649626',NULL,0,'/api/notificaciones/test/mensaje/{usuarioId}','API'),(110,'','2025-10-30 16:08:01.649626',NULL,2,'/api/notificaciones/{id}','API'),(111,'','2025-10-30 16:08:01.664652',NULL,3,'/api/estado-del-evento/{id}','API'),(112,'','2025-10-30 16:08:01.680431',NULL,2,'/api/tipo-de-lugar/{id}','API'),(113,'','2025-10-30 16:08:01.682450',NULL,2,'/api/seguridad/permisos/{id}','API'),(114,'','2025-10-30 16:08:01.696412',NULL,1,'/api/caracteristica-de-lugar/baja/{id}','API'),(115,'','2025-10-30 16:08:01.698334',NULL,0,'/api/seguridad/grupos','API'),(116,'','2025-10-30 16:08:01.712727',NULL,0,'/api/notificaciones/crear','API'),(117,'','2025-10-30 16:08:01.716921',NULL,2,'/api/estados-servicio/{id}','API'),(118,'','2025-10-30 16:08:01.728128',NULL,3,'/api/chat','API'),(119,'','2025-10-30 16:08:01.728128',NULL,0,'/api/notificaciones','API'),(120,'','2025-10-30 16:08:01.748869',NULL,1,'/api/pagos/baja/{id}','API'),(121,'','2025-10-30 16:08:01.748869',NULL,0,'/api/estado-del-evento','API'),(122,'','2025-10-30 16:08:01.764897',NULL,0,'/api/notificaciones/test/recordatorio/{usuarioId}','API'),(123,'','2025-10-30 16:08:01.764897',NULL,2,'/api/caracteristica-de-lugar/{id}','API'),(124,'','2025-10-30 16:08:01.780810',NULL,3,'/api/estado-del-evento','API'),(125,'','2025-10-30 16:08:01.791440',NULL,1,'/api/notificaciones/leer-todas','API'),(126,'','2025-10-30 16:08:01.792060',NULL,1,'/api/seguridad/roles/{id}/actualizar','API'),(127,'','2025-10-30 16:08:01.807501',NULL,1,'/api/tipo-de-evento/{id}','API'),(128,'','2025-10-30 16:08:01.812177',NULL,1,'/api/datos-bancarios/{id}','API'),(129,'','2025-10-30 16:08:01.823341',NULL,1,'/api/estado-del-evento/baja/{id}','API'),(130,'','2025-10-30 16:08:01.823341',NULL,1,'/api/chat/propuestas/eliminar','API'),(131,'','2025-10-30 16:08:01.839315',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles','API'),(132,'','2025-10-30 16:08:01.839315',NULL,0,'/api/backups/create','API'),(133,'','2025-10-30 16:08:01.855292',NULL,3,'/api/tipo-de-lugar/get','API'),(134,'','2025-10-30 16:08:01.855292',NULL,3,'/api/estado-del-evento/get','API'),(135,'','2025-10-30 16:08:01.881479',NULL,3,'/api/lugares/{id}','API'),(136,'','2025-10-30 16:08:01.887347',NULL,3,'/api/seguridad/roles','API'),(137,'','2025-10-30 16:08:01.887347',NULL,3,'/api/tipo-de-servicio/obtenerDtosTipoServicio','API'),(138,'','2025-10-30 16:08:01.903066',NULL,1,'/api/provincias/baja/{id}','API'),(139,'','2025-10-30 16:08:01.910354',NULL,3,'/api/servicios/obtenerDtosServicio','API'),(140,'','2025-10-30 16:08:01.918921',NULL,1,'/api/estado-backup/{id}','API'),(141,'','2025-10-30 16:08:01.918921',NULL,3,'/api/pagos/{id}','API'),(142,'','2025-10-30 16:08:01.935592',NULL,3,'/oauth2/callback','API'),(143,'','2025-10-30 16:08:01.943656',NULL,3,'/api/reservas/datosFormularioReserva/{idReserva}','API'),(144,'','2025-10-30 16:08:01.955751',NULL,3,'/api/servicios/{id}','API'),(145,'','2025-10-30 16:08:01.967244',NULL,3,'/api/pagos/get','API'),(146,'','2025-10-30 16:08:01.977981',NULL,3,'/api/caracteristica-de-lugar/get','API'),(147,'','2025-10-30 16:08:01.986405',NULL,2,'/api/seguridad/usuarios/{id}','API'),(148,'','2025-10-30 16:08:01.996890',NULL,3,'/api/parametro-comision','API'),(149,'','2025-10-30 16:08:02.007311',NULL,1,'/api/seguridad/grupos/baja','API'),(150,'','2025-10-30 16:08:02.016876',NULL,1,'/api/pagos/{id}','API'),(151,'','2025-10-30 16:08:02.016876',NULL,1,'/api/reservas/reservaAPagar','API'),(152,'','2025-10-30 16:08:02.030967',NULL,1,'/api/resena/{id}','API'),(153,'','2025-10-30 16:08:02.047248',NULL,0,'/api/pagos/crear-preferencia','API'),(154,'','2025-10-30 16:08:02.057304',NULL,3,'/api/lugares/obtenerEventosDisponibles/{fecha}/{idLugar}','API'),(155,'','2025-10-30 16:08:02.061972',NULL,0,'/api/backups','API'),(156,'','2025-10-30 16:08:02.061972',NULL,0,'/api/seguridad/usuarios/login','API'),(157,'','2025-10-30 16:08:02.077878',NULL,3,'/api/reservas/{id}','API'),(158,'','2025-10-30 16:08:02.077878',NULL,0,'/api/reportes/CantidadUsuariosActivos','API'),(159,'','2025-10-30 16:08:02.098550',NULL,3,'/api/tipo-de-lugar/{id}','API'),(160,'','2025-10-30 16:08:02.106614',NULL,3,'/api/reservas','API'),(161,'','2025-10-30 16:08:02.115114',NULL,3,'/api/backups','API'),(162,'','2025-10-30 16:08:02.120505',NULL,3,'/api/reportes/CantidadUsuariosActivos','API'),(163,'','2025-10-30 16:08:02.125677',NULL,0,'/api/lugares/modificarLugar','API'),(164,'','2025-10-30 16:08:02.142469',NULL,0,'/api/reportes/vistasPorLugar','API'),(165,'','2025-10-30 16:08:02.153309',NULL,3,'/api/seguridad/permisos/{id}','API'),(166,'','2025-10-30 16:08:02.161068',NULL,1,'/api/eventos/{id}','API'),(167,'','2025-10-30 16:08:02.168128',NULL,1,'/api/reservas/{id}','API'),(168,'','2025-10-30 16:08:02.175600',NULL,3,'/api/estados-servicio/{id}','API'),(169,'','2025-10-30 16:08:02.179188',NULL,1,'/api/lugares/iniciarReserva','API'),(170,'','2025-10-30 16:08:02.189420',NULL,1,'/api/seguridad/grupos/permiso/quitar','API'),(171,'','2025-10-30 16:08:02.189420',NULL,3,'/api/seguridad/roles/sin-privilegios','API'),(172,'','2025-10-30 16:08:02.211585',NULL,0,'/api/reportes/vistasPorServicio','API'),(173,'','2025-10-30 16:08:02.221833',NULL,3,'/api/datos-bancarios/get','API'),(174,'','2025-10-30 16:08:02.231901',NULL,1,'/api/seguridad/usuarios/baja/{id}','API'),(175,'','2025-10-30 16:08:02.235927',NULL,0,'/api/pagos/sincronizar','API'),(176,'','2025-10-30 16:08:02.247153',NULL,3,'/api/seguridad/permisos/get','API'),(177,'','2025-10-30 16:08:02.251159',NULL,0,'/api/seguridad/usuarios/cambiar-contrasena','API'),(178,'','2025-10-30 16:08:02.251159',NULL,1,'/api/localidades/{id}','API'),(179,'','2025-10-30 16:08:02.269708',NULL,3,'/api/reportes/vistasPorLugar','API'),(180,'','2025-10-30 16:08:02.279680',NULL,3,'/api/resena','API'),(181,'','2025-10-30 16:08:02.283210',NULL,3,'/api/estado-backup','API'),(182,'','2025-10-30 16:08:02.283210',NULL,3,'/api/lugares/obtenerDtoLugares','API'),(183,'','2025-10-30 16:08:02.299021',NULL,3,'/api/resena/get','API'),(184,'','2025-10-30 16:08:02.299021',NULL,0,'/api/estados-servicio','API'),(185,'','2025-10-30 16:08:02.315564',NULL,1,'/api/reportes/CantidadUsuariosActivos/baja/{id}','API'),(186,'','2025-10-30 16:08:02.326411',NULL,3,'/api/servicios/getMisServicios','API'),(187,'','2025-10-30 16:08:02.334350',NULL,3,'/api/reportes/vistasPorLugar/{id}','API'),(188,'','2025-10-30 16:08:02.337694',NULL,2,'/api/seguridad/grupos/{id}','API'),(189,'','2025-10-30 16:08:02.348342',NULL,2,'/api/provincias/{id}','API'),(190,'','2025-10-30 16:08:02.348342',NULL,1,'/api/seguridad/roles/{id}/estado','API'),(191,'','2025-10-30 16:08:02.362715',NULL,3,'/api/estados-servicio','API'),(192,'','2025-10-30 16:08:02.377984',NULL,1,'/api/seguridad/grupos/permisos/quitar-multiple','API'),(193,'','2025-10-30 16:08:02.377984',NULL,0,'/api/tipo-de-servicio','API'),(194,'','2025-10-30 16:08:02.393715',NULL,0,'/api/servicios/modificarServicio','API'),(195,'','2025-10-30 16:08:02.393715',NULL,3,'/api/provincias/get','API'),(196,'','2025-10-30 16:08:02.412652',NULL,1,'/api/reportes/vistasPorServicio/{id}','API'),(197,'','2025-10-30 16:08:02.414659',NULL,0,'/api/notificaciones/test/alerta/{usuarioId}','API'),(198,'','2025-10-30 16:08:02.431518',NULL,3,'/api/servicios/obtenerEventosDisponibles/{fecha}/{idServicio}','API'),(199,'','2025-10-30 16:08:02.441393',NULL,3,'/api/eventos/get','API'),(200,'','2025-10-30 16:08:02.441393',NULL,3,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(201,'','2025-10-30 16:08:02.459983',NULL,1,'/api/tipo-de-lugar/baja/{id}','API'),(202,'','2025-10-30 16:08:02.469202',NULL,0,'/api/backups/restaurar/{idBackup}','API'),(203,'','2025-10-30 16:08:02.479939',NULL,1,'/api/backups/{id}','API'),(204,'','2025-10-30 16:08:02.489125',NULL,1,'/api/chat/propuestas/aceptar','API'),(205,'','2025-10-30 16:08:02.490227',NULL,1,'/api/backups/baja/{id}','API'),(206,'','2025-10-30 16:08:02.490227',NULL,1,'/api/tipo-de-servicio/{id}','API'),(207,'','2025-10-30 16:08:02.510980',NULL,2,'/api/resena/delete/{idReseña}','API'),(208,'','2025-10-30 16:08:02.510980',NULL,3,'/api/seguridad/roles/mis-reportes','API'),(209,'','2025-10-30 16:08:02.521597',NULL,3,'/api/backups/mis-backups','API'),(210,'','2025-10-30 16:08:02.530210',NULL,1,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(211,'','2025-10-30 16:08:02.536823',NULL,3,'/api/seguridad/usuarios/{id}','API'),(212,'','2025-10-30 16:08:02.543840',NULL,1,'/api/provincias/{idProvincia}/localidad/{idLocalidad}','API'),(213,'','2025-10-30 16:08:02.553265',NULL,0,'/api/pagos','API'),(214,'','2025-10-30 16:08:02.561852',NULL,3,'/api/seguridad/permisos','API'),(215,'','2025-10-30 16:08:02.568541',NULL,0,'/api/servicios','API'),(216,'','2025-10-30 16:08:02.573637',NULL,3,'/api/reportes/vistasPorLugar/obtener','API'),(217,'','2025-10-30 16:08:02.584342',NULL,3,'/api/servicios','API'),(218,'','2025-10-30 16:08:02.590705',NULL,3,'/api/reportes/vistasPorServicio/get','API'),(219,'','2025-10-30 16:08:02.599395',NULL,3,'/api/eventos/obtenerServicios/{idEvento}','API'),(220,'','2025-10-30 16:08:02.604146',NULL,3,'/api/pagos/disponibles','API'),(221,'','2025-10-30 16:08:02.615249',NULL,0,'/api/notificaciones/test/propuesta/{usuarioId}','API'),(222,'','2025-10-30 16:08:02.615249',NULL,3,'/api/localidades/get','API'),(223,'','2025-10-30 16:08:02.633807',NULL,0,'/api/seguridad/usuarios/perfil','API'),(224,'','2025-10-30 16:08:02.640054',NULL,3,'/api/backups/download/{idBackup}','API'),(225,'','2025-10-30 16:08:02.647648',NULL,2,'/api/tipo-de-evento/{id}','API'),(226,'','2025-10-30 16:08:02.647648',NULL,3,'/api/reportes/CantidadUsuariosActivos/obtener','API'),(227,'','2025-10-30 16:08:02.662848',NULL,2,'/api/datos-bancarios/{id}','API'),(228,'','2025-10-30 16:08:02.662848',NULL,1,'/api/tipo-de-evento/baja/{id}','API'),(229,'','2025-10-30 16:08:02.678533',NULL,0,'/api/pagos/procesar-pago','API'),(230,'','2025-10-30 16:08:02.678533',NULL,1,'/api/servicios/baja/{id}','API'),(231,'','2025-10-30 16:08:02.694954',NULL,3,'/api/seguridad/usuarios/perfil','API'),(232,'','2025-10-30 16:08:02.698078',NULL,0,'/api/datos-bancarios','API'),(233,'','2025-10-30 16:08:02.707310',NULL,0,'/api/eventos/actualizar-realizados','API'),(234,'','2025-10-30 16:08:02.713055',NULL,3,'/api/caracteristica-de-lugar/','API'),(235,'','2025-10-30 16:08:02.713055',NULL,0,'/api/eventos','API'),(236,'','2025-10-30 16:08:02.726390',NULL,2,'/api/estado-backup/{id}','API'),(237,'','2025-10-30 16:08:02.726390',NULL,1,'/api/eventos/baja/{id}','API'),(238,'','2025-10-30 16:08:02.742796',NULL,3,'/api/datos-bancarios','API'),(239,'','2025-10-30 16:08:02.748385',NULL,3,'/api/lugares/verDetalleLugar/{idLugar}','API'),(240,'','2025-10-30 16:08:02.757862',NULL,1,'/api/parametro-comision/{id}','API'),(241,'','2025-10-30 16:08:02.762548',NULL,3,'/api/provincias/{id}','API'),(242,'','2025-10-30 16:08:02.773698',NULL,0,'/api/tipo-de-evento','API'),(243,'','2025-10-30 16:08:02.773698',NULL,3,'/api/eventos','API'),(244,'','2025-10-30 16:08:02.789576',NULL,0,'/api/chat/propuesta','API'),(245,'','2025-10-30 16:08:02.789576',NULL,3,'/api/estados-servicio/todos','API'),(246,'','2025-10-30 16:08:02.805269',NULL,1,'/api/estado-del-evento/{id}','API'),(247,'','2025-10-30 16:08:02.805269',NULL,3,'/api/backups/get','API'),(248,'','2025-10-30 16:08:02.820909',NULL,0,'/api/lugares/crearLugar','API'),(249,'','2025-10-30 16:08:02.820909',NULL,3,'/api/seguridad/grupos','API'),(250,'','2025-10-30 16:08:02.836695',NULL,3,'/api/eventos/mis-eventos','API'),(251,'','2025-10-30 16:08:02.836695',NULL,3,'/api/notificaciones','API'),(252,'','2025-10-30 16:08:02.836695',NULL,1,'/api/servicios/bajaServicio/{idServicio}','API'),(253,'','2025-10-30 16:08:02.852778',NULL,2,'/api/pagos/{id}','API'),(254,'','2025-10-30 16:08:02.868529',NULL,1,'/api/resena/baja/{id}','API'),(255,'','2025-10-30 16:08:02.868529',NULL,2,'/api/resena/{id}','API'),(256,'','2025-10-30 16:08:02.883649',NULL,1,'/api/reservas/baja/{id}','API'),(257,'','2025-10-30 16:08:02.885350',NULL,1,'/api/pagos/{id}/cambiar-visibilidad','API'),(258,'','2025-10-30 16:08:02.885350',NULL,1,'/api/reportes/vistasPorServicio/baja/{id}','API'),(259,'','2025-10-30 16:08:02.900572',NULL,2,'/api/seguridad/roles/{id}','API'),(260,'','2025-10-30 16:08:02.900572',NULL,2,'/api/eventos/{id}','API'),(261,'','2025-10-30 16:08:02.916677',NULL,1,'/api/backups/baja-logica-backup/{idBackup}','API'),(262,'','2025-10-30 16:08:02.916677',NULL,2,'/api/reservas/{id}','API'),(263,'','2025-10-30 16:08:02.916677',NULL,0,'/api/lugares','API'),(264,'','2025-10-30 16:08:02.939553',NULL,3,'/api/tipo-de-evento/get','API'),(265,'','2025-10-30 16:08:02.939553',NULL,1,'/api/lugares/{id}','API'),(266,'','2025-10-30 16:08:02.948509',NULL,2,'/api/localidades/{id}','API'),(267,'','2025-10-30 16:08:02.960130',NULL,0,'/api/seguridad/grupos/permiso/agregar','API'),(268,'','2025-10-30 16:08:02.964149',NULL,3,'/api/lugares/getMisLugares','API'),(269,'','2025-10-30 16:08:02.964149',NULL,3,'/api/lugares','API'),(270,'','2025-10-30 16:08:02.979965',NULL,3,'/api/servicios/get','API'),(271,'','2025-10-30 16:08:02.984562',NULL,0,'/api/provincias','API'),(272,'','2025-10-30 16:08:02.984562',NULL,3,'/api/tipo-de-evento/{id}','API'),(273,'Acceso a ABM Backups','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/ABMBackups','PANTALLA'),(274,'Contrataciones de un evento','2025-10-30 16:08:15.846092',NULL,3,'Inicio/mis-eventos/contrataciones/:eventoId','PANTALLA'),(275,'Buscar lugares','2025-10-30 16:08:15.846092',NULL,3,'/buscar-lugares','PANTALLA'),(276,'Mis reservaciones','2025-10-30 16:08:15.846092',NULL,3,'Inicio/mis-reservaciones','PANTALLA'),(277,'Mis lugares','2025-10-30 16:08:15.846092',NULL,3,'Inicio/mis-lugares','PANTALLA'),(278,'Ver detalle de lugar','2025-10-30 16:08:15.846092',NULL,3,'/ver-detalle-lugar/:idLugar','PANTALLA'),(279,'Buscar lugares + detalle','2025-10-30 16:08:15.846092',NULL,3,'/buscar-lugares/ver-detalle-lugar/:idLugar','PANTALLA'),(280,'Configuraciones de propietario','2025-10-30 16:08:15.846092',NULL,3,'/configuracionesPropietario','PANTALLA'),(281,'Reservar','2025-10-30 16:08:15.846092',NULL,3,'/Reservar','PANTALLA'),(282,'Medio de pago','2025-10-30 16:08:15.846092',NULL,3,'/MedioPago','PANTALLA'),(283,'Descargar factura','2025-10-30 16:08:15.846092',NULL,3,'/DescargarFactura','PANTALLA'),(284,'Éxito en el pago','2025-10-30 16:08:15.846092',NULL,3,'/ExitoPago','PANTALLA'),(285,'Fallo en el pago','2025-10-30 16:08:15.846092',NULL,3,'/FalloPago','PANTALLA'),(286,'Pago pendiente','2025-10-30 16:08:15.846092',NULL,3,'/PendientePago','PANTALLA'),(287,'Usuarios activos','2025-10-30 16:08:15.846092',NULL,3,'/administracion/usuariosactivos','PANTALLA'),(288,'Buscar servicios','2025-10-30 16:08:15.846092',NULL,3,'/buscar-servicios','PANTALLA'),(289,'Mis servicios','2025-10-30 16:08:15.846092',NULL,3,'inicio/mis-servicios','PANTALLA'),(290,'Ver detalle de servicio','2025-10-30 16:08:15.846092',NULL,3,'/buscar-servicios/ver-detalle-servicio/:idServicio','PANTALLA'),(291,'Detalle de servicio','2025-10-30 16:08:15.846092',NULL,3,'/ver-detalle-servicio','PANTALLA'),(292,'Chatear','2025-10-30 16:08:15.846092',NULL,3,'/chatear','PANTALLA'),(293,'Configuraciones del Sistema','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones','PANTALLA'),(294,'Configuraciones de prestador','2025-10-30 16:08:15.846092',NULL,3,'/ConfiguracionesPrestador','PANTALLA'),(295,'Config. provincias','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/provincias','PANTALLA'),(296,'Config. localidades','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/localidades','PANTALLA'),(297,'Config. parámetro comisión','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/parametroComision','PANTALLA'),(298,'Config. estados backup','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/estadosBackup','PANTALLA'),(299,'Config. medios de pago','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/MediosDePago','PANTALLA'),(300,'Config. estado servicio','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/estadoServicio','PANTALLA'),(301,'Config. permisos','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/permisos','PANTALLA'),(302,'Config. roles','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/roles','PANTALLA'),(303,'Config. tipo de evento','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/tipo-de-evento','PANTALLA'),(304,'Config. tipo de servicio','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/tipo-de-servicio','PANTALLA'),(305,'Config. tipo de lugar','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/tipo-de-lugar','PANTALLA'),(306,'Config. características del lugar','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/caracteristicas-del-lugar','PANTALLA'),(307,'Config. estado del evento','2025-10-30 16:08:15.846092',NULL,3,'/configuraciones/estado-del-evento','PANTALLA'),(308,'Recuperar contraseña','2025-10-30 16:08:15.846092',NULL,3,'/recuperar-contraseña','PANTALLA'),(309,'Login y register','2025-10-30 16:08:15.846092',NULL,3,'/Login_y_register','PANTALLA'),(310,'Ver mis Eventos','2025-10-30 16:08:15.846092',NULL,3,'Inicio/mis-eventos','PANTALLA'),(311,'Ver mi perfil','2025-10-30 16:08:15.846092',NULL,3,'Inicio/mi-perfil','PANTALLA'),(312,'Home','2025-10-30 16:08:15.846092',NULL,3,'/Inicio','PANTALLA');
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
INSERT INTO `permisos_aud` VALUES (1,1,0,'','2025-10-30 16:08:00.471636',NULL,3,'/api/datos-bancarios/{id}','API'),(2,2,0,'','2025-10-30 16:08:00.599358',NULL,1,'/api/servicios/{id}','API'),(3,3,0,'','2025-10-30 16:08:00.620628',NULL,3,'/api/estados-servicio/get','API'),(4,4,0,'','2025-10-30 16:08:00.632676',NULL,0,'/api/seguridad/grupos/nuevo','API'),(5,5,0,'','2025-10-30 16:08:00.646239',NULL,3,'/api/provincias','API'),(6,6,0,'','2025-10-30 16:08:00.658408',NULL,3,'/api/seguridad/usuarios/foto','API'),(7,7,0,'','2025-10-30 16:08:00.669730',NULL,2,'/api/reportes/vistasPorLugar/{id}','API'),(8,8,0,'','2025-10-30 16:08:00.683515',NULL,2,'/api/reportes/vistasPorServicio/{id}','API'),(9,9,0,'','2025-10-30 16:08:00.697255',NULL,3,'/api/notificaciones/{id}','API'),(10,10,0,'','2025-10-30 16:08:00.712109',NULL,0,'/api/eventos/nuevo','API'),(11,11,0,'','2025-10-30 16:08:00.722413',NULL,3,'/api/estado-backup/{id}','API'),(12,12,0,'','2025-10-30 16:08:00.739119',NULL,2,'/api/backups/{id}','API'),(13,13,0,'','2025-10-30 16:08:00.751975',NULL,2,'/api/tipo-de-servicio/{id}','API'),(14,14,0,'','2025-10-30 16:08:00.767802',NULL,2,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(15,15,0,'','2025-10-30 16:08:00.781270',NULL,3,'/api/notificaciones/get','API'),(16,16,0,'','2025-10-30 16:08:00.792919',NULL,1,'/api/seguridad/permisos/actualizar/{id}','API'),(17,17,0,'','2025-10-30 16:08:00.806102',NULL,3,'/api/parametro-comision/vigente','API'),(18,18,0,'','2025-10-30 16:08:00.811564',NULL,1,'/api/estados-servicio/{id}','API'),(19,19,0,'','2025-10-30 16:08:00.824677',NULL,0,'/api/localidades','API'),(20,20,0,'','2025-10-30 16:08:00.842973',NULL,1,'/api/notificaciones/{id}','API'),(21,21,0,'','2025-10-30 16:08:00.844983',NULL,1,'/api/tipo-de-lugar/{id}','API'),(22,22,0,'','2025-10-30 16:08:00.857287',NULL,3,'/api/tipo-de-servicio/get','API'),(23,23,0,'','2025-10-30 16:08:00.872000',NULL,0,'/api/parametro-comision','API'),(24,24,0,'','2025-10-30 16:08:00.887685',NULL,3,'/api/caracteristica-de-lugar/{id}','API'),(25,25,0,'','2025-10-30 16:08:00.904452',NULL,1,'/api/resena/update/{idReseña}','API'),(26,26,0,'','2025-10-30 16:08:00.922390',NULL,0,'/api/tipo-de-lugar','API'),(27,27,0,'','2025-10-30 16:08:00.937199',NULL,0,'/api/servicios/crearServicio','API'),(28,28,0,'','2025-10-30 16:08:00.937199',NULL,3,'/api/localidades','API'),(29,29,0,'','2025-10-30 16:08:00.951059',NULL,1,'/api/seguridad/permisos/{id}','API'),(30,30,0,'','2025-10-30 16:08:00.969385',NULL,0,'/api/factura/crear','API'),(31,31,0,'','2025-10-30 16:08:00.971396',NULL,3,'/api/reportes/vistasPorServicio','API'),(32,32,0,'','2025-10-30 16:08:00.989440',NULL,1,'/api/reservas/confirmar-reserva','API'),(33,33,0,'','2025-10-30 16:08:01.002189',NULL,1,'/api/eventos/cancelar/{idEvento}','API'),(34,34,0,'','2025-10-30 16:08:01.010339',NULL,0,'/api/backups/limpiar-retencion','API'),(35,35,0,'','2025-10-30 16:08:01.017326',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles-por-grupos','API'),(36,36,0,'','2025-10-30 16:08:01.029750',NULL,1,'/api/lugares/baja/{id}','API'),(37,37,0,'','2025-10-30 16:08:01.039799',NULL,3,'/api/reportes/vistasPorServicio/obtener','API'),(38,38,0,'','2025-10-30 16:08:01.045634',NULL,3,'/api/resena/{id}','API'),(39,39,0,'','2025-10-30 16:08:01.053890',NULL,2,'/api/backups/baja-fisica-backup/{idBackup}','API'),(40,40,0,'','2025-10-30 16:08:01.062972',NULL,0,'/api/resena/getResenaPorUsuario','API'),(41,41,0,'','2025-10-30 16:08:01.075666',NULL,1,'/api/seguridad/grupos/permisos/agregar','API'),(42,42,0,'','2025-10-30 16:08:01.077403',NULL,3,'/api/estado-backup/get','API'),(43,43,0,'','2025-10-30 16:08:01.093776',NULL,3,'/api/tipo-de-lugar','API'),(44,44,0,'','2025-10-30 16:08:01.093776',NULL,1,'/api/caracteristica-de-lugar/{id}','API'),(45,45,0,'','2025-10-30 16:08:01.109964',NULL,3,'/api/parametro-comision/get','API'),(46,46,0,'','2025-10-30 16:08:01.109964',NULL,1,'/api/reportes/vistasPorLugar/{id}','API'),(47,47,0,'','2025-10-30 16:08:01.129564',NULL,1,'/api/tipo-de-servicio/baja/{id}','API'),(48,48,0,'','2025-10-30 16:08:01.129564',NULL,1,'/api/estado-backup/baja/{id}','API'),(49,49,0,'','2025-10-30 16:08:01.144848',NULL,3,'/api/eventos/{id}','API'),(50,50,0,'','2025-10-30 16:08:01.157114',NULL,3,'/api/tipo-de-servicio','API'),(51,51,0,'','2025-10-30 16:08:01.157114',NULL,3,'/api/seguridad/grupos/get','API'),(52,52,0,'','2025-10-30 16:08:01.172930',NULL,3,'/api/reportes/serviciosMasSolicitados','API'),(53,53,0,'','2025-10-30 16:08:01.188717',NULL,1,'/api/notificaciones/baja/{id}','API'),(54,54,0,'','2025-10-30 16:08:01.188717',NULL,3,'/api/lugares/get','API'),(55,55,0,'','2025-10-30 16:08:01.204558',NULL,3,'/api/seguridad/usuarios/get','API'),(56,56,0,'','2025-10-30 16:08:01.204558',NULL,3,'/api/localidades/{id}','API'),(57,57,0,'','2025-10-30 16:08:01.220570',NULL,0,'/api/reservas','API'),(58,58,0,'','2025-10-30 16:08:01.220570',NULL,0,'/api/resena','API'),(59,59,0,'','2025-10-30 16:08:01.236352',NULL,0,'/api/estado-backup','API'),(60,60,0,'','2025-10-30 16:08:01.236352',NULL,1,'/api/reportes/vistasPorLugar/baja/{id}','API'),(61,61,0,'','2025-10-30 16:08:01.252403',NULL,2,'/api/parametro-comision/{id}','API'),(62,62,0,'','2025-10-30 16:08:01.252403',NULL,0,'/api/backups/realizar-backups','API'),(63,63,0,'','2025-10-30 16:08:01.268284',NULL,3,'/api/pagos','API'),(64,64,0,'','2025-10-30 16:08:01.268284',NULL,0,'/api/seguridad/usuarios/recuperar','API'),(65,65,0,'','2025-10-30 16:08:01.284177',NULL,1,'/api/seguridad/usuarios/{id}','API'),(66,66,0,'','2025-10-30 16:08:01.300348',NULL,1,'/api/estados-servicio/baja/{id}','API'),(67,67,0,'','2025-10-30 16:08:01.305244',NULL,2,'/api/estado-del-evento/{id}','API'),(68,68,0,'','2025-10-30 16:08:01.316391',NULL,1,'/api/notificaciones/{notificacionId}/leer','API'),(69,69,0,'','2025-10-30 16:08:01.325964',NULL,3,'/api/reportes/vistasPorServicio/{id}','API'),(70,70,0,'','2025-10-30 16:08:01.335548',NULL,1,'/api/localidades/baja/{id}','API'),(71,71,0,'','2025-10-30 16:08:01.337641',NULL,3,'/api/backups/{id}','API'),(72,72,0,'','2025-10-30 16:08:01.348935',NULL,1,'/api/seguridad/permisos/baja/{id}','API'),(73,73,0,'','2025-10-30 16:08:01.357765',NULL,3,'/api/eventos/obtenerLugar/{idEvento}','API'),(74,74,0,'','2025-10-30 16:08:01.362694',NULL,3,'/api/tipo-de-servicio/{id}','API'),(75,75,0,'','2025-10-30 16:08:01.362694',NULL,3,'/api/reportes/serviciosMasSolicitados/filtros','API'),(76,76,0,'','2025-10-30 16:08:01.378724',NULL,1,'/api/eventos/editar/{idEvento}','API'),(77,77,0,'','2025-10-30 16:08:01.378724',NULL,0,'/api/seguridad/permisos','API'),(78,78,0,'','2025-10-30 16:08:01.394674',NULL,0,'/api/seguridad/usuarios','API'),(79,79,0,'','2025-10-30 16:08:01.394674',NULL,1,'/api/parametro-comision/baja/{id}','API'),(80,80,0,'','2025-10-30 16:08:01.414691',NULL,1,'/api/servicios/iniciarChat','API'),(81,81,0,'','2025-10-30 16:08:01.426421',NULL,3,'/api/seguridad/grupos/{id}','API'),(82,82,0,'','2025-10-30 16:08:01.426421',NULL,3,'/api/reportes/CantidadUsuariosActivos/get','API'),(83,83,0,'','2025-10-30 16:08:01.442380',NULL,3,'/api/reservas/get','API'),(84,84,0,'','2025-10-30 16:08:01.451141',NULL,3,'/api/reportes/vistasPorLugar/get','API'),(85,85,0,'','2025-10-30 16:08:01.458319',NULL,2,'/api/lugares/{id}','API'),(86,86,0,'','2025-10-30 16:08:01.458319',NULL,3,'/api/seguridad/usuarios','API'),(87,87,0,'','2025-10-30 16:08:01.474813',NULL,0,'/api/seguridad/usuarios/reenviar-codigo','API'),(88,88,0,'','2025-10-30 16:08:01.474813',NULL,2,'/api/notificaciones/{notificacionId}','API'),(89,89,0,'','2025-10-30 16:08:01.474813',NULL,0,'/mail/test','API'),(90,90,0,'','2025-10-30 16:08:01.494061',NULL,3,'/api/notificaciones/count','API'),(91,91,0,'','2025-10-30 16:08:01.502100',NULL,3,'/api/notificaciones/mias','API'),(92,92,0,'','2025-10-30 16:08:01.506457',NULL,3,'/api/provincias/obtenerDtosProvincia','API'),(93,93,0,'','2025-10-30 16:08:01.521819',NULL,1,'/api/seguridad/grupos/{id}','API'),(94,94,0,'','2025-10-30 16:08:01.521819',NULL,3,'/api/tipo-de-evento','API'),(95,95,0,'','2025-10-30 16:08:01.537601',NULL,0,'/api/resena/crear','API'),(96,96,0,'','2025-10-30 16:08:01.542609',NULL,1,'/api/provincias/{id}','API'),(97,97,0,'','2025-10-30 16:08:01.553251',NULL,1,'/api/seguridad/grupos/baja/{id}','API'),(98,98,0,'','2025-10-30 16:08:01.553251',NULL,1,'/api/datos-bancarios/baja/{id}','API'),(99,99,0,'','2025-10-30 16:08:01.569896',NULL,0,'/api/caracteristica-de-lugar','API'),(100,100,0,'','2025-10-30 16:08:01.569896',NULL,2,'/api/servicios/{id}','API'),(101,101,0,'','2025-10-30 16:08:01.588954',NULL,1,'/api/lugares/bajaLugar/{idLugar}','API'),(102,102,0,'','2025-10-30 16:08:01.595485',NULL,3,'/api/seguridad/permisos/pantallas','API'),(103,103,0,'','2025-10-30 16:08:01.605949',NULL,3,'/api/tipo-de-lugar/obtenerDtosTipoLugar','API'),(104,104,0,'','2025-10-30 16:08:01.616911',NULL,3,'/api/servicios/verDetalleServicio/{idServicio}','API'),(105,105,0,'','2025-10-30 16:08:01.616911',NULL,0,'/api/seguridad/usuarios/registrarse','API'),(106,106,0,'','2025-10-30 16:08:01.616911',NULL,0,'/api/seguridad/usuarios/validar-codigo','API'),(107,107,0,'','2025-10-30 16:08:01.632960',NULL,0,'/api/seguridad/roles/nuevo','API'),(108,108,0,'','2025-10-30 16:08:01.640182',NULL,3,'/api/parametro-comision/{id}','API'),(109,109,0,'','2025-10-30 16:08:01.649626',NULL,0,'/api/notificaciones/test/mensaje/{usuarioId}','API'),(110,110,0,'','2025-10-30 16:08:01.649626',NULL,2,'/api/notificaciones/{id}','API'),(111,111,0,'','2025-10-30 16:08:01.664652',NULL,3,'/api/estado-del-evento/{id}','API'),(112,112,0,'','2025-10-30 16:08:01.680431',NULL,2,'/api/tipo-de-lugar/{id}','API'),(113,113,0,'','2025-10-30 16:08:01.682450',NULL,2,'/api/seguridad/permisos/{id}','API'),(114,114,0,'','2025-10-30 16:08:01.696412',NULL,1,'/api/caracteristica-de-lugar/baja/{id}','API'),(115,115,0,'','2025-10-30 16:08:01.698334',NULL,0,'/api/seguridad/grupos','API'),(116,116,0,'','2025-10-30 16:08:01.712727',NULL,0,'/api/notificaciones/crear','API'),(117,117,0,'','2025-10-30 16:08:01.716921',NULL,2,'/api/estados-servicio/{id}','API'),(118,118,0,'','2025-10-30 16:08:01.728128',NULL,3,'/api/chat','API'),(119,119,0,'','2025-10-30 16:08:01.728128',NULL,0,'/api/notificaciones','API'),(120,120,0,'','2025-10-30 16:08:01.748869',NULL,1,'/api/pagos/baja/{id}','API'),(121,121,0,'','2025-10-30 16:08:01.748869',NULL,0,'/api/estado-del-evento','API'),(122,122,0,'','2025-10-30 16:08:01.764897',NULL,0,'/api/notificaciones/test/recordatorio/{usuarioId}','API'),(123,123,0,'','2025-10-30 16:08:01.764897',NULL,2,'/api/caracteristica-de-lugar/{id}','API'),(124,124,0,'','2025-10-30 16:08:01.780810',NULL,3,'/api/estado-del-evento','API'),(125,125,0,'','2025-10-30 16:08:01.791440',NULL,1,'/api/notificaciones/leer-todas','API'),(126,126,0,'','2025-10-30 16:08:01.792060',NULL,1,'/api/seguridad/roles/{id}/actualizar','API'),(127,127,0,'','2025-10-30 16:08:01.807501',NULL,1,'/api/tipo-de-evento/{id}','API'),(128,128,0,'','2025-10-30 16:08:01.812177',NULL,1,'/api/datos-bancarios/{id}','API'),(129,129,0,'','2025-10-30 16:08:01.823341',NULL,1,'/api/estado-del-evento/baja/{id}','API'),(130,130,0,'','2025-10-30 16:08:01.823341',NULL,1,'/api/chat/propuestas/eliminar','API'),(131,131,0,'','2025-10-30 16:08:01.839315',NULL,3,'/api/seguridad/roles/pantallas-inicio-posibles','API'),(132,132,0,'','2025-10-30 16:08:01.839315',NULL,0,'/api/backups/create','API'),(133,133,0,'','2025-10-30 16:08:01.855292',NULL,3,'/api/tipo-de-lugar/get','API'),(134,134,0,'','2025-10-30 16:08:01.855292',NULL,3,'/api/estado-del-evento/get','API'),(135,135,0,'','2025-10-30 16:08:01.881479',NULL,3,'/api/lugares/{id}','API'),(136,136,0,'','2025-10-30 16:08:01.887347',NULL,3,'/api/seguridad/roles','API'),(137,137,0,'','2025-10-30 16:08:01.887347',NULL,3,'/api/tipo-de-servicio/obtenerDtosTipoServicio','API'),(138,138,0,'','2025-10-30 16:08:01.903066',NULL,1,'/api/provincias/baja/{id}','API'),(139,139,0,'','2025-10-30 16:08:01.910354',NULL,3,'/api/servicios/obtenerDtosServicio','API'),(140,140,0,'','2025-10-30 16:08:01.918921',NULL,1,'/api/estado-backup/{id}','API'),(141,141,0,'','2025-10-30 16:08:01.918921',NULL,3,'/api/pagos/{id}','API'),(142,142,0,'','2025-10-30 16:08:01.935592',NULL,3,'/oauth2/callback','API'),(143,143,0,'','2025-10-30 16:08:01.943656',NULL,3,'/api/reservas/datosFormularioReserva/{idReserva}','API'),(144,144,0,'','2025-10-30 16:08:01.955751',NULL,3,'/api/servicios/{id}','API'),(145,145,0,'','2025-10-30 16:08:01.967244',NULL,3,'/api/pagos/get','API'),(146,146,0,'','2025-10-30 16:08:01.977981',NULL,3,'/api/caracteristica-de-lugar/get','API'),(147,147,0,'','2025-10-30 16:08:01.986405',NULL,2,'/api/seguridad/usuarios/{id}','API'),(148,148,0,'','2025-10-30 16:08:01.996890',NULL,3,'/api/parametro-comision','API'),(149,149,0,'','2025-10-30 16:08:02.007311',NULL,1,'/api/seguridad/grupos/baja','API'),(150,150,0,'','2025-10-30 16:08:02.016876',NULL,1,'/api/pagos/{id}','API'),(151,151,0,'','2025-10-30 16:08:02.016876',NULL,1,'/api/reservas/reservaAPagar','API'),(152,152,0,'','2025-10-30 16:08:02.030967',NULL,1,'/api/resena/{id}','API'),(153,153,0,'','2025-10-30 16:08:02.047248',NULL,0,'/api/pagos/crear-preferencia','API'),(154,154,0,'','2025-10-30 16:08:02.057304',NULL,3,'/api/lugares/obtenerEventosDisponibles/{fecha}/{idLugar}','API'),(155,155,0,'','2025-10-30 16:08:02.061972',NULL,0,'/api/backups','API'),(156,156,0,'','2025-10-30 16:08:02.061972',NULL,0,'/api/seguridad/usuarios/login','API'),(157,157,0,'','2025-10-30 16:08:02.077878',NULL,3,'/api/reservas/{id}','API'),(158,158,0,'','2025-10-30 16:08:02.077878',NULL,0,'/api/reportes/CantidadUsuariosActivos','API'),(159,159,0,'','2025-10-30 16:08:02.098550',NULL,3,'/api/tipo-de-lugar/{id}','API'),(160,160,0,'','2025-10-30 16:08:02.106614',NULL,3,'/api/reservas','API'),(161,161,0,'','2025-10-30 16:08:02.115114',NULL,3,'/api/backups','API'),(162,162,0,'','2025-10-30 16:08:02.120505',NULL,3,'/api/reportes/CantidadUsuariosActivos','API'),(163,163,0,'','2025-10-30 16:08:02.125677',NULL,0,'/api/lugares/modificarLugar','API'),(164,164,0,'','2025-10-30 16:08:02.142469',NULL,0,'/api/reportes/vistasPorLugar','API'),(165,165,0,'','2025-10-30 16:08:02.153309',NULL,3,'/api/seguridad/permisos/{id}','API'),(166,166,0,'','2025-10-30 16:08:02.161068',NULL,1,'/api/eventos/{id}','API'),(167,167,0,'','2025-10-30 16:08:02.168128',NULL,1,'/api/reservas/{id}','API'),(168,168,0,'','2025-10-30 16:08:02.175600',NULL,3,'/api/estados-servicio/{id}','API'),(169,169,0,'','2025-10-30 16:08:02.179188',NULL,1,'/api/lugares/iniciarReserva','API'),(170,170,0,'','2025-10-30 16:08:02.189420',NULL,1,'/api/seguridad/grupos/permiso/quitar','API'),(171,171,0,'','2025-10-30 16:08:02.189420',NULL,3,'/api/seguridad/roles/sin-privilegios','API'),(172,172,0,'','2025-10-30 16:08:02.211585',NULL,0,'/api/reportes/vistasPorServicio','API'),(173,173,0,'','2025-10-30 16:08:02.221833',NULL,3,'/api/datos-bancarios/get','API'),(174,174,0,'','2025-10-30 16:08:02.231901',NULL,1,'/api/seguridad/usuarios/baja/{id}','API'),(175,175,0,'','2025-10-30 16:08:02.235927',NULL,0,'/api/pagos/sincronizar','API'),(176,176,0,'','2025-10-30 16:08:02.247153',NULL,3,'/api/seguridad/permisos/get','API'),(177,177,0,'','2025-10-30 16:08:02.251159',NULL,0,'/api/seguridad/usuarios/cambiar-contrasena','API'),(178,178,0,'','2025-10-30 16:08:02.251159',NULL,1,'/api/localidades/{id}','API'),(179,179,0,'','2025-10-30 16:08:02.269708',NULL,3,'/api/reportes/vistasPorLugar','API'),(180,180,0,'','2025-10-30 16:08:02.279680',NULL,3,'/api/resena','API'),(181,181,0,'','2025-10-30 16:08:02.283210',NULL,3,'/api/estado-backup','API'),(182,182,0,'','2025-10-30 16:08:02.283210',NULL,3,'/api/lugares/obtenerDtoLugares','API'),(183,183,0,'','2025-10-30 16:08:02.299021',NULL,3,'/api/resena/get','API'),(184,184,0,'','2025-10-30 16:08:02.299021',NULL,0,'/api/estados-servicio','API'),(185,185,0,'','2025-10-30 16:08:02.315564',NULL,1,'/api/reportes/CantidadUsuariosActivos/baja/{id}','API'),(186,186,0,'','2025-10-30 16:08:02.326411',NULL,3,'/api/servicios/getMisServicios','API'),(187,187,0,'','2025-10-30 16:08:02.334350',NULL,3,'/api/reportes/vistasPorLugar/{id}','API'),(188,188,0,'','2025-10-30 16:08:02.337694',NULL,2,'/api/seguridad/grupos/{id}','API'),(189,189,0,'','2025-10-30 16:08:02.348342',NULL,2,'/api/provincias/{id}','API'),(190,190,0,'','2025-10-30 16:08:02.348342',NULL,1,'/api/seguridad/roles/{id}/estado','API'),(191,191,0,'','2025-10-30 16:08:02.362715',NULL,3,'/api/estados-servicio','API'),(192,192,0,'','2025-10-30 16:08:02.377984',NULL,1,'/api/seguridad/grupos/permisos/quitar-multiple','API'),(193,193,0,'','2025-10-30 16:08:02.377984',NULL,0,'/api/tipo-de-servicio','API'),(194,194,0,'','2025-10-30 16:08:02.393715',NULL,0,'/api/servicios/modificarServicio','API'),(195,195,0,'','2025-10-30 16:08:02.393715',NULL,3,'/api/provincias/get','API'),(196,196,0,'','2025-10-30 16:08:02.412652',NULL,1,'/api/reportes/vistasPorServicio/{id}','API'),(197,197,0,'','2025-10-30 16:08:02.414659',NULL,0,'/api/notificaciones/test/alerta/{usuarioId}','API'),(198,198,0,'','2025-10-30 16:08:02.431518',NULL,3,'/api/servicios/obtenerEventosDisponibles/{fecha}/{idServicio}','API'),(199,199,0,'','2025-10-30 16:08:02.441393',NULL,3,'/api/eventos/get','API'),(200,200,0,'','2025-10-30 16:08:02.441393',NULL,3,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(201,201,0,'','2025-10-30 16:08:02.459983',NULL,1,'/api/tipo-de-lugar/baja/{id}','API'),(202,202,0,'','2025-10-30 16:08:02.469202',NULL,0,'/api/backups/restaurar/{idBackup}','API'),(203,203,0,'','2025-10-30 16:08:02.479939',NULL,1,'/api/backups/{id}','API'),(204,204,0,'','2025-10-30 16:08:02.489125',NULL,1,'/api/chat/propuestas/aceptar','API'),(205,205,0,'','2025-10-30 16:08:02.490227',NULL,1,'/api/backups/baja/{id}','API'),(206,206,0,'','2025-10-30 16:08:02.490227',NULL,1,'/api/tipo-de-servicio/{id}','API'),(207,207,0,'','2025-10-30 16:08:02.510980',NULL,2,'/api/resena/delete/{idReseña}','API'),(208,208,0,'','2025-10-30 16:08:02.510980',NULL,3,'/api/seguridad/roles/mis-reportes','API'),(209,209,0,'','2025-10-30 16:08:02.521597',NULL,3,'/api/backups/mis-backups','API'),(210,210,0,'','2025-10-30 16:08:02.530210',NULL,1,'/api/reportes/CantidadUsuariosActivos/{id}','API'),(211,211,0,'','2025-10-30 16:08:02.536823',NULL,3,'/api/seguridad/usuarios/{id}','API'),(212,212,0,'','2025-10-30 16:08:02.543840',NULL,1,'/api/provincias/{idProvincia}/localidad/{idLocalidad}','API'),(213,213,0,'','2025-10-30 16:08:02.553265',NULL,0,'/api/pagos','API'),(214,214,0,'','2025-10-30 16:08:02.561852',NULL,3,'/api/seguridad/permisos','API'),(215,215,0,'','2025-10-30 16:08:02.568541',NULL,0,'/api/servicios','API'),(216,216,0,'','2025-10-30 16:08:02.573637',NULL,3,'/api/reportes/vistasPorLugar/obtener','API'),(217,217,0,'','2025-10-30 16:08:02.584342',NULL,3,'/api/servicios','API'),(218,218,0,'','2025-10-30 16:08:02.590705',NULL,3,'/api/reportes/vistasPorServicio/get','API'),(219,219,0,'','2025-10-30 16:08:02.599395',NULL,3,'/api/eventos/obtenerServicios/{idEvento}','API'),(220,220,0,'','2025-10-30 16:08:02.604146',NULL,3,'/api/pagos/disponibles','API'),(221,221,0,'','2025-10-30 16:08:02.615249',NULL,0,'/api/notificaciones/test/propuesta/{usuarioId}','API'),(222,222,0,'','2025-10-30 16:08:02.615249',NULL,3,'/api/localidades/get','API'),(223,223,0,'','2025-10-30 16:08:02.633807',NULL,0,'/api/seguridad/usuarios/perfil','API'),(224,224,0,'','2025-10-30 16:08:02.640054',NULL,3,'/api/backups/download/{idBackup}','API'),(225,225,0,'','2025-10-30 16:08:02.647648',NULL,2,'/api/tipo-de-evento/{id}','API'),(226,226,0,'','2025-10-30 16:08:02.647648',NULL,3,'/api/reportes/CantidadUsuariosActivos/obtener','API'),(227,227,0,'','2025-10-30 16:08:02.662848',NULL,2,'/api/datos-bancarios/{id}','API'),(228,228,0,'','2025-10-30 16:08:02.662848',NULL,1,'/api/tipo-de-evento/baja/{id}','API'),(229,229,0,'','2025-10-30 16:08:02.678533',NULL,0,'/api/pagos/procesar-pago','API'),(230,230,0,'','2025-10-30 16:08:02.678533',NULL,1,'/api/servicios/baja/{id}','API'),(231,231,0,'','2025-10-30 16:08:02.694954',NULL,3,'/api/seguridad/usuarios/perfil','API'),(232,232,0,'','2025-10-30 16:08:02.698078',NULL,0,'/api/datos-bancarios','API'),(233,233,0,'','2025-10-30 16:08:02.707310',NULL,0,'/api/eventos/actualizar-realizados','API'),(234,234,0,'','2025-10-30 16:08:02.713055',NULL,3,'/api/caracteristica-de-lugar/','API'),(235,235,0,'','2025-10-30 16:08:02.713055',NULL,0,'/api/eventos','API'),(236,236,0,'','2025-10-30 16:08:02.726390',NULL,2,'/api/estado-backup/{id}','API'),(237,237,0,'','2025-10-30 16:08:02.726390',NULL,1,'/api/eventos/baja/{id}','API'),(238,238,0,'','2025-10-30 16:08:02.742796',NULL,3,'/api/datos-bancarios','API'),(239,239,0,'','2025-10-30 16:08:02.748385',NULL,3,'/api/lugares/verDetalleLugar/{idLugar}','API'),(240,240,0,'','2025-10-30 16:08:02.757862',NULL,1,'/api/parametro-comision/{id}','API'),(241,241,0,'','2025-10-30 16:08:02.762548',NULL,3,'/api/provincias/{id}','API'),(242,242,0,'','2025-10-30 16:08:02.773698',NULL,0,'/api/tipo-de-evento','API'),(243,243,0,'','2025-10-30 16:08:02.773698',NULL,3,'/api/eventos','API'),(244,244,0,'','2025-10-30 16:08:02.789576',NULL,0,'/api/chat/propuesta','API'),(245,245,0,'','2025-10-30 16:08:02.789576',NULL,3,'/api/estados-servicio/todos','API'),(246,246,0,'','2025-10-30 16:08:02.805269',NULL,1,'/api/estado-del-evento/{id}','API'),(247,247,0,'','2025-10-30 16:08:02.805269',NULL,3,'/api/backups/get','API'),(248,248,0,'','2025-10-30 16:08:02.820909',NULL,0,'/api/lugares/crearLugar','API'),(249,249,0,'','2025-10-30 16:08:02.820909',NULL,3,'/api/seguridad/grupos','API'),(250,250,0,'','2025-10-30 16:08:02.836695',NULL,3,'/api/eventos/mis-eventos','API'),(251,251,0,'','2025-10-30 16:08:02.836695',NULL,3,'/api/notificaciones','API'),(252,252,0,'','2025-10-30 16:08:02.836695',NULL,1,'/api/servicios/bajaServicio/{idServicio}','API'),(253,253,0,'','2025-10-30 16:08:02.852778',NULL,2,'/api/pagos/{id}','API'),(254,254,0,'','2025-10-30 16:08:02.868529',NULL,1,'/api/resena/baja/{id}','API'),(255,255,0,'','2025-10-30 16:08:02.868529',NULL,2,'/api/resena/{id}','API'),(256,256,0,'','2025-10-30 16:08:02.883649',NULL,1,'/api/reservas/baja/{id}','API'),(257,257,0,'','2025-10-30 16:08:02.885350',NULL,1,'/api/pagos/{id}/cambiar-visibilidad','API'),(258,258,0,'','2025-10-30 16:08:02.885350',NULL,1,'/api/reportes/vistasPorServicio/baja/{id}','API'),(259,259,0,'','2025-10-30 16:08:02.900572',NULL,2,'/api/seguridad/roles/{id}','API'),(260,260,0,'','2025-10-30 16:08:02.900572',NULL,2,'/api/eventos/{id}','API'),(261,261,0,'','2025-10-30 16:08:02.916677',NULL,1,'/api/backups/baja-logica-backup/{idBackup}','API'),(262,262,0,'','2025-10-30 16:08:02.916677',NULL,2,'/api/reservas/{id}','API'),(263,263,0,'','2025-10-30 16:08:02.916677',NULL,0,'/api/lugares','API'),(264,264,0,'','2025-10-30 16:08:02.939553',NULL,3,'/api/tipo-de-evento/get','API'),(265,265,0,'','2025-10-30 16:08:02.939553',NULL,1,'/api/lugares/{id}','API'),(266,266,0,'','2025-10-30 16:08:02.948509',NULL,2,'/api/localidades/{id}','API'),(267,267,0,'','2025-10-30 16:08:02.960130',NULL,0,'/api/seguridad/grupos/permiso/agregar','API'),(268,268,0,'','2025-10-30 16:08:02.964149',NULL,3,'/api/lugares/getMisLugares','API'),(269,269,0,'','2025-10-30 16:08:02.964149',NULL,3,'/api/lugares','API'),(270,270,0,'','2025-10-30 16:08:02.979965',NULL,3,'/api/servicios/get','API'),(271,271,0,'','2025-10-30 16:08:02.984562',NULL,0,'/api/provincias','API'),(272,272,0,'','2025-10-30 16:08:02.984562',NULL,3,'/api/tipo-de-evento/{id}','API');
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
INSERT INTO `propuestas` VALUES (1,'aaaaaaaaaaaaaaaaa','2025-10-30 16:08:15.000000',NULL,10000,2000,1),(2,'bbbbbbbbbbbbbb','2025-10-30 16:08:15.000000',NULL,20000,4000,2);
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
INSERT INTO `provincia_localidad_aud` VALUES (304,4,22,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_hora_alta` datetime(6) NOT NULL,
  `fecha_hora_baja` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_otj7kmq4jxw8xre8265k3tvxj` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `provincias` VALUES (1,'2025-10-30 16:08:15.000000',NULL,'Buenos Aires'),(2,'2025-10-30 16:08:15.000000',NULL,'Córdoba'),(3,'2025-10-30 16:08:15.000000',NULL,'Santa Fe'),(4,'2025-10-30 16:08:15.000000',NULL,'Mendoza'),(5,'2025-10-30 16:08:15.000000',NULL,'Salta'),(6,'2025-10-30 16:08:15.000000',NULL,'Tucumán'),(7,'2025-10-30 16:08:15.000000',NULL,'Misiones'),(8,'2025-10-30 16:08:15.000000',NULL,'Chubut');
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
INSERT INTO `provincias_aud` VALUES (4,304,1,'2025-10-30 16:08:15.000000',NULL,'Mendoza');
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
  `factura_id` bigint DEFAULT NULL,
  `localidad_id` bigint DEFAULT NULL,
  `lugar_id` bigint DEFAULT NULL,
  `medio_de_pago_id` bigint DEFAULT NULL,
  `organizador_id` bigint NOT NULL,
  `prestador_id` bigint NOT NULL,
  `propuesta_id` bigint DEFAULT NULL,
  `servicio_id` bigint DEFAULT NULL,
  `evento_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ci31i3f33s8aq8jpjy5rr4wvn` (`factura_id`),
  UNIQUE KEY `UK_b2r3gypxuq8xn1lgo77pkj4u3` (`propuesta_id`),
  KEY `FKbbrgmc6jwdi0d4nxnsnhhc0l2` (`localidad_id`),
  KEY `FKaj8ftmadnsml4385mahiensx6` (`lugar_id`),
  KEY `FK7c1gvrr77l2i9g05m36ltiqtv` (`medio_de_pago_id`),
  KEY `FK3lw59l89yb5egmhyurgtw7eq3` (`organizador_id`),
  KEY `FKikcadym0qx5umqxwx6yoeekg0` (`prestador_id`),
  KEY `FK4ko05njxmb92d79kfql8vc4bs` (`servicio_id`),
  KEY `FKmt6vcdg69jdxl44bk21wwf1e7` (`evento_id`),
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
INSERT INTO `reservas` VALUES (1,'arce',NULL,'alear123@gial.cm','COMPLETO','2025-10-30 16:08:15.000000',NULL,'2025-10-30 16:08:15.000000','2025-10-30 16:08:15.000000',NULL,'Ale',2000,'234567237','A',NULL,NULL,1,1,1,3,NULL,NULL,1),(2,'arce',NULL,'alear123@gial.cm','COMPLETO','2025-10-30 16:08:15.000000',NULL,'2025-10-30 16:08:15.000000','2025-10-30 16:08:15.000000',NULL,'Ale',2000,'234567237','A',NULL,NULL,2,2,1,3,NULL,NULL,1),(3,'arce',NULL,'alear123@gial.cm','COMPLETO','2025-10-30 16:08:15.000000',NULL,'2025-10-30 16:08:15.000000','2025-10-30 16:08:15.000000',NULL,'Ale',2000,'234567237','A',NULL,NULL,NULL,2,1,3,1,1,1),(4,'arce',NULL,'alear123@gial.cm','EN_CHAT','2025-10-30 16:08:15.000000',NULL,'2025-10-30 16:08:15.000000','2025-10-30 16:08:15.000000',NULL,'Ale',2000,'234567237','A',NULL,NULL,NULL,2,1,3,2,1,1),(5,'arce',NULL,'alear123@gial.cm','COMPLETO','2025-10-30 16:08:15.000000',NULL,'2025-10-30 16:08:15.000000','2025-10-30 16:08:15.000000',NULL,'Ale',2000,'234567237','A',NULL,NULL,3,1,1,3,NULL,NULL,3),(6,'arce',NULL,'alear123@gial.cm','COMPLETO','2025-10-30 16:08:15.000000',NULL,'2025-10-30 16:08:15.000000','2025-10-30 16:08:15.000000',NULL,'Ale',2000,'234567237','A',NULL,NULL,3,1,1,3,NULL,NULL,3);
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
INSERT INTO `reseña` VALUES (1,'muy buen servicio',3,'2025-10-30 16:08:15.000000',NULL,NULL,1,1,NULL),(2,'muy mal servicio',4,'2025-10-30 16:08:15.000000',NULL,NULL,2,1,NULL),(3,'muy buen servicio',5,'2025-10-30 16:08:15.000000',NULL,NULL,3,1,NULL),(4,'excelente servicio',3,'2025-10-30 16:08:15.000000',NULL,NULL,4,1,NULL),(5,'muy buen servicio',3,'2025-10-30 16:08:15.000000',NULL,NULL,1,NULL,1),(6,'muy mal servicio',4,'2025-10-30 16:08:15.000000',NULL,NULL,2,NULL,1),(7,'muy buen servicio',5,'2025-10-30 16:08:15.000000',NULL,NULL,3,NULL,1),(8,'excelente servicio',3,'2025-10-30 16:08:15.000000',NULL,NULL,4,NULL,1);
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
INSERT INTO `revision` VALUES (1,1761851280556,NULL,'2025-10-30 16:08:00.556562',NULL),(2,1761851280604,NULL,'2025-10-30 16:08:00.604333',NULL),(3,1761851280622,NULL,'2025-10-30 16:08:00.622635',NULL),(4,1761851280635,NULL,'2025-10-30 16:08:00.635695',NULL),(5,1761851280650,NULL,'2025-10-30 16:08:00.650255',NULL),(6,1761851280662,NULL,'2025-10-30 16:08:00.662695',NULL),(7,1761851280672,NULL,'2025-10-30 16:08:00.672265',NULL),(8,1761851280686,NULL,'2025-10-30 16:08:00.686783',NULL),(9,1761851280701,NULL,'2025-10-30 16:08:00.701208',NULL),(10,1761851280715,NULL,'2025-10-30 16:08:00.715608',NULL),(11,1761851280730,NULL,'2025-10-30 16:08:00.730275',NULL),(12,1761851280743,NULL,'2025-10-30 16:08:00.743934',NULL),(13,1761851280755,NULL,'2025-10-30 16:08:00.755996',NULL),(14,1761851280769,NULL,'2025-10-30 16:08:00.769811',NULL),(15,1761851280784,NULL,'2025-10-30 16:08:00.784633',NULL),(16,1761851280796,NULL,'2025-10-30 16:08:00.796944',NULL),(17,1761851280808,NULL,'2025-10-30 16:08:00.808784',NULL),(18,1761851280811,NULL,'2025-10-30 16:08:00.811564',NULL),(19,1761851280832,NULL,'2025-10-30 16:08:00.832452',NULL),(20,1761851280844,NULL,'2025-10-30 16:08:00.844983',NULL),(21,1761851280857,NULL,'2025-10-30 16:08:00.857287',NULL),(22,1761851280857,NULL,'2025-10-30 16:08:00.857287',NULL),(23,1761851280880,NULL,'2025-10-30 16:08:00.880056',NULL),(24,1761851280892,NULL,'2025-10-30 16:08:00.892526',NULL),(25,1761851280912,NULL,'2025-10-30 16:08:00.912492',NULL),(26,1761851280928,NULL,'2025-10-30 16:08:00.928423',NULL),(27,1761851280937,NULL,'2025-10-30 16:08:00.937199',NULL),(28,1761851280951,NULL,'2025-10-30 16:08:00.951059',NULL),(29,1761851280951,NULL,'2025-10-30 16:08:00.951059',NULL),(30,1761851280971,NULL,'2025-10-30 16:08:00.971396',NULL),(31,1761851280982,NULL,'2025-10-30 16:08:00.982570',NULL),(32,1761851280989,NULL,'2025-10-30 16:08:00.989440',NULL),(33,1761851281002,NULL,'2025-10-30 16:08:01.006321',NULL),(34,1761851281013,NULL,'2025-10-30 16:08:01.013711',NULL),(35,1761851281017,NULL,'2025-10-30 16:08:01.017326',NULL),(36,1761851281029,NULL,'2025-10-30 16:08:01.029750',NULL),(37,1761851281039,NULL,'2025-10-30 16:08:01.039799',NULL),(38,1761851281045,NULL,'2025-10-30 16:08:01.045634',NULL),(39,1761851281053,NULL,'2025-10-30 16:08:01.053890',NULL),(40,1761851281062,NULL,'2025-10-30 16:08:01.062972',NULL),(41,1761851281077,NULL,'2025-10-30 16:08:01.077403',NULL),(42,1761851281077,NULL,'2025-10-30 16:08:01.077403',NULL),(43,1761851281093,NULL,'2025-10-30 16:08:01.093776',NULL),(44,1761851281093,NULL,'2025-10-30 16:08:01.109317',NULL),(45,1761851281109,NULL,'2025-10-30 16:08:01.109964',NULL),(46,1761851281124,NULL,'2025-10-30 16:08:01.124973',NULL),(47,1761851281129,NULL,'2025-10-30 16:08:01.129564',NULL),(48,1761851281141,NULL,'2025-10-30 16:08:01.141031',NULL),(49,1761851281144,NULL,'2025-10-30 16:08:01.144848',NULL),(50,1761851281157,NULL,'2025-10-30 16:08:01.157114',NULL),(51,1761851281157,NULL,'2025-10-30 16:08:01.157114',NULL),(52,1761851281172,NULL,'2025-10-30 16:08:01.172930',NULL),(53,1761851281188,NULL,'2025-10-30 16:08:01.188717',NULL),(54,1761851281188,NULL,'2025-10-30 16:08:01.188717',NULL),(55,1761851281204,NULL,'2025-10-30 16:08:01.204558',NULL),(56,1761851281204,NULL,'2025-10-30 16:08:01.204558',NULL),(57,1761851281220,NULL,'2025-10-30 16:08:01.220570',NULL),(58,1761851281236,NULL,'2025-10-30 16:08:01.236352',NULL),(59,1761851281236,NULL,'2025-10-30 16:08:01.236352',NULL),(60,1761851281252,NULL,'2025-10-30 16:08:01.252403',NULL),(61,1761851281252,NULL,'2025-10-30 16:08:01.252403',NULL),(62,1761851281268,NULL,'2025-10-30 16:08:01.268284',NULL),(63,1761851281268,NULL,'2025-10-30 16:08:01.268284',NULL),(64,1761851281284,NULL,'2025-10-30 16:08:01.284177',NULL),(65,1761851281284,NULL,'2025-10-30 16:08:01.284177',NULL),(66,1761851281300,NULL,'2025-10-30 16:08:01.300348',NULL),(67,1761851281305,NULL,'2025-10-30 16:08:01.305244',NULL),(68,1761851281319,NULL,'2025-10-30 16:08:01.319174',NULL),(69,1761851281328,NULL,'2025-10-30 16:08:01.328614',NULL),(70,1761851281337,NULL,'2025-10-30 16:08:01.337641',NULL),(71,1761851281346,NULL,'2025-10-30 16:08:01.346922',NULL),(72,1761851281348,NULL,'2025-10-30 16:08:01.348935',NULL),(73,1761851281362,NULL,'2025-10-30 16:08:01.362694',NULL),(74,1761851281362,NULL,'2025-10-30 16:08:01.362694',NULL),(75,1761851281378,NULL,'2025-10-30 16:08:01.378724',NULL),(76,1761851281378,NULL,'2025-10-30 16:08:01.378724',NULL),(77,1761851281394,NULL,'2025-10-30 16:08:01.394674',NULL),(78,1761851281394,NULL,'2025-10-30 16:08:01.394674',NULL),(79,1761851281412,NULL,'2025-10-30 16:08:01.412682',NULL),(80,1761851281414,NULL,'2025-10-30 16:08:01.414691',NULL),(81,1761851281426,NULL,'2025-10-30 16:08:01.426421',NULL),(82,1761851281426,NULL,'2025-10-30 16:08:01.426421',NULL),(83,1761851281445,NULL,'2025-10-30 16:08:01.445119',NULL),(84,1761851281453,NULL,'2025-10-30 16:08:01.453147',NULL),(85,1761851281458,NULL,'2025-10-30 16:08:01.458319',NULL),(86,1761851281458,NULL,'2025-10-30 16:08:01.458319',NULL),(87,1761851281474,NULL,'2025-10-30 16:08:01.474813',NULL),(88,1761851281474,NULL,'2025-10-30 16:08:01.474813',NULL),(89,1761851281489,NULL,'2025-10-30 16:08:01.489932',NULL),(90,1761851281494,NULL,'2025-10-30 16:08:01.494061',NULL),(91,1761851281506,NULL,'2025-10-30 16:08:01.506457',NULL),(92,1761851281506,NULL,'2025-10-30 16:08:01.506457',NULL),(93,1761851281521,NULL,'2025-10-30 16:08:01.521819',NULL),(94,1761851281521,NULL,'2025-10-30 16:08:01.521819',NULL),(95,1761851281537,NULL,'2025-10-30 16:08:01.537601',NULL),(96,1761851281542,NULL,'2025-10-30 16:08:01.542609',NULL),(97,1761851281553,NULL,'2025-10-30 16:08:01.553251',NULL),(98,1761851281553,NULL,'2025-10-30 16:08:01.553251',NULL),(99,1761851281569,NULL,'2025-10-30 16:08:01.569896',NULL),(100,1761851281569,NULL,'2025-10-30 16:08:01.569896',NULL),(101,1761851281590,NULL,'2025-10-30 16:08:01.590963',NULL),(102,1761851281597,NULL,'2025-10-30 16:08:01.597493',NULL),(103,1761851281605,NULL,'2025-10-30 16:08:01.605949',NULL),(104,1761851281616,NULL,'2025-10-30 16:08:01.616911',NULL),(105,1761851281616,NULL,'2025-10-30 16:08:01.616911',NULL),(106,1761851281632,NULL,'2025-10-30 16:08:01.632960',NULL),(107,1761851281640,NULL,'2025-10-30 16:08:01.640182',NULL),(108,1761851281648,NULL,'2025-10-30 16:08:01.648851',NULL),(109,1761851281649,NULL,'2025-10-30 16:08:01.649626',NULL),(110,1761851281664,NULL,'2025-10-30 16:08:01.664652',NULL),(111,1761851281664,NULL,'2025-10-30 16:08:01.664652',NULL),(112,1761851281682,NULL,'2025-10-30 16:08:01.682450',NULL),(113,1761851281682,NULL,'2025-10-30 16:08:01.682450',NULL),(114,1761851281698,NULL,'2025-10-30 16:08:01.698334',NULL),(115,1761851281706,NULL,'2025-10-30 16:08:01.706699',NULL),(116,1761851281716,NULL,'2025-10-30 16:08:01.716921',NULL),(117,1761851281716,NULL,'2025-10-30 16:08:01.716921',NULL),(118,1761851281728,NULL,'2025-10-30 16:08:01.728128',NULL),(119,1761851281728,NULL,'2025-10-30 16:08:01.728128',NULL),(120,1761851281748,NULL,'2025-10-30 16:08:01.748869',NULL),(121,1761851281748,NULL,'2025-10-30 16:08:01.748869',NULL),(122,1761851281764,NULL,'2025-10-30 16:08:01.764897',NULL),(123,1761851281775,NULL,'2025-10-30 16:08:01.775653',NULL),(124,1761851281780,NULL,'2025-10-30 16:08:01.780810',NULL),(125,1761851281792,NULL,'2025-10-30 16:08:01.792060',NULL),(126,1761851281792,NULL,'2025-10-30 16:08:01.792060',NULL),(127,1761851281810,NULL,'2025-10-30 16:08:01.810164',NULL),(128,1761851281823,NULL,'2025-10-30 16:08:01.823341',NULL),(129,1761851281823,NULL,'2025-10-30 16:08:01.823341',NULL),(130,1761851281839,NULL,'2025-10-30 16:08:01.839315',NULL),(131,1761851281839,NULL,'2025-10-30 16:08:01.839315',NULL),(132,1761851281855,NULL,'2025-10-30 16:08:01.855292',NULL),(133,1761851281855,NULL,'2025-10-30 16:08:01.855292',NULL),(134,1761851281871,NULL,'2025-10-30 16:08:01.871461',NULL),(135,1761851281881,NULL,'2025-10-30 16:08:01.881479',NULL),(136,1761851281887,NULL,'2025-10-30 16:08:01.887347',NULL),(137,1761851281887,NULL,'2025-10-30 16:08:01.887347',NULL),(138,1761851281903,NULL,'2025-10-30 16:08:01.903066',NULL),(139,1761851281910,NULL,'2025-10-30 16:08:01.910354',NULL),(140,1761851281918,NULL,'2025-10-30 16:08:01.918921',NULL),(141,1761851281918,NULL,'2025-10-30 16:08:01.918921',NULL),(142,1761851281937,NULL,'2025-10-30 16:08:01.937610',NULL),(143,1761851281947,NULL,'2025-10-30 16:08:01.947899',NULL),(144,1761851281959,NULL,'2025-10-30 16:08:01.959762',NULL),(145,1761851281969,NULL,'2025-10-30 16:08:01.969768',NULL),(146,1761851281980,NULL,'2025-10-30 16:08:01.980372',NULL),(147,1761851281990,NULL,'2025-10-30 16:08:01.990420',NULL),(148,1761851281999,NULL,'2025-10-30 16:08:01.999269',NULL),(149,1761851282009,NULL,'2025-10-30 16:08:02.009325',NULL),(150,1761851282016,NULL,'2025-10-30 16:08:02.016876',NULL),(151,1761851282016,NULL,'2025-10-30 16:08:02.016876',NULL),(152,1761851282030,NULL,'2025-10-30 16:08:02.030967',NULL),(153,1761851282049,NULL,'2025-10-30 16:08:02.049262',NULL),(154,1761851282059,NULL,'2025-10-30 16:08:02.059312',NULL),(155,1761851282061,NULL,'2025-10-30 16:08:02.061972',NULL),(156,1761851282061,NULL,'2025-10-30 16:08:02.061972',NULL),(157,1761851282077,NULL,'2025-10-30 16:08:02.077878',NULL),(158,1761851282077,NULL,'2025-10-30 16:08:02.077878',NULL),(159,1761851282100,NULL,'2025-10-30 16:08:02.100568',NULL),(160,1761851282108,NULL,'2025-10-30 16:08:02.108629',NULL),(161,1761851282115,NULL,'2025-10-30 16:08:02.115114',NULL),(162,1761851282125,NULL,'2025-10-30 16:08:02.125677',NULL),(163,1761851282135,NULL,'2025-10-30 16:08:02.135723',NULL),(164,1761851282146,NULL,'2025-10-30 16:08:02.146833',NULL),(165,1761851282154,NULL,'2025-10-30 16:08:02.154941',NULL),(166,1761851282163,NULL,'2025-10-30 16:08:02.163773',NULL),(167,1761851282168,NULL,'2025-10-30 16:08:02.168128',NULL),(168,1761851282179,NULL,'2025-10-30 16:08:02.179188',NULL),(169,1761851282179,NULL,'2025-10-30 16:08:02.179188',NULL),(170,1761851282189,NULL,'2025-10-30 16:08:02.189420',NULL),(171,1761851282205,NULL,'2025-10-30 16:08:02.205632',NULL),(172,1761851282215,NULL,'2025-10-30 16:08:02.215945',NULL),(173,1761851282223,NULL,'2025-10-30 16:08:02.223847',NULL),(174,1761851282233,NULL,'2025-10-30 16:08:02.233915',NULL),(175,1761851282235,NULL,'2025-10-30 16:08:02.235927',NULL),(176,1761851282249,NULL,'2025-10-30 16:08:02.249156',NULL),(177,1761851282251,NULL,'2025-10-30 16:08:02.251159',NULL),(178,1761851282251,NULL,'2025-10-30 16:08:02.251159',NULL),(179,1761851282273,NULL,'2025-10-30 16:08:02.273624',NULL),(180,1761851282281,NULL,'2025-10-30 16:08:02.281695',NULL),(181,1761851282283,NULL,'2025-10-30 16:08:02.283210',NULL),(182,1761851282283,NULL,'2025-10-30 16:08:02.283210',NULL),(183,1761851282299,NULL,'2025-10-30 16:08:02.299021',NULL),(184,1761851282299,NULL,'2025-10-30 16:08:02.299021',NULL),(185,1761851282315,NULL,'2025-10-30 16:08:02.315564',NULL),(186,1761851282328,NULL,'2025-10-30 16:08:02.328260',NULL),(187,1761851282337,NULL,'2025-10-30 16:08:02.337145',NULL),(188,1761851282346,NULL,'2025-10-30 16:08:02.346328',NULL),(189,1761851282348,NULL,'2025-10-30 16:08:02.348342',NULL),(190,1761851282362,NULL,'2025-10-30 16:08:02.362715',NULL),(191,1761851282362,NULL,'2025-10-30 16:08:02.362715',NULL),(192,1761851282377,NULL,'2025-10-30 16:08:02.377984',NULL),(193,1761851282377,NULL,'2025-10-30 16:08:02.377984',NULL),(194,1761851282393,NULL,'2025-10-30 16:08:02.393715',NULL),(195,1761851282393,NULL,'2025-10-30 16:08:02.393715',NULL),(196,1761851282414,NULL,'2025-10-30 16:08:02.414659',NULL),(197,1761851282425,NULL,'2025-10-30 16:08:02.425484',NULL),(198,1761851282431,NULL,'2025-10-30 16:08:02.431518',NULL),(199,1761851282441,NULL,'2025-10-30 16:08:02.441393',NULL),(200,1761851282441,NULL,'2025-10-30 16:08:02.441393',NULL),(201,1761851282463,NULL,'2025-10-30 16:08:02.463176',NULL),(202,1761851282469,NULL,'2025-10-30 16:08:02.469202',NULL),(203,1761851282481,NULL,'2025-10-30 16:08:02.481950',NULL),(204,1761851282490,NULL,'2025-10-30 16:08:02.490227',NULL),(205,1761851282490,NULL,'2025-10-30 16:08:02.490227',NULL),(206,1761851282504,NULL,'2025-10-30 16:08:02.504854',NULL),(207,1761851282510,NULL,'2025-10-30 16:08:02.510980',NULL),(208,1761851282510,NULL,'2025-10-30 16:08:02.510980',NULL),(209,1761851282521,NULL,'2025-10-30 16:08:02.521597',NULL),(210,1761851282530,NULL,'2025-10-30 16:08:02.530210',NULL),(211,1761851282536,NULL,'2025-10-30 16:08:02.536823',NULL),(212,1761851282543,NULL,'2025-10-30 16:08:02.543840',NULL),(213,1761851282555,NULL,'2025-10-30 16:08:02.555380',NULL),(214,1761851282561,NULL,'2025-10-30 16:08:02.561852',NULL),(215,1761851282568,NULL,'2025-10-30 16:08:02.571628',NULL),(216,1761851282573,NULL,'2025-10-30 16:08:02.573637',NULL),(217,1761851282586,NULL,'2025-10-30 16:08:02.586684',NULL),(218,1761851282590,NULL,'2025-10-30 16:08:02.590705',NULL),(219,1761851282602,NULL,'2025-10-30 16:08:02.602137',NULL),(220,1761851282604,NULL,'2025-10-30 16:08:02.604146',NULL),(221,1761851282615,NULL,'2025-10-30 16:08:02.615249',NULL),(222,1761851282615,NULL,'2025-10-30 16:08:02.615249',NULL),(223,1761851282635,NULL,'2025-10-30 16:08:02.635815',NULL),(224,1761851282640,NULL,'2025-10-30 16:08:02.640054',NULL),(225,1761851282647,NULL,'2025-10-30 16:08:02.647648',NULL),(226,1761851282647,NULL,'2025-10-30 16:08:02.647648',NULL),(227,1761851282662,NULL,'2025-10-30 16:08:02.662848',NULL),(228,1761851282662,NULL,'2025-10-30 16:08:02.662848',NULL),(229,1761851282678,NULL,'2025-10-30 16:08:02.678533',NULL),(230,1761851282678,NULL,'2025-10-30 16:08:02.678533',NULL),(231,1761851282695,NULL,'2025-10-30 16:08:02.695475',NULL),(232,1761851282698,NULL,'2025-10-30 16:08:02.698078',NULL),(233,1761851282707,NULL,'2025-10-30 16:08:02.707310',NULL),(234,1761851282713,NULL,'2025-10-30 16:08:02.713055',NULL),(235,1761851282713,NULL,'2025-10-30 16:08:02.713055',NULL),(236,1761851282726,NULL,'2025-10-30 16:08:02.726390',NULL),(237,1761851282726,NULL,'2025-10-30 16:08:02.726390',NULL),(238,1761851282748,NULL,'2025-10-30 16:08:02.748385',NULL),(239,1761851282748,NULL,'2025-10-30 16:08:02.748385',NULL),(240,1761851282760,NULL,'2025-10-30 16:08:02.760539',NULL),(241,1761851282762,NULL,'2025-10-30 16:08:02.762548',NULL),(242,1761851282773,NULL,'2025-10-30 16:08:02.773698',NULL),(243,1761851282773,NULL,'2025-10-30 16:08:02.773698',NULL),(244,1761851282789,NULL,'2025-10-30 16:08:02.789576',NULL),(245,1761851282789,NULL,'2025-10-30 16:08:02.789576',NULL),(246,1761851282805,NULL,'2025-10-30 16:08:02.805269',NULL),(247,1761851282805,NULL,'2025-10-30 16:08:02.805269',NULL),(248,1761851282820,NULL,'2025-10-30 16:08:02.820909',NULL),(249,1761851282820,NULL,'2025-10-30 16:08:02.820909',NULL),(250,1761851282836,NULL,'2025-10-30 16:08:02.836695',NULL),(251,1761851282836,NULL,'2025-10-30 16:08:02.836695',NULL),(252,1761851282852,NULL,'2025-10-30 16:08:02.852778',NULL),(253,1761851282852,NULL,'2025-10-30 16:08:02.852778',NULL),(254,1761851282868,NULL,'2025-10-30 16:08:02.868529',NULL),(255,1761851282877,NULL,'2025-10-30 16:08:02.877160',NULL),(256,1761851282885,NULL,'2025-10-30 16:08:02.885350',NULL),(257,1761851282885,NULL,'2025-10-30 16:08:02.885350',NULL),(258,1761851282885,NULL,'2025-10-30 16:08:02.885350',NULL),(259,1761851282900,NULL,'2025-10-30 16:08:02.900572',NULL),(260,1761851282900,NULL,'2025-10-30 16:08:02.900572',NULL),(261,1761851282916,NULL,'2025-10-30 16:08:02.916677',NULL),(262,1761851282916,NULL,'2025-10-30 16:08:02.916677',NULL),(263,1761851282932,NULL,'2025-10-30 16:08:02.932429',NULL),(264,1761851282939,NULL,'2025-10-30 16:08:02.939553',NULL),(265,1761851282948,NULL,'2025-10-30 16:08:02.948509',NULL),(266,1761851282948,NULL,'2025-10-30 16:08:02.948509',NULL),(267,1761851282960,NULL,'2025-10-30 16:08:02.962140',NULL),(268,1761851282964,NULL,'2025-10-30 16:08:02.964149',NULL),(269,1761851282964,NULL,'2025-10-30 16:08:02.964149',NULL),(270,1761851282982,NULL,'2025-10-30 16:08:02.982553',NULL),(271,1761851282984,NULL,'2025-10-30 16:08:02.984562',NULL),(272,1761851282995,NULL,'2025-10-30 16:08:02.995764',NULL),(273,1761851305903,NULL,'2025-10-30 16:08:25.903045',NULL),(274,1761851316737,'weventlyempresa@gmail.com','2025-10-30 16:08:36.737860',99),(302,1761860426914,'weventlyempresa@gmail.com','2025-10-30 18:40:26.917156',99),(303,1761854168543,'weventlyempresa@gmail.com','2025-10-30 16:56:08.543466',99),(304,1761854168605,'weventlyempresa@gmail.com','2025-10-30 16:56:08.606063',99);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `revision_seq` VALUES (401);
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
INSERT INTO `roles` VALUES (1,_binary '','Usuario que crea y gestiona eventos dentro de la plataforma','2025-10-30 16:08:15.000000',NULL,'Organizador','Inicio',_binary '\0'),(2,_binary '','Usuario que ofrece servicios para los eventos','2025-10-30 16:08:15.000000',NULL,'Prestador','Inicio',_binary '\0'),(3,_binary '','Usuario que registra y administra lugares en la plataforma','2025-10-30 16:08:15.000000',NULL,'Propietario','Inicio',_binary '\0'),(4,_binary '','Usuario que tiene privilegios','2025-10-30 16:08:15.000000',NULL,'Admin','Inicio',_binary '');
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
INSERT INTO `servicios` VALUES (1,'el mejor servicio de catering de mendoza','2025-10-30 16:08:15.000000',NULL,'catering rosales',1,2,1),(2,'el mejor servicio de fotografía de mendoza','2025-10-30 16:08:15.000000',NULL,'fotografía rosales',2,2,2),(3,'el mejor servicio de sonido de mendoza','2025-10-30 16:08:15.000000',NULL,'sonido rosales',1,2,3);
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
INSERT INTO `servicios_soportados` VALUES (1,'2025-10-30 16:08:15.000000',NULL,1,1),(2,'2025-10-30 16:08:15.000000',NULL,2,1);
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
INSERT INTO `tipos_de_eventos` VALUES (1,'2025-10-30 16:08:15.000000',NULL,'Conferencia'),(2,'2025-10-30 16:08:15.000000',NULL,'Fiesta'),(3,'2025-10-30 16:08:15.000000',NULL,'Seminario'),(4,'2025-10-30 16:08:15.000000',NULL,'Taller'),(5,'2025-10-30 16:08:15.000000',NULL,'Reunión');
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
INSERT INTO `tipos_de_lugares` VALUES (1,'2025-10-30 16:08:15.000000',NULL,'Salón'),(2,'2025-10-30 16:08:15.000000',NULL,'Quinta'),(3,'2025-10-30 16:08:15.000000',NULL,'Hotel'),(4,'2025-10-30 16:08:15.000000',NULL,'Club'),(5,'2025-10-30 16:08:15.000000',NULL,'Espacio Abierto');
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
INSERT INTO `tipos_de_servicios` VALUES (1,'2025-10-30 16:08:15.000000',NULL,'Catering'),(2,'2025-10-30 16:08:15.000000',NULL,'Fotografía'),(3,'2025-10-30 16:08:15.000000',NULL,'Sonido'),(4,'2025-10-30 16:08:15.000000',NULL,'Decoración'),(5,'2025-10-30 16:08:15.000000',NULL,'Transporte');
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
INSERT INTO `usuario_roles` VALUES (1,'2025-10-30 16:08:15.000000',NULL,1,1),(2,'2025-10-30 16:08:15.000000',NULL,2,2),(3,'2025-10-30 16:08:15.000000',NULL,3,3),(4,'2025-10-30 16:08:15.000000',NULL,1,4),(5,'2025-10-30 16:08:15.000000',NULL,1,5),(6,'2025-10-30 16:08:15.000000',NULL,4,99);
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
INSERT INTO `usuarios` VALUES (1,'$2a$10$.Ct40vQd5JJQoX294RwYYuhBB9XJhzUTPchwCOZztQbDJD5cE3g/S','Arce','$2a$10$mPP6dMRr/fsvVFqqSQJrQeYtRm9.qB9xZjuaj1cwQYPSgpo6XH6vy','alear12373@gmail.com','2025-10-30 16:08:15.000000',NULL,'2025-10-30 16:08:15.000000','Alejandro','02617233183',1,NULL),(2,'45357644','rosales','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','cristian123@gmail.com','2025-10-30 16:08:15.000000',NULL,'2025-10-30 16:08:15.000000','cristian','2613453456',1,NULL),(3,'45357644','silva','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','silva123@gmail.com','2025-10-30 16:08:15.000000',NULL,'2025-10-30 16:08:15.000000','enzo','2613453456',1,NULL),(4,'45357644','palazzo','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','marcio23@gmail.com','2025-10-30 16:08:15.000000',NULL,'2025-10-30 16:08:15.000000','marcio','2613453456',1,NULL),(5,'45357644','arce','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','arce123@gmail.com','2025-10-30 16:08:15.000000',NULL,'2025-10-30 16:08:15.000000','alejandro','2613453456',1,NULL),(99,'','','$2a$10$HSOkCoqEYDkyfdQSRal1t.Z2b1Wi32vBaNf5Q3wC5oL23vmS/2aim','weventlyempresa@gmail.com','2025-10-30 16:08:15.000000',NULL,'1990-05-15 00:00:00.000000','Administrador','',1,NULL);
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
