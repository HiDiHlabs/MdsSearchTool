FROM tomcat:8.5.35-jre8

COPY centralsearch-1.0.war /usr/local/tomcat/webapps/
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY .mdsearch.properties /root

ENV MDSEARCH_PROPERTIES /root/.mdsearch.properties
ENV CATALINA_OPTS "-agentlib:jdwp=transport=dt_socket,address=65395,server=y,suspend=n"


CMD ["catalina.sh", "run"]


