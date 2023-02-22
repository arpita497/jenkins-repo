FROM tomcat:8
//RUN sed -i 's/port="8080"/port="9090"/g' /usr/local/tomcat/conf/server.xml
COPY ./target/demo-4.0.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
