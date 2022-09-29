#mkdir -p /var/lib/machines/m1:
#  cmd.run:
#    - creates: /var/lib/machines/m1 
Install packages:
  pkg.installed:
    - pkgs:
        - curl

Install nspawn:
  cmd.script:
    - name: create_nspawn.sh
    - source: salt://nspawn/scripts/create_nspawn.sh
    - shell: /bin/bash
    - template: jinja

Config network:
  cmd.script:
    - name: configure_network_nspawn.sh
    - source: salt://nspawn/scripts/configure_network_nspawn.sh
    - shell: /bin/bash
    - template: jinja

~/salt_minion.sh:
  file.managed:
    - source: salt://nspawn/installation/salt_minion.sh
    - user: root
    - group: root
    - mode: 644
    - template: jinja

Install salt minion:
  cmd.script:
    - name: configure_minion_nspawn.sh
    - source: salt://nspawn/scripts/configure_minion_nspawn.sh
    - shell: /bin/bash
    - template: jinja 
