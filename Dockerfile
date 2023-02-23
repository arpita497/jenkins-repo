FROM tomcat:8
RUN rm demo*
ARG host_name=3.109.200.151:8081
ARG artifact_id=demo
ARG version=4.0.0
RUN wget http://$host_name/repository/tomcat/com/domain/$artifact_id/$version/$artifact_id-$version.war
RUN mv $artifact_id-$version.war /usr/local/tomcat/webapps/
