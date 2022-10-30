#! /bin/bash

apt-get install debootstrap systemd-container -y
apt-get update
{% for container, nsname in pillar.get('ns_containers',{} ).items() %}
debootstrap --include=systemd-container,salt-minion,curl stretch /var/lib/machines/{{nsname}}
echo {{nsname}} > /var/lib/machines/{{nsname}}/etc/hostname
systemctl restart systemd-nspawn@{{nsname}}.service
{% endfor %}
