# Stage 0: Cache Maven dependencies
FROM maven:3.9.4-eclipse-temurin-17 AS cache

# Set working directory
WORKDIR /app

# Step copy all pom to cache
COPY ./pom.xml .

# Step to download all dependencies
RUN mvn  dependency:go-offline dependency:resolve-plugins

# Stage 1: Build the SPI JAR using Maven and Java 17
FROM maven:3.9.4-eclipse-temurin-17 AS builder

#Add cache to current immage
COPY --from=cache /root/.m2 /root/.m2

# Set working directory
WORKDIR /app

# Copy project
COPY . .

# Package the SPI JAR
RUN mvn clean package -DskipTests

# Stage 2: Copy the JAR into the Bitnami Keycloak container
FROM bitnami/keycloak:26.0.0 AS bitnami-keycloak

# Set Keycloak directory for deployments
ENV KEYCLOAK_HOME=/opt/bitnami/keycloak
ENV DEPLOYMENTS_DIR=${KEYCLOAK_HOME}/providers

# Copy the JAR from the builder stage to the providers directory
COPY --from=builder /app/target/*.jar ${DEPLOYMENTS_DIR}/
