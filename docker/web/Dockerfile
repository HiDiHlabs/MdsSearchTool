FROM tomcat:8.5.35-jre8

COPY dktk.war /usr/local/tomcat/webapps/
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY .mdsearch.properties /root/
COPY private-key.der /root/key/
COPY server.xml /usr/local/tomcat/conf/

ENV MDSEARCH_PROPERTIES /root/.mdsearch.properties
ENV CATALINA_OPTS "-agentlib:jdwp=transport=dt_socket,address=65395,server=y,suspend=n"


CMD ["catalina.sh", "run"]


