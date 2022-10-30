~/elasticsearch.deb:
  file.managed:
    - source: salt://elastic/repo/elasticsearch.deb
    - user: root

install elasticsearch:
  cmd.run:
    - name: dpkg -i /root/elasticsearch.deb
    - user: root
    - group: root

/etc/elasticsearch/jvm.options:
  file.managed:
    - source: salt://elastic/files/jvm-config/jvm.options
    - user: root

delete useless variables:
  cmd.run:
    - name: rm -rf /var/lib/elasticsearch/*

restart elasticsearch:
  cmd.run:
    - name: systemctl enable elasticsearch && systemctl restart elasticsearch

elasticsearch service:
  service.running:
    - name: elasticsearch
