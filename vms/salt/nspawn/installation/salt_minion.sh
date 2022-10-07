#! /bin/bash

apt-get update
apt-get install curl -y 
apt-get install vim -y

curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/salt/py3/debian/11/amd64/latest/salt-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/salt/py3/debian/11/amd64/latest bullseye main" | tee /etc/apt/sources.list.d/salt.list

echo "192.168.33.10   salt" >> /etc/hosts
echo "192.168.33.10   salt-master" >> /etc/hosts

apt-get install salt-minion -y
