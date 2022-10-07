#! /bin/bash

systemctl start systemd-networkd
systemctl enable systemd-networkd

{% for container, nsname in pillar.get('ns_containers', {} ).items() %}

machinectl shell {{nsname}} /usr/bin/systemctl start systemd-networkd
machinectl shell {{nsname}} /usr/bin/systemctl enable systemd-networkd

mkdir /etc/systemd/nspawn
echo "[Network]
VirtualEthernet=no

[Exec]
Capability=CAP_NET_ADMIN
PrivateUsers=0" > /etc/systemd/nspawn/{{nsname}}.nspawn

mkdir /etc/systemd/system/systemd-nspawn@.service.d
echo "[Service]
ExecStart=
ExecStart=/usr/bin/systemd-nspawn --boot --link-journal=try-guest --network-veth -U --settings=override --machine=%i" > /etc/systemd/system/systemd-nspawn@.service.d/override.conf

systemctl daemon-reload

{% endfor %}
