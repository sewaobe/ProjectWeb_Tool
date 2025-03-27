# Sử dụng Maven để build trước khi copy file WAR
FROM maven:3.9.6-eclipse-temurin-22 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Chạy WAR trên Tomcat
FROM tomcat:10.1-jdk21
WORKDIR /usr/local/tomcat/webapps/
COPY --from=builder /app/target/ProjectWeb-1.0.war ProjectWeb.war

# Sử dụng biến môi trường PORT do Render cung cấp
ENV PORT=8080
EXPOSE 8080

CMD ["sh", "-c", "catalina.sh run"]
