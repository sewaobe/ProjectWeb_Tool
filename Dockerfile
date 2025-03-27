# Bước 1: Build ứng dụng với Maven
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Bước 2: Chạy trên Tomcat
FROM tomcat:10.1-jdk21
WORKDIR /usr/local/tomcat/webapps/
COPY --from=builder /app/target/ProjectWeb-1.0.war ProjectWeb.war

# Mặc định Tomcat chạy trên 8080
EXPOSE 8080

# Khi container chạy, chỉnh server.xml để dùng PORT
CMD sed -i "s/port=\"8080\"/port=\"$PORT\"/" /usr/local/tomcat/conf/server.xml && catalina.sh run
