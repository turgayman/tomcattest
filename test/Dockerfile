# Tomcat Tabanlı Katman
FROM tomcat:11.0-jdk21

# MongoDB'yi İndir ve Kur
RUN apt-get update && apt-get install -y gnupg wget && \
    wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add - && \
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/debian buster/mongodb-org/6.0 main" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list && \
    apt-get update && apt-get install -y mongodb-org

# MongoDB için Veri Dizini Oluştur
RUN mkdir -p /data/db

# Uygulama WAR Dosyasını Kopyala
COPY ./test/test-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/

# MongoDB ve Tomcat'i Başlatacak Komut
CMD mongod --fork --logpath /var/log/mongodb.log && catalina.sh run