#! /bin/bash
# This script must be run using the sudo command
# It will complete the ansible installation and setup

sudo apt-get update

sudo apt-get install -y libssl-dev libffi-dev python-dev python-pip

sudo pip install ansible[azure]

mkdir ~/.azure

echo -e "[default]\nsubscription_id=22442c86-9f71-4b57-ac57-1a54974770f6\nclient_id=d04f2d9c-5160-4dc7-a251-861a92458084\nsecret=307812fd-8b7b-4b06-adc5-6a33704c6aa5\ntenant=2cc18bc7-0610-4646-be5c-1fe62da3f921" > ~/.azure/credentials

wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/azure_rm.py

chmod +x azure_rm.py