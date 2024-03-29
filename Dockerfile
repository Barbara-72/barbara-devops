FROM centos

MAINTAINER barbara.ammannati@sourcesense.com

ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.47/bin/apache-tomcat-8.5.47.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.47/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR $CATALINA_HOME/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
# ADD /var/lib/jenkins/workspace/warmaven/target/sparkjava-hello-world-1.0-SNAPSHOT.war /opt/tomcat/webapps/

EXPOSE 8080

WORKDIR $CATALINA_HOME/bin
# RUN /opt/tomcat/bin/catalina.sh start
CMD ["catalina.sh", "run"]
