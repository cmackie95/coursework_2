#! /bin/bash
# This script must be run using the sudo command
# It will complete the SonarQube installation and setup

sudo docker run -d --name sonarqube-container -p 9000:9000 sonarqube

sudo docker exec -it jenkins-container bash

cd /var/jenkins_home

mkdir sonarqube && cd sonarqube

sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip

unzip sonar-scanner-cli-3.3.0.1492-linux.zip

rm /var/jenkins_home/sonarqube/sonar-scanner-3.3.0.1492-linux/jre/bin/java		

ln -s /usr/lib/jvm/java-1.8-openjdk/bin/java /var/jenkins_home/sonarqube/sonar-scanner-3.3.0.1492-linux/jre/bin/java