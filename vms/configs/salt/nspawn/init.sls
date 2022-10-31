{% set existense = salt['cmd.shell']('[ -d /var/lib/machines/repo  ] && echo "Exists" || echo "Not Exists"') %}

{% if existense == "Not Exists" %}
{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
move {{nsname}} tar file:
  file.managed:
    - source: salt://nspawn/debian/stretch_container.tar.gz
    - name: ~/stretch_container.tar.gz
    - user: root
    - group: root
  cmd.run:
    - name: |
        tar -xzvf stretch_container.tar.gz -C /var/lib/machines
        cp -r /var/lib/machines/repo/* /var/lib/machines/{{nsname}}
{% endfor %}

{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
{{nsname}}:
  cmd.run:
    - name: |
        echo {{nsname}} > /var/lib/machines/{{nsname}}/etc/hostname 
        echo {{nsname}} > /var/lib/machines/{{nsname}}/etc/salt/minion_id        
        grep -qxF "192.168.33.10   salt" /var/lib/machines/{{nsname}}/etc/hosts || echo "192.168.33.10   salt" >> /var/lib/machines/{{nsname}}/etc/hosts
        grep -qxF "192.168.33.10   salt-master" /var/lib/machines/{{nsname}}/etc/hosts || echo "192.168.33.10   salt-master" >> /var/lib/machines/{{nsname}}/etc/hosts
    
    - user: root
    - group: root
  
{% endfor %}

setup network config:
  cmd.script:
    - name: configure_network_nspawn.sh
    - source: salt://nspawn/scripts/configure_network_nspawn.sh
    - shell: /bin/bash
    - template: jinja

{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
start container {{nsname}}:
  cmd.run:
    - name: systemctl start systemd-nspawn@{{nsname}}
    - user: root
    - group: root
{% endfor %}

{% endif %}

##### THIS IS FOR ELASTIC #####
Add vm-max to sysctl:
  cmd.run:
    - name: |
        grep -qxF "vm.max_map_count=262144" /etc/sysctl.conf || echo "vm.max_map_count=262144" >> /etc/sysctl.conf 
        sysctl --system
    - user: root
    - group: root
