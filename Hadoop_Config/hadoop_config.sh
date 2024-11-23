## Update and install dependencies

sudo apt-get install -y
sudo apt-get update -y
sudo apt-get install -y wget curl unzip vim tar


## install apache2 do be used as http server
sudo apt-get install -y apache2

## Insall mongodb for fun
sudo apt-get install -y mongodb

## Insall jdk 
sudo apt-get install -y openjdk-8-jdk 

## Config Python  
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
sudo apt-get install -y python3-distutils
pip install setuptools

## download hadoop and install
wget https://archive.apache.org/dist/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz
tar -xzvf hadoop-2.7.1.tar.gz 
mv hadoop-2.7.1 /opt/hadoop

## dowload  Hive and install
wget https://archive.apache.org/dist/hive/hive-2.3.7/apache-hive-2.3.7-bin.tar.gz
tar -xzvf apache-hive-2.3.7-bin.tar.gz
mv apache-hive-2.3.7-bin /opt/hive

## download zookeeper and install in the Master node as well as on the other nodes for cluster management
wget https://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
tar -xvzf zookeeper-3.4.6.tar.gz
mv zookeeper-3.4.6 /opt/zookeeper

## Download and install Apache Phoenix HBase
wget https://archive.apache.org/dist/phoenix/apache-phoenix-4.15.0-HBase-1.5/bin/apache-phoenix-4.15.0-HBase-1.5-bin.tar.gz 
tar -xzvf apache-phoenix-4.15.0-HBase-1.5-bin.tar.gz --warning=no-unknown-keyword
mv apache-phoenix-4.15.0-HBase-1.5-bin /opt/phoenix

# Instalar o Apache Zeppelin
wget https://downloads.apache.org/zeppelin/zeppelin-0.9.0/zeppelin-0.9.0-bin-all.tgz
tar -xvzf zeppelin-0.9.0-bin-all.tgz
mv zeppelin-0.9.0-bin-all /opt/zeppelin

# Instalar o Apache Superset
pip3 install apache-superset

# Start http service with apache2
sudo systemctl start apache2
