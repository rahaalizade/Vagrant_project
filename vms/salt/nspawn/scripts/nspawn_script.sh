#! /bin/bash

apt-get install debootstrap systemd-container -y
apt-get update
{% for container, nsname in pillar.get('ns_containers',{} ).items() %}
debootstrap --include=systemd-container stable /var/lib/machines/{{nsname}}
echo {{nsname}} > /var/lib/machines/ns1/etc/hostname
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
systemctl restart systemd-nspawn@{{nsname}}.service
systemctl start systemd-nspawn@{{nsname}}.service
machinectl start {{nsname}}
{% endfor %}