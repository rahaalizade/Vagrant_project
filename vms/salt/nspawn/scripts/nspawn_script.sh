#! /bin/bash

apt-get install debootstrap systemd-container -y
apt-get update
debootstrap --include=systemd-container stable /var/lib/machines/ns1
echo "ns1" > /var/lib/machines/ns1/etc/hostname
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
systemctl restart systemd-nspawn@ns1.service
systemctl start systemd-nspawn@ns1.service
machinectl start ns1
