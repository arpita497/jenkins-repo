FROM tomcat:8
ARG host_name= 15.206.186.206:8081
ARG artifact_id= demo
ARG version= 4.0.0
RUN wget http://$host_name/repository/tomcat/com/domain/$artifact_id/$version/$artifact_id-$version.war
RUN mv $artifact_id-$version.war /usr/local/tomcat/webapps/
