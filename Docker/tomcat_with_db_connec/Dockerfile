FROM centos
RUN yum install java -y
### Download and Extarct Tomcat
ADD http://mirror.fibergrid.in/apache/tomcat/tomcat-9/v9.0.0.M17/bin/apache-tomcat-9.0.0.M17.tar.gz /opt
RUN cd /opt \
    && tar -xf apache-tomcat-9.0.0.M17.tar.gz \
    && mv apache-tomcat-9.0.0.M17 tomcat

### Tune Tomcat
RUN sed -i -e '/^tomcat.util.scan.StandardJarScanFilter.jarsToSkip/,/^xom/ d' -e '/tomcat.util.scan.StandardJarScanFilter.jarsToScan/ i tomcat.util.scan.StandardJarScanFilter.jarsToSkip=*.jar' /opt/tomcat/conf/catalina.properties
RUN sed -i -e '/org.apache.catalina.webresources/ c JAVA_OPTS="$JAVA_OPTS -Djava.protocol.handler.pkgs=org.apache.catalina.webresources -Djava.security.egd=file:/dev/./urandom"' /opt/tomcat/bin/catalina.sh 

### Download student.war and mysql jar file for connectivity
ADD https://github.com/versionit/bonafide/blob/master/tomcat/studentapp/student.war?raw=true /opt/tomcat/webapps/student.war
ADD https://github.com/versionit/bonafide/blob/master/tomcat/studentapp/mysql-connector-java-5.1.40.jar?raw=true /opt/tomcat/lib/mysql-connector-java-5.1.40.jar

## Adding DB info
ADD context.xml /opt/tomcat/conf
## Adding DB variables
ADD catalina.sh /opt/tomcat/bin
RUN chmod +x /opt/tomcat/bin/catalina.sh

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
EXPOSE 8080
