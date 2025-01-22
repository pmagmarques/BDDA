## install & Update and install dependencies

sudo dnf install -y
sudo dnf update -y
sudo dnf install -y wget curl unzip vim tar
sudo dnf install -y gnupg



## install apache http server do be used as http server
wget https://downloads.apache.org/httpd/httpd-2.4.62.tar.gz
tar -xzvf httpd-2.4.62.tar.gz
mv httpd-2.4.62 opt/apachehttp


## Install postgresql  for fun. I might not going to use it
sudo dnf install -y postgresql-server

## Insall jdk 
sudo dnf install java-1.8.0-openjdk-devel

## Config Python  
sudo dnf install -y python3
sudo dnf install -y python3-pip
sudo dnf install -y python3-distutils
python3 -m pip install --upgrade pip
pip install --upgrade pip
pip3 install setuptools

## download hadoop and install
wget https://archive.apache.org/dist/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz
tar -xzvf hadoop-2.7.1.tar.gz 
mv hadoop-2.7.1 opt/hadoop

## dowload  Hive and install
wget https://archive.apache.org/dist/hive/hive-2.3.7/apache-hive-2.3.7-bin.tar.gz
tar -xzvf apache-hive-2.3.7-bin.tar.gz
mv apache-hive-2.3.7-bin opt/hive

## download zookeeper and install in the Master node as well as on the other nodes for cluster management
wget https://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
tar -xvzf zookeeper-3.4.6.tar.gz
mv zookeeper-3.4.6 opt/zookeeper

## Download and install Apache Phoenix HBase
wget https://archive.apache.org/dist/phoenix/apache-phoenix-4.15.0-HBase-1.5/bin/apache-phoenix-4.15.0-HBase-1.5-bin.tar.gz 
tar -xzvf apache-phoenix-4.15.0-HBase-1.5-bin.tar.gz --warning=no-unknown-keyword
mv apache-phoenix-4.15.0-HBase-1.5-bin opt/phoenix

## Download and install Apache Zeppelin
wget https://downloads.apache.org/zeppelin/zeppelin-0.9.0/zeppelin-0.9.0-bin-all.tgz
tar -xvzf zeppelin-0.9.0-bin-all.tgz
mv zeppelin-0.9.0-bin-all opt/zeppelin

## Download and install Apache to import Postgre into hadoop Hadoop
##wget https://downloads.apache.org/sqoop/1.4.7/sqoop-1.4.7.tar.gz 
##tar -xvzf sqoop-1.4.7.tar.gz 
##sudo mv sqoop-1.4.7.tar.gz  opt/sqoop
## Not Uncompress





