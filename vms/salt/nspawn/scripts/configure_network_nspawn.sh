#! /bin/bash

systemctl start systemd-networkd
systemctl enable systemd-networkd

{% for container, nsname in pillar.get('ns_containers',{} ).items() %}
machinectl shell {{nsname}} /usr/bin/systemctl start systemd-networkd
machinectl shell {{nsname}} /usr/bin/systemctl enable systemd-networkd

mkdir /etc/systemd/nspawn
echo "[Network]
      Port=tcp:222:22" > /etc/systemd/nspawn/{{nsname}}.nspawn
{% endfor %}
