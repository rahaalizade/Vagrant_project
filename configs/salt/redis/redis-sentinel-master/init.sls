delete sentinel.conf:
  file.absent:
    - name: /etc/redis/sentinel.conf

/etc/redis/sentinel.conf:
  file.managed:
    - source: salt://redis/files/redis-sentinel-master/sentinel.conf
    - user: redis
    - group: redis
    - template: jinja
