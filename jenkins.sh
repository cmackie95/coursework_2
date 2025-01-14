#! /bin/bash
# This script must be run using the sudo command
# It will complete the jenkins installation and setup

sudo docker run --rm -d -u root --name jenkins-container -p 8080:8080 -v ~/jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home jenkinsci/blueocean