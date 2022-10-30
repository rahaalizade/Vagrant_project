#Update sysctl config:
#  cmd.run:
#    - name: echo "vm.max_map_count=262144" >> /etc/sysctl.conf && sysctl --system

/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - source: salt://elastic/files/elastic-master/elasticsearch.yml
    - template: jinja

restart elasticsearch service:
  cmd.run:
    - name: systemctl restart elasticsearch 
