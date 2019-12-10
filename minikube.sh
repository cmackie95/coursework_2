#! /bin/bash
# This script must be run using the sudo command
# It will complete the Minikube installation and setup

sudo apt-get update

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

sudo apt install -y virtualbox

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

chmod +x minikube  

sudo mv minikube /usr/local/bin/  

sudo minikube start --force --vm-driver=virtualbox