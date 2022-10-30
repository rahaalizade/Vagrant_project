#! /bin/bash

#apt-get update

#curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/salt/py3/debian/11/amd64/latest/salt-archive-keyring.gpg

#echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/salt/py3/debian/11/amd64/latest bullseye main" | tee /etc/apt/sources.list.d/salt.list

{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
hostnamectl set-hostname {{nsname}}

echo {{nsname}} > /etc/salt/minion_id

grep -qxF "192.168.33.10   salt" /etc/hosts || echo "192.168.33.10   salt" >> /etc/hosts
grep -qxF "192.168.33.10   salt-master" /etc/hosts || echo "192.168.33.10   salt-master" >> /etc/hosts

systemctl restart systemd-nspawn@{{nsname}}

systemctl restart salt-minion

{% endfor %}

#echo "192.168.33.10   salt" >> /etc/hosts
#echo "192.168.33.10   salt-master" >> /etc/hosts

