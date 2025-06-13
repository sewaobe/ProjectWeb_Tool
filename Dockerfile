# Bước 1: Dùng Maven để build .war
FROM maven:3.9.6-eclipse-temurin-22 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Bước 2: Dùng Tomcat để chạy
FROM tomcat:10.1-jdk22-temurin
COPY --from=builder /app/target/ProjectWeb-1.0.war /usr/local/tomcat/webapps/ROOT.war

# Khai báo port mà app sử dụng
EXPOSE 8088
