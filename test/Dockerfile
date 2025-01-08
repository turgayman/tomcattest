# Tomcat Tabanlı Katman
FROM tomcat:11.0-jdk21
ADD https://jdbc.postgresql.org/download/postgresql-42.2.27.jar /usr/local/tomcat/lib/
COPY ./test/odev.war /usr/local/tomcat/webapps/

CMD catalina.sh run
