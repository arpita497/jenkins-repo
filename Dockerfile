FROM tomcat:8
ENV war=https://apat3.jfrog.io/artifactory/demo/com/domain/demo/4.0.0/demo-4.0.0.war
RUN sed -i 's/port="8080"/port="9090"/g' /usr/local/tomcat/conf/server.xml
#COPY ./target/demo-4.0.0.war /usr/local/tomcat/webapps/
#COPY demo/com/domain/demo/4.0.0/demo-4.0.0.war /usr/local/tomcat/webapps/ 
RUN curl -o GET "https://apat3.jfrog.io/artifactory/demo/com/domain/demo/4.0.0/demo-4.0.0.war" -H "X-JFrog-Art-Api:AKCp8nzfqG5rjp2MU9FLzNkEE8kxPCxk7ftq3vZRLRhYsymAs79NZxKNUKRcgkZZfYab17sCJ"
COPY demo-4.0.0.war /usr/local/tomcat/webapps/
RUN chmod +x /demo-4.0.0.war
EXPOSE 9090
CMD ["catalina.sh", "run"]
