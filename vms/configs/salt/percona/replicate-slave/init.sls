~/xtrabackup-slave.sh:
  file.managed:
    - source: salt://percona/scripts/xtrabackup-slave.sh
    - user: root
    - group: root
    - template: jinja

Replicate slave:
  cmd.script:
    - name: xtrabackup-slave.sh
    - source: salt://percona/scripts/xtrabackup-slave.sh
    - shell: /bin/bash
    - template: jinja
    - user: root
    - group: root
