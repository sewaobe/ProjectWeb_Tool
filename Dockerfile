FROM tomcat:10.1-jdk21

WORKDIR /usr/local/tomcat/webapps/

COPY target/ProjectWeb.war ProjectWeb.war

EXPOSE 8088

CMD ["catalina.sh", "run"]
