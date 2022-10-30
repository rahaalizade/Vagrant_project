{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
move {{nsname}}:
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

#mkdir -p /var/lib/machines/m1:
#  cmd.run:
#    - creates: /var/lib/machines/m1 

#{% for container, nsname in pillar.get('ns_containers',{} ).items() %}
#shoutdown {{container}}:
#  cmd.run:
#    - name: systemctl stop systemd-nspawn@{{nsname}}
#{% endfor %}

#Install nspawn:
#  cmd.script:
#    - name: create_nspawn.sh
#    - source: salt://nspawn/scripts/create_nspawn.sh
#    - shell: /bin/bash
#    - template: jinja

##create debian direcotry:
##  file.direcotry:
##    - name: ~/debian
##    - user: root
##    - group: root
##    - makedirs: True
##
##download debian repo:
##  cmd.run:
##    - name: debootstrap --include=systemd-container,curl,salt-minion stretch ~/debian 
##    - user: root
##    - group: root

#{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
#create nspawn {{nsname}}:
#  cmd.run:
#    - name: cp -r ~/debian/* /var/lib/machines/{{nsname}}
#    - user: root
#    - group: root
#{% endfor %}


##{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
##{{nsname}}:
##  cmd.run:
##    - name: |
##        echo {{nsname}} > /var/lib/machines/{{nsname}}/etc/hostname 
##        echo {{nsname}} > /var/lib/machines/{{nsname}}/etc/salt/minion_id        
##        grep -qxF "192.168.33.10   salt" /var/lib/machines/{{nsname}}/etc/hosts || echo "192.168.33.10   salt" >> /var/lib/machines/{{nsname}}/etc/hosts
##        grep -qxF "192.168.33.10   salt-master" /var/lib/machines/{{nsname}}/etc/hosts || echo "192.168.33.10   salt-master" >> /var/lib/machines/{{nsname}}/etc/hosts
##    
##    - user: root
##    - group: root
##  
##{% endfor %}
##
##
##Config network:
##  cmd.script:
##    - name: configure_network_nspawn.sh
##    - source: salt://nspawn/scripts/configure_network_nspawn.sh
##    - shell: /bin/bash
##    - template: jinja
##
##
##{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
##start containers {{nsname}}:
##  cmd.run:
##    - name: systemctl start systemd-nspawn@{{nsname}}
##    - user: root
##    - group: root
##{% endfor %}

#{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
#{{nsname}}:
#  cmd.run:
#    - name: |
#        machinectl shell {{nsname}} /usr/bin/hostnamectl set-hostname {{nsname}}
#        machinectl shell {{nsname}} /bin/echo {{nsname}} > /var/lib/machines/{{nsname}}/etc/salt/minion_id        
#        machinectl shell {{nsname}} /bin/grep -qxF "192.168.33.10   salt" /var/lib/machines/{{nsname}}/etc/hosts || echo "192.168.33.10   salt" >> /var/lib/machines/{{nsname}}/etc/hosts
#        machinectl shell {{nsname}} /usr/bin/grep -qxF "192.168.33.10   salt-master" /var/lib/machines/{{nsname}}/etc/hosts || echo "192.168.33.10   salt-master" >> /var/lib/machines/{{nsname}}/etc/hosts
#             
#    
#    - user: root
#    - group: root
#  
#{% endfor %}

#{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
#/var/lib/machines/{{nsname}}/salt_minions.sh:
#  file.managed:
#    - source: salt://nspawn/installation/salt_minion.sh
#    - user: root 
#    - group: root
#    - template: jinja
#{% endfor %}

#{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
#installation inside nspawns {{nsname}}:
#  cmd.run:
#    - name: machinectl shell {{nsname}} /bin/bash configuration.sh
#    - user: root
#    - group: root
#    - template: jinja
#    - shell: /bin/bash
#{% endfor %}

#installation inside nspawns:
#  cmd.script:
#    - name: configuration.sh
#    - source: salt://nspawn/scripts/configuration.sh
#    - template: jinja
#    - shell: /bin/bash
#    - user: root
#    - group: root
 

#{% for ns, nsname in pillar.get('ns_containers',{} ).items() %}
#start containers{{nsname}}:
#  cmd.run:
#    - name: systemctl start systemd-nspawn@{{nsname}}
#    - user: root
#    - group: root
#{% endfor %}

#~/salt_minion.sh:
#  file.managed:
#    - source: salt://nspawn/installation/salt_minion.sh
#    - user: root
#    - group: root
#    - mode: 644
#    - template: jinja
#
#install salt minion:
#  cmd.script:
#    - name: configure_minion_nspawn.sh
#    - source: salt://nspawn/scripts/configure_minion_nspawn.sh
#    - shell: /bin/bash
#    - template: jinja 

##### THIS IS FOR ELASTIC #####
#Add vm-max to sysctl:
#  cmd.run:
#    - name: |
#        grep -qxF "vm.max_map_count=262144" /etc/sysct.conf || echo "vm.max_map_count=262144" >> /etc/sysctl.conf 
#        sysctl --system
#    - user: root
#    - group: root
