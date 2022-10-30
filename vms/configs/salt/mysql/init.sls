mysql service:
  service.running:
    - name: mysql

Create mysql users:
  cmd.script:
    - name: create_user.sh
    - source: salt://mysql/scripts/create_user.sh
    - user: root
    - group: root
    - template: jinja
