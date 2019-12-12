#! /bin/bash
# This script must be run using the sudo command
# It will complete the ansible installation and setup

sudo apt-get update

sudo apt-get install -y libssl-dev libffi-dev python-dev python-pip

sudo pip install ansible[azure]

mkdir ~/.azure

echo -e "[default]\nsubscription_id=7af1e47d-cb5c-48bf-b370-60f061ba087a\nclient_id=d04f2d9c-5160-4dc7-a251-861a92458084\nsecret=8c03f6fc-cb1a-4516-86a5-7a112249f58a\ntenant=2cc18bc7-0610-4646-be5c-1fe62da3f921" > ~/.azure/credentials

wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/azure_rm.py

chmod +x azure_rm.py