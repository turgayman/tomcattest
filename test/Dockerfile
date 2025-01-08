# Tomcat Tabanlı Katman
FROM tomcat:11.0-jdk21
ADD https://jdbc.postgresql.org/download/postgresql-42.2.27.jar /usr/local/tomcat/lib/
COPY ./test/index.war /usr/local/tomcat/webapps/

COPY webapp/WEB-INF/siteresim /usr/local/tomcat/webapps/ROOT/siteresim
CMD catalina.sh run
