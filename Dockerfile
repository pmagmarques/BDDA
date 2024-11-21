
#  Hadoop & HBase base image
FROM sequenceiq/hadoop-docker:2.7.1


WORKDIR /opt

# Install the dependencies
RUN apt-get update && \
    apt-get install -y wget curl apache2 sudo vim

# Install Apache Hive
RUN wget https://archive.apache.org/dist/hive/hive-2.3.7/apache-hive-2.3.7-bin.tar.gz && \
    tar -xzvf apache-hive-2.3.7-bin.tar.gz && \
    mv apache-hive-2.3.7-bin /opt/hive && \
    rm apache-hive-2.3.7-bin.tar.gz


# Install Apache Zeppelin
RUN wget https://archive.apache.org/dist/zeppelin/zeppelin-0.9.0/zeppelin-0.9.0-bin-all.tgz && \
    tar -xzvf zeppelin-0.9.0-bin-all.tgz && \
    mv zeppelin-0.9.0-bin-all /opt/zeppelin && \
    rm zeppelin-0.9.0-bin-all.tgz

# Install MongoDB
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add - && \
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
    sudo apt-get update && \
    sudo apt-get install -y mongodb-org

# Install Apache Phoenix
RUN wget https://archive.apache.org/dist/phoenix/apache-phoenix-4.14.3-HBase-1.7-bin.tar.gz && \
    tar -xzvf apache-phoenix-4.14.3-HBase-1.7-bin.tar.gz && \
    mv apache-phoenix-4.14.3-HBase-1.7-bin /opt/phoenix && \
    rm apache-phoenix-4.14.3-HBase-1.7-bin.tar.gz

# Envoironment Variables
ENV HIVE_HOME=/opt/hive
ENV PHOENIX_HOME=/opt/phoenix
ENV ZEPPELIN_HOME=/opt/zeppelin
ENV PATH=$PATH:$HIVE_HOME/bin:$PHOENIX_HOME:$ZEPPELIN_HOME/bin

#  HTTP Apache server configuration
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Export the available ports:
# 10000 for HiveServer2
# 8765 for Phoenix Query Server
# 8080 for Zeppelin UI
# 27017 for MongoDB
EXPOSE 10000 8765 8080 27017

# Coy archivers
COPY hive-site.xml /opt/hive/conf/
COPY phoenix-client.jar /opt/phoenix/

# Start All Services
CMD service apache2 start && \
    mongo --eval "printjson(db.serverStatus())" && \
    hive --service hiveserver2 && \
    phoenix-query-server && \
    /opt/zeppelin/bin/zeppelin-daemon.sh start
