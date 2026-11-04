# Wevently - Backend API

## 📋 Descripción

Backend de la aplicación Wevently para la gestión integral de eventos. Proporciona una plataforma completa que permite a organizadores crear y gestionar eventos, a propietarios publicar lugares, a prestadores ofrecer servicios, y procesar pagos de manera segura e integrada con MercadoPago.

El sistema implementa una arquitectura por dominios (Domain-Driven Design) con patrones empresariales, incluyendo comunicación en tiempo real mediante WebSockets, sistema de auditoría completo, backups automatizados y reportes analíticos.

---

## 🏗️ Arquitectura y Stack Tecnológico

### Stack Principal

#### Core Framework
- **Java 21** - Lenguaje de programación con características modernas (Records, Pattern Matching, Virtual Threads)
- **Spring Boot 3.1.5** - Framework principal con auto-configuración y convenciones sobre configuración
- **Maven** - Gestión de dependencias y ciclo de vida del proyecto

#### Spring Ecosystem
- **Spring Data JPA** - Capa de persistencia con repositorios y consultas derivadas
- **Spring Data Envers 3.4.0** - Auditoría automática de entidades con historial de cambios
- **Spring Security** - Autenticación, autorización y protección contra vulnerabilidades
- **Spring WebSocket** - Comunicación bidireccional en tiempo real para chat
- **Spring Validation** - Validación declarativa con Jakarta Bean Validation
- **Spring Scheduling** - Programación de tareas (backups automáticos)
- **Spring Async** - Procesamiento asíncrono de tareas pesadas

#### Persistencia
- **Hibernate ORM** - Mapeo objeto-relacional con lazy loading y caching
- **PostgreSQL 42.7.7** - Base de datos principal para producción
- **MySQL Connector** - Base de datos alternativa para desarrollo local

#### Seguridad
- **JWT (JJWT 0.11.5)** - Autenticación stateless con JSON Web Tokens
  - `jjwt-api` - API principal
  - `jjwt-impl` - Implementación
  - `jjwt-jackson` - Serialización JSON
- **BCrypt** - Hash seguro de contraseñas con salt

#### Utilidades
- **Lombok** - Reducción de código boilerplate (@Data, @Builder, @Slf4j)
- **Jackson 2.16.1** - Serialización/deserialización JSON
- **Apache PDFBox 2.0.29** - Generación de facturas y documentos PDF
- **Dotenv Java 3.0.0** - Carga de variables de entorno desde archivos .env
- **Spring Dotenv 3.0.0** - Integración de dotenv con Spring

#### Testing
- **Spring Boot Test** - Framework de testing con @SpringBootTest
- **Spring Security Test** - Testing de seguridad con @WithMockUser
- **JUnit 5** - Framework de testing unitario
- **Mockito** - Mocking para pruebas unitarias

### Arquitectura por Dominios (DDD)

El proyecto está organizado en **9 módulos de dominio** independientes, cada uno con responsabilidades bien definidas:

```
📦 com.wevently.wevently
├── 📁 Base                      # Clases abstractas y excepciones compartidas
│   ├── BaseController           # Controller genérico CRUD
│   ├── BaseEntity              # Entidad base con ID auto-generado
│   ├── BaseService             # Service genérico con lógica común
│   ├── BaseRepository          # Repository con métodos JPA
│   └── Excepciones/
│       └── ErrorDeNegocio      # Excepción custom para errores de negocio
│
├── 📁 UsuariosySeguridad        # Autenticación, autorización y gestión de usuarios
│   ├── Controllers/
│   │   ├── UsuariosController  # Login, registro, recuperación de contraseña
│   │   ├── RolController       # Gestión de roles
│   │   ├── PermisosController  # Gestión de permisos
│   │   ├── GrupoController     # Grupos de usuarios
│   │   ├── NotificacionController # Sistema de notificaciones
│   │   ├── DatosBancariosController # Datos bancarios para pagos
│   │   ├── OAuth2Controller    # Integración OAuth2
│   │   └── ZohoMailTestController # Testing de email con Zoho
│   ├── Services/
│   │   ├── UsuariosService     # Lógica de negocio de usuarios
│   │   ├── RecuperacionPasswordService # Recuperación de contraseña
│   │   ├── ZohoMailService     # Envío de emails con Zoho Mail OAuth
│   │   └── Jwt/
│   │       ├── SecurityConfig  # Configuración Spring Security
│   │       ├── JwtUtil         # Generación y validación de tokens
│   │       ├── JwtFilter       # Filtro para validar JWT en requests
│   │       ├── UsuarioDetailsService # Carga de usuarios para autenticación
│   │       └── TienePermisos   # Anotación custom para autorización
│   ├── Entities/
│   │   ├── Usuario             # Usuario del sistema
│   │   ├── Rol                 # Roles (ADMIN, ORGANIZADOR, PRESTADOR, etc.)
│   │   ├── Permiso             # Permisos granulares
│   │   ├── UsuarioRol          # Relación Usuario-Rol
│   │   ├── Grupo               # Agrupación de usuarios
│   │   ├── Notificacion        # Notificaciones en tiempo real
│   │   ├── RecuperacionPassword # Tokens de recuperación
│   │   ├── AlertaRecuperacionPassword # Alertas de seguridad
│   │   ├── DatosBancarios      # Información bancaria
│   │   └── Genero              # Catálogo de géneros
│   ├── Repository/
│   └── DTO/
│       ├── DtoLogin            # Credenciales de login
│       ├── DtoNuevoUsuario     # Registro de usuario
│       └── DtoPerfil           # Perfil de usuario
│
├── 📁 Eventos                   # Gestión completa de eventos
│   ├── Controllers/
│   │   ├── EventosController   # CRUD de eventos
│   │   ├── ReservaController   # Gestión de reservas
│   │   ├── ReseñaController    # Sistema de reseñas/calificaciones
│   │   ├── TipoEventoController # Tipos de eventos
│   │   └── EstadoEventoController # Estados del evento
│   ├── Services/
│   │   ├── EventoService       # Lógica de negocio de eventos
│   │   ├── ReservaService      # Procesamiento de reservas
│   │   ├── ReseñaService       # Gestión de reseñas
│   │   ├── TipoEventoService   # Catálogo de tipos
│   │   └── EstadoEventoService # Máquina de estados
│   ├── Entities/
│   │   ├── Evento              # Evento principal
│   │   ├── Reserva             # Reserva de lugar/servicio
│   │   ├── Reseña              # Calificación y comentarios
│   │   ├── TipoEvento          # Tipo (Boda, Cumpleaños, Corporativo, etc.)
│   │   ├── EstadoEvento        # Estado (Borrador, Publicado, Finalizado, etc.)
│   │   └── EventoSoportado     # Tipos de eventos soportados por lugar
│   ├── Repository/
│   ├── DTO/
│   └── Enum/
│       ├── EstadoReserva       # Estados de reserva
│       └── TipoFactura         # Tipo A o B
│
├── 📁 Lugares                   # Gestión de lugares y espacios
│   ├── Controllers/
│   │   ├── LugaresController   # CRUD de lugares
│   │   ├── CaracteristicaController # Características (WiFi, Estacionamiento, etc.)
│   │   ├── TipoLugarController # Tipos (Salón, Quinta, Hotel, etc.)
│   │   ├── ProvinciaController # Provincias de Argentina
│   │   └── LocalidadController # Localidades por provincia
│   ├── Services/
│   │   ├── LugaresService      # Lógica de negocio de lugares
│   │   ├── LugarPrecioService  # Sistema de precios dinámicos
│   │   ├── CaracteristicaService # Gestión de características
│   │   ├── TipoLugarService    # Catálogo de tipos
│   │   ├── ProvinciaService    # Datos geográficos
│   │   └── LocalidadService    # Localidades
│   ├── Entities/
│   │   ├── Lugar               # Lugar/Espacio para eventos
│   │   ├── LugarPrecio         # Precio por tipo de evento
│   │   ├── Caracteristica      # Características del lugar
│   │   ├── TipoLugar           # Tipo de lugar
│   │   ├── Provincia           # Provincia
│   │   └── Localidad           # Localidad
│   ├── Repository/
│   └── DTO/
│       ├── DtoLugar            # Lugar completo
│       ├── DtoNuevoLugar       # Creación de lugar
│       ├── DtoVerDetalleLugar  # Detalle con disponibilidad
│       ├── DtoIniciarReserva   # Iniciar reserva
│       └── DtoEventoDisponible # Eventos disponibles
│
├── 📁 Servicios                 # Servicios contratables y sistema de chat
│   ├── Controllers/
│   │   ├── ServiciosController # CRUD de servicios
│   │   ├── ChatController      # Chat en tiempo real con WebSocket
│   │   ├── TipoServicioController # Tipos de servicios
│   │   └── EstadoServicioController # Estados de servicios
│   ├── Services/
│   │   ├── ServiciosService    # Lógica de negocio
│   │   ├── ChatService         # Gestión de chats y mensajes
│   │   ├── PropuestaService    # Sistema de propuestas comerciales
│   │   ├── TipoServicioService # Catálogo de tipos
│   │   └── EstadoServicioService # Máquina de estados
│   ├── Entities/
│   │   ├── Servicio            # Servicio contratable
│   │   ├── Chat                # Conversación entre partes
│   │   ├── Mensaje             # Mensaje en chat
│   │   ├── Propuesta           # Propuesta comercial
│   │   ├── ServicioSoportado   # Servicios que ofrece un prestador
│   │   ├── TipoServicio        # Tipo (Catering, DJ, Fotografía, etc.)
│   │   └── EstadoServicio      # Estado del servicio
│   ├── Repository/
│   └── DTO/
│
├── 📁 Pagos                     # Procesamiento de pagos e integración MercadoPago
│   ├── Controllers/
│   │   ├── PagosController     # Procesamiento de pagos
│   │   ├── FacturaController   # Generación de facturas
│   │   ├── AuditoriaTransaccionController # Auditoría de transacciones
│   │   └── ParametroComisionController # Configuración de comisiones
│   ├── Services/
│   │   ├── PagosService        # Lógica de pagos
│   │   ├── FactoriaPayment     # Factory para medios de pago
│   │   ├── FacturaService      # Generación de facturas PDF
│   │   └── DistribucionFondosService # Distribución a vendedores
│   ├── Entities/
│   │   ├── MedioDePago         # Medio de pago (Tarjeta, Efectivo, etc.)
│   │   ├── BaseFacturaEntity   # Clase base para facturas
│   │   ├── FacturaA            # Factura tipo A
│   │   ├── FacturaB            # Factura tipo B
│   │   ├── ItemFactura         # Ítem de factura
│   │   ├── AuditoriaTransaccion # Registro de transacciones
│   │   └── ParametroComision   # Configuración de comisiones
│   ├── External/               # Integración con APIs externas
│   │   └── MercadoPagoCliente  # Cliente HTTP para MercadoPago
│   ├── LogoFactura/            # Logos para facturas
│   ├── Util/                   # Utilidades de pago
│   ├── Repository/
│   └── DTO/
│       ├── PaymentRequest      # Request de pago
│       ├── PaymentResult       # Resultado de pago
│       ├── PreferenceRequest   # Request de preferencia MP
│       └── PreferenceResult    # Resultado de preferencia
│
├── 📁 Reportes                  # Analytics y métricas del sistema
│   ├── CantidadUsuariosActivos/
│   │   ├── Controllers/CantidadUsuariosActivos
│   │   ├── Services/MetricaActividadService
│   │   ├── Entities/MetricaActividad
│   │   └── Repository/
│   ├── CantidadVistasPorLugar/
│   │   ├── Controllers/VistasPorLugarController
│   │   ├── Services/MetricaVistasLugarService
│   │   ├── Entities/MetricaVistasLugar
│   │   └── Repository/
│   ├── CantidadVistasPorServicio/
│   │   ├── Controllers/VistasPorServicioController
│   │   ├── Services/MetricaVistasServicioService
│   │   ├── Entities/MetricaVistasServicio
│   │   └── Repository/
│   ├── CantidadSolicitudesPorLugar/
│   │   ├── Controllers/CantidadSolicitudesPorLugarController
│   │   └── Services/
│   ├── HistorialDeEventos/
│   │   ├── Controllers/HistorialDeEventosController
│   │   └── Services/
│   ├── IngresosFinancieros/
│   │   ├── Controllers/IngresosFinancierosController
│   │   └── Services/
│   └── ServiciosMasSolicitados/
│       ├── Controllers/ServiciosMasSolicitadosController
│       └── Services/
│
├── 📁 Backups                   # Sistema automatizado de backups
│   ├── Controllers/
│   │   ├── BackupsController   # Gestión manual de backups
│   │   └── EstadoBackupController # Estados de backups
│   ├── Services/
│   │   ├── BackupsService      # Lógica de backups automáticos
│   │   └── EstadoBackupService # Gestión de estados
│   ├── Entities/
│   │   ├── BackupConfiguracion # Configuración de backup
│   │   ├── BackupFisico        # Archivo físico de backup
│   │   ├── BackupEstadoBackup  # Relación estado-backup
│   │   └── EstadoBackup        # Estado del backup
│   ├── Enums/
│   │   ├── FrecuenciaBackup    # Diario, Semanal, Mensual
│   │   └── EstadoBackupFisico  # Pendiente, Completado, Error
│   ├── Configuracion/
│   │   └── AsyncConfig         # Configuración de procesamiento asíncrono
│   ├── Repository/
│   └── DTO/
│
├── 📁 Imagenes                  # Gestión centralizada de imágenes
│   ├── Services/ImagenService  # Upload y procesamiento de imágenes
│   ├── Entities/Imagen         # Metadatos de imagen
│   └── Repository/ImagenRepository
│
└── 📁 Auditorias                # Sistema de auditoría con Envers
    ├── Revision                # Entidad de revisión
    └── CustomRevisionListener  # Listener personalizado para auditorías
```

### Patrón de Arquitectura en Capas

Cada módulo implementa una **arquitectura en capas** clara y desacoplada:

#### 1. Controller Layer (Capa de Presentación)
- **Responsabilidad**: Exposición de endpoints REST, validación de entrada, manejo de respuestas HTTP
- **Tecnologías**: Spring MVC, @RestController, @RequestMapping
- **Características**:
  - Validación con Jakarta Bean Validation (@Valid)
  - Manejo de excepciones con ResponseEntity
  - Autorización con @PreAuthorize y @TienePermisos
  - CORS configurado para frontend en localhost:5173
  - Content negotiation (JSON por defecto)

#### 2. Service Layer (Capa de Negocio)
- **Responsabilidad**: Lógica de negocio, transacciones, orquestación entre repositorios
- **Tecnologías**: @Service, @Transactional
- **Características**:
  - Transacciones ACID con Spring Transaction Management
  - Validaciones de reglas de negocio
  - Transformación entre Entities y DTOs
  - Manejo de errores con ErrorDeNegocio
  - Procesamiento asíncrono con @Async

#### 3. Repository Layer (Capa de Persistencia)
- **Responsabilidad**: Acceso a datos, consultas derivadas, queries personalizadas
- **Tecnologías**: Spring Data JPA, @Repository
- **Características**:
  - Consultas derivadas por nombre de método
  - @Query para JPQL/SQL nativo
  - Projections para DTOs
  - Paginación y ordenamiento con Pageable
  - Caching de segundo nivel con Hibernate

#### 4. Entity Layer (Capa de Dominio)
- **Responsabilidad**: Modelos de dominio, relaciones, validaciones
- **Tecnologías**: JPA, Hibernate, Lombok
- **Características**:
  - Anotaciones JPA (@Entity, @Table, @Column)
  - Relaciones (@OneToMany, @ManyToOne, @ManyToMany)
  - Lombok para reducir boilerplate (@Data, @Builder)
  - Auditoría automática con @Audited (Envers)
  - Validaciones con Bean Validation

#### 5. DTO Layer (Data Transfer Objects)
- **Responsabilidad**: Transferencia de datos entre capas, serialización JSON
- **Tecnologías**: Lombok, Jackson
- **Características**:
  - Desacoplamiento de entidades
  - Validaciones con @NotNull, @NotBlank, @Email, etc.
  - Proyecciones específicas por caso de uso
  - Serialización customizada con Jackson annotations

---

## 🚀 Instalación y Configuración

### Prerrequisitos

#### Software Requerido
- **Java Development Kit (JDK) 21** o superior
  - Oracle JDK, OpenJDK o Amazon Corretto
  - Verificar: `java -version`
- **Apache Maven 3.8+**
  - Verificar: `mvn -version`
- **PostgreSQL 13+** (Producción) o **MySQL 8+** (Desarrollo)
- **Git** para control de versiones
- **IDE recomendado**: IntelliJ IDEA Ultimate, VS Code con Extension Pack for Java

#### Herramientas Opcionales
- **Postman** o **Insomnia** para testing de API
- **DBeaver** o **pgAdmin** para gestión de base de datos
- **Docker** (opcional) para contenerización

### Clonar el Repositorio

```bash
# Clonar repositorio
git clone https://github.com/MarcioPal/Wevently-back.git
cd Wevently-back
```

### Configuración de Base de Datos

#### Opción 1: PostgreSQL (para Producción)

```bash
# Instalar PostgreSQL
# Windows: Descargar desde https://www.postgresql.org/download/
# macOS: brew install postgresql
# Linux: sudo apt-get install postgresql postgresql-contrib

# Crear base de datos
psql -U postgres
CREATE DATABASE wevently;
CREATE USER wevently_user WITH PASSWORD 'tu_password_seguro';
GRANT ALL PRIVILEGES ON DATABASE wevently TO wevently_user;
\q
```

#### Opción 2: MySQL (Desarrollo Local)

```bash
# Instalar MySQL
# Windows: Descargar desde https://dev.mysql.com/downloads/installer/
# macOS: brew install mysql
# Linux: sudo apt-get install mysql-server

# Crear base de datos
mysql -u root -p
CREATE DATABASE wevently;
CREATE USER 'wevently_user'@'localhost' IDENTIFIED BY 'tu_password_seguro';
GRANT ALL PRIVILEGES ON wevently.* TO 'wevently_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

### Variables de Entorno

Crear archivo `.env` en la raíz del proyecto:

```properties
# ============================================
# DATABASE CONFIGURATION
# ============================================

# PostgreSQL (Producción)
PG_URL=jdbc:postgresql://localhost:5432/wevently
PG_USERNAME=wevently_user
PG_PASSWORD=tu_password_seguro

# MySQL (Desarrollo)
DB_URL=jdbc:mysql://localhost:3306/wevently
DB_USERNAME=wevently_user
DB_PASSWORD=tu_password_seguro

# ============================================
# JWT CONFIGURATION
# ============================================
JWT_SECRET=G7$kPz!wQ8@rT2vLx9sB6mNf3^eZ1aCj5*D0hUq2
JWT_EXPIRATION_MS=86400000

# ============================================
# MERCADOPAGO CONFIGURATION
# ============================================
# Test credentials
MERCADOPAGO_ACCESS_TOKEN=TEST-your-test-access-token

# Production credentials (comentado por defecto)
# MERCADOPAGO_PROD_ACCESS_TOKEN=APP_USR-your-production-access-token

# ============================================
# ZOHO MAIL OAUTH CONFIGURATION
# ============================================
ZOHO_MAIL_REFRESH_TOKEN=your_refresh_token
ZOHO_MAIL_CLIENT_ID=your_client_id
ZOHO_MAIL_CLIENT_SECRET=your_client_secret
ZOHO_MAIL_REDIRECT_URI=your_redirect_uri
ZOHO_MAIL_ACCOUNT_EMAIL=noreply@wevently.com

# ============================================
# SSL/HTTPS CONFIGURATION (Opcional)
# ============================================
# SERVER_SSL_KEY_STORE=classpath:keystore.p12
# SERVER_SSL_KEY_STORE_PASSWORD=your_keystore_password
# SERVER_SSL_KEY_STORE_TYPE=PKCS12
# SERVER_SSL_KEY_ALIAS=wevently
```

### Configuración de application.properties

El archivo `src/main/resources/application.properties` ya está configurado para cargar las variables:

```properties
# Database Configuration - MySQL (Local Development)
spring.datasource.url=${DB_URL}
spring.datasource.username=${DB_USERNAME}
spring.datasource.password=${DB_PASSWORD}
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# Para usar PostgreSQL, comentar MySQL y descomentar:
# spring.datasource.url=${PG_URL}
# spring.datasource.username=${PG_USERNAME}
# spring.datasource.password=${PG_PASSWORD}
# spring.datasource.driver-class-name=org.postgresql.Driver

# Hibernate Configuration
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update
spring.jpa.defer-datasource-initialization=true

# Server Configuration
server.port=8080

# File Upload
spring.servlet.multipart.max-file-size=15MB
spring.servlet.multipart.max-request-size=16MB

# JWT Configuration
jwt.secret=${JWT_SECRET}
wevently.app.jwtExpirationMs=${JWT_EXPIRATION_MS}

# MercadoPago
mercadopago.acces-token=${MERCADOPAGO_ACCESS_TOKEN}

# Zoho Mail OAuth
zoho.mail.refresh-token=${ZOHO_MAIL_REFRESH_TOKEN}
zoho.mail.client-id=${ZOHO_MAIL_CLIENT_ID}
zoho.mail.client-secret=${ZOHO_MAIL_CLIENT_SECRET}
zoho.mail.redirect-uri=${ZOHO_MAIL_REDIRECT_URI}
zoho.mail.account-email=${ZOHO_MAIL_ACCOUNT_EMAIL}
```

### Compilación y Ejecución

```bash
# Limpiar compilaciones anteriores
mvn clean

# Compilar proyecto
mvn compile

# Ejecutar tests
mvn test

# Empaquetar aplicación (genera JAR)
mvn package

# Ejecutar aplicación en modo desarrollo
mvn spring-boot:run

# Ejecutar JAR compilado
java -jar target/wevently-0.0.1-SNAPSHOT.jar
```

La aplicación estará disponible en `http://localhost:8080`

### Verificación de Instalación

```bash
# Health check (requiere Spring Actuator configurado)
curl http://localhost:8080/actuator/health

# Verificar endpoints públicos
curl http://localhost:8080/api/seguridad/usuarios/login
```

---

## 📚 Documentación de la API

### Estructura de URLs

Todas las rutas de la API siguen el patrón: `/api/{modulo}/{recurso}`

### Base URL
- **Desarrollo**: `http://localhost:8080/api`
- **Producción**: `https://api.wevently.com/api`

### 👤 Usuarios y Seguridad

#### Autenticación

**Login**
```http
POST /api/seguridad/usuarios/login
Content-Type: application/json

{
  "email": "usuario@example.com",
  "password": "password123"
}

Response 200:
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "type": "Bearer",
  "id": 1,
  "email": "usuario@example.com",
  "roles": ["ROLE_USER", "ROLE_ORGANIZADOR"]
}
```

**Registro**
```http
POST /api/seguridad/usuarios/registrarse
Content-Type: application/json

{
  "nombre": "Juan",
  "apellido": "Pérez",
  "email": "juan@example.com",
  "password": "Password123!",
  "telefono": "+5491155555555"
}
```

**Recuperación de Contraseña**
```http
POST /api/seguridad/usuarios/recuperar?email=usuario@example.com
POST /api/seguridad/usuarios/validar-codigo?email=usuario@example.com&codigo=123456
POST /api/seguridad/usuarios/cambiar-contrasena?email=usuario@example.com&codigo=123456&nuevaContrasena=NuevaPass123!
```

### 🎪 Eventos

```http
GET /api/eventos                    # Listar todos
GET /api/eventos/get?page=0&size=10 # Con paginación
GET /api/eventos/{id}               # Obtener específico
POST /api/eventos                   # Crear (requiere auth)
PUT /api/eventos/{id}               # Actualizar
PUT /api/eventos/baja/{id}          # Baja lógica
DELETE /api/eventos/{id}            # Eliminar
```

### 📍 Lugares

```http
GET /api/lugares                    # Listar lugares
GET /api/lugares/{id}               # Ver detalle
POST /api/lugares                   # Crear (multipart/form-data)
PUT /api/lugares/{id}               # Actualizar
GET /api/lugares/caracteristicas    # Listar características
GET /api/lugares/provincias         # Listar provincias
GET /api/lugares/localidades/{provinciaId} # Localidades por provincia
```

### 🛠️ Servicios

```http
GET /api/servicios                  # Listar servicios
GET /api/servicios/{id}             # Ver detalle
POST /api/servicios                 # Crear servicio
GET /api/chat?id=123                # Obtener chat
POST /api/chat/propuesta?chatId=123 # Crear propuesta
PUT /api/chat/propuestas/aceptar?id=456 # Aceptar propuesta
```

### 💳 Pagos

```http
GET /api/pagos/disponibles          # Medios de pago disponibles
POST /api/pagos/crear-preferencia   # Crear preferencia MercadoPago
POST /api/pagos/procesar-pago       # Procesar pago con tarjeta
POST /api/pagos/sincronizar         # Sincronizar con MercadoPago
POST /api/facturas/generar          # Generar factura
GET /api/facturas/{id}/pdf          # Descargar PDF
```

### 📊 Reportes

```http
GET /api/reportes/usuarios-activos?fechaInicio=2025-01-01&fechaFin=2025-01-31
GET /api/reportes/vistas-lugares?lugarId=5
GET /api/reportes/vistas-servicios?servicioId=10
GET /api/reportes/ingresos?mes=1&anio=2025
GET /api/reportes/servicios-populares?top=10
GET /api/reportes/solicitudes-lugar?lugarId=5
GET /api/reportes/historial-eventos?usuarioId=1
```

### 🔧 Backups

```http
GET /api/backups                    # Listar configuraciones
POST /api/backups                   # Crear configuración
POST /api/backups/ejecutar/{id}     # Ejecutar backup manual
GET /api/backups/descargar/{backupId} # Descargar backup
POST /api/backups/restaurar/{backupId} # Restaurar
GET /api/backups/estados            # Listar estados
```

---

## 🛡️ Seguridad

### Sistema JWT

- **Token expira**: 24 horas (configurable)
- **Algoritmo**: HS256
- **Header**: `Authorization: Bearer {token}`

### Roles del Sistema

- **ROLE_ADMIN**: Acceso completo
- **ROLE_ORGANIZADOR**: Gestión de eventos propios
- **ROLE_PRESTADOR**: Gestión de servicios propios
- **ROLE_PROPIETARIO**: Gestión de lugares propios
- **ROLE_USER**: Funcionalidades básicas

### Códigos HTTP

- **200 OK**: Operación exitosa
- **201 Created**: Recurso creado
- **400 Bad Request**: Error de validación
- **401 Unauthorized**: Token inválido/expirado
- **403 Forbidden**: Sin permisos
- **404 Not Found**: Recurso no encontrado
- **500 Internal Server Error**: Error del servidor

---

## 💰 Integración MercadoPago

### Flujos Implementados

1. **Pago con Redirección**: Usuario redirigido a MercadoPago
2. **Pago con Card Form**: Usuario paga sin salir del sitio

### Distribución de Fondos

Sistema marketplace con comisiones automáticas:
- Comisión de plataforma configurable
- Transferencia automática a vendedores
- Auditoría completa de transacciones

---

## 🗄️ Base de Datos

### Principales Entidades

- **Usuario**: Información de usuarios del sistema
- **Evento**: Eventos organizados
- **Lugar**: Lugares/espacios para eventos
- **Servicio**: Servicios contratables
- **Reserva**: Reservaciones realizadas
- **Pago**: Transacciones de pago
- **Factura**: Facturas generadas

### Auditoría con Envers

Todas las entidades críticas tienen historial automático de cambios.

---

## 🔧 Desarrollo

### Convenciones de Código

```java
// Clases: PascalCase
public class EventoService { }

// Métodos: camelCase
public Evento findById(Long id) { }

// Constantes: UPPER_SNAKE_CASE
private static final int MAX_INTENTOS = 3;
```

### Testing

```bash
mvn test                  # Ejecutar todos los tests
mvn test -Dtest=EventoServiceTest  # Test específico
```

---

## 📝 Contribución

### Flujo Git

1. Rama principal: `main`
2. Rama de desarrollo: `develop`
3. Feature branches: `git checkout -b feature/nueva-funcionalidad`
4. Commit con mensajes descriptivos
5. Mergear a develop cuando funcione
6. NO subir código que no funciona

---

## 👥 Equipo de Desarrollo

- Alejandro Arce
- Enzo Silva
- Iván Duga
- Marcio Palazzo
- Cristian Rosales

---

## 🔗 Enlaces Útiles

- [Spring Boot Docs](https://spring.io/projects/spring-boot)
- [MercadoPago Developers](https://www.mercadopago.com.ar/developers)
- [PostgreSQL Docs](https://www.postgresql.org/docs/)
- [Diagrama de Clases](https://lucid.app/lucidchart/83def65b-9132-4a64-bca8-9799ed17afd1/edit?invitationId=inv_a06b5c02-b99a-4bad-a6ed-81ccd39449b8&page=JdTgyHSJ6xnv#)

---

**Versión:** 0.0.1-SNAPSHOT  
**Última actualización:** Noviembre 2025  
**Java:** 21  
**Spring Boot:** 3.1.5