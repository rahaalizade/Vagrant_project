/etc/elasticsearch/jvm.options:
  file.managed:
    - source: salt://elastic/files/jvm-config/jvm.options
    - user: root

restart elasticsearch:
  cmd.run:
    - name: systemctl enable elasticsearch && systemctl restart elasticsearch

elasticsearch service:
  service.running:
    - name: elasticsearch
