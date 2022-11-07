/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - source: salt://elastic/files/elastic-master/elasticsearch.yml
    - template: jinja

restart elasticsearch service:
  cmd.run:
    - name: systemctl restart elasticsearch 
