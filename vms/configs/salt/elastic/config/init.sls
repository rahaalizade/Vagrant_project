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

/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - source: salt://elastic/files/elastic-master/elasticsearch.yml
    - template: jinja

delete useless variables:
  cmd.run:
    - name: rm -rf /var/lib/elasticsearch/*

restart elasticsearch service:
  cmd.run:
    - name: systemctl restart elasticsearch 
