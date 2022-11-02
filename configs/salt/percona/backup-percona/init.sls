~/xtrabackup.sh:
  file.managed:
    - source: salt://percona/scripts/xtrabackup.sh
    - user: root
    - group: root
    - template: jinja

backup from master:
  cmd.script:
    - name: xtrabackup.sh
    - source: salt://percona/scripts/xtrabackup.sh
    - shell: /bin/bash
    - user: root
    - group: root
    - template: jinja
