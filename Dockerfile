# ---------- BUILD STAGE ----------
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app

# Cache-optimering: hent dependencies separat
COPY pom.xml .
RUN mvn -q dependency:resolve

# Kopiér koden og byg jar
COPY src ./src
RUN mvn -q clean package -DskipTests

# ---------- RUNTIME STAGE ----------
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app

# Kopiér kun den kompilerede jar fra build-staget
COPY --from=build /app/target/*.jar app.jar

# Spring Boot lytter på 8080 som default
EXPOSE 8080

# Start app'en
ENTRYPOINT ["java","-jar","app.jar"]
