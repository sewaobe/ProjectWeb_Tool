# Bước 1: Build ứng dụng với Maven
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Bước 2: Chạy trên Tomcat
FROM tomcat:10.1-jdk21
WORKDIR /usr/local/tomcat/webapps/
COPY --from=builder /app/target/ProjectWeb-1.0.war ProjectWeb.war

# EXPOSE không ảnh hưởng đến runtime, chỉ dùng cho tài liệu
EXPOSE 8080

# Kiểm tra giá trị của $PORT
RUN echo "Using PORT: $PORT"

# Đặt Tomcat lắng nghe đúng $PORT mà Render cấp
CMD ["sh", "-c", "export CATALINA_OPTS='-Dserver.port=$PORT' && catalina.sh run"]
