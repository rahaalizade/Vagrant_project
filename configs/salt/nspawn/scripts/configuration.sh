#! /bin/bash

{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}

hostnamectl set-hostname {{nsname}}

echo {{nsname}} > /etc/salt/minion_id

grep -qxF "192.168.33.10   salt" /etc/hosts || echo "192.168.33.10   salt" >> /etc/hosts
grep -qxF "192.168.33.10   salt-master" /etc/hosts || echo "192.168.33.10   salt-master" >> /etc/hosts

systemctl restart systemd-nspawn@{{nsname}}

systemctl restart salt-minion

{% endfor %}
