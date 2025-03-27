FROM tomcat:10.1-jdk21
WORKDIR /usr/local/tomcat/webapps/
COPY --from=builder /app/target/ProjectWeb-1.0.war ProjectWeb.war

# Cấu hình Tomcat để dùng $PORT
RUN sed -i 's/port="8080"/port="'"$PORT"'"/' /usr/local/tomcat/conf/server.xml

# Expose mặc định (Render sẽ tự ánh xạ)
EXPOSE 8080

CMD ["catalina.sh", "run"]
