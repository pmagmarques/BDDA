# Base Image with Hadoop
FROM sequenceiq/hadoop-docker:latest

FROM big-data-europe/docker-hadoop

WORKDIR /opt
# Install the dependencies
##RUN yum install -y wget curl apache2 sudo vim unzip vim openjdk-8-jdk mongodb

# dependencies

 #RUN yum install -y vim 
 #RUN yum install -y mongodb
 #RUN yum install -y openjdk-8-jdk 
 #RUN yum install -y wget  
 #RUN yum install -y curl 
 #RUN yum install -y unzip 
 




# Apache Hive
RUN wget https://archive.apache.org/dist/hive/hive-2.3.7/apache-hive-2.3.7-bin.tar.gz && \
    tar -xzvf apache-hive-2.3.7-bin.tar.gz && \
    mv apache-hive-2.3.7-bin /opt/hive && \
    rm apache-hive-2.3.7-bin.tar.gz

# Apache Phoenix
RUN wget https://archive.apache.org/dist/phoenix/apache-phoenix-4.14.3-HBase-1.7-bin.tar.gz && \
    tar -xzvf apache-phoenix-4.14.3-HBase-1.7-bin.tar.gz && \
    mv apache-phoenix-4.14.3-HBase-1.7-bin /opt/phoenix && \
    rm apache-phoenix-4.14.3-HBase-1.7-bin.tar.gz

# Apache Zeppelin
RUN wget https://downloads.apache.org/zeppelin/zeppelin-0.9.0/zeppelin-0.9.0-bin-all.tgz && \
    tar -xvzf zeppelin-0.9.0-bin-all.tgz && \
    mv zeppelin-0.9.0-bin-all /opt/zeppelin && \
    rm zeppelin-0.9.0-bin-all.tgz

# Apache Superset
RUN pip install apache-superset

# Expor as portas necessárias
EXPOSE 8080 8088 10000 8765

# Start Apache Zeppelin and Superset
CMD /opt/zeppelin/bin/zeppelin-daemon.sh start && superset run
