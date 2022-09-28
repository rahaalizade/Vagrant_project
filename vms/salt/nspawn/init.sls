#mkdir -p /var/lib/machines/m1:
#  cmd.run:
#    - creates: /var/lib/machines/m1 


Install nspawn:
  cmd.script:
    - name: nspawn_script.sh
    - source: salt://nspawn/scripts/nspawn_script.sh
    - shell: /bin/bash
    - template: jinja
