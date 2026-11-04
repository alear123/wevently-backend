# ----------- STAGE 1: Build JAR con Maven -----------
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

# Copiar pom y descargar dependencias (cache)
COPY pom.xml .
RUN mvn -q -e -B dependency:go-offline

# Copiar el código
COPY src ./src

# Construir JAR
RUN mvn -q -e -B clean package -DskipTests


# ----------- STAGE 2: Imagen final mínima--------------
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copiar JAR generado
COPY --from=build /app/target/*.jar app.jar

# Render asigna el puerto en $PORT
ENV PORT=8080

EXPOSE 8080

# Comando para ejecutar Spring Boot asignando el puerto dinámico
ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT} -jar app.jar"]
