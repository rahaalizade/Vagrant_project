/etc/redis/sentinel.conf:
  file.managed:
    - source: salt://redis/files/redis-sentinel-slave/sentinel.conf
    - user: redis
    - group: redis
    - template: jinja

sentinel server:
  cmd.run:
    - name: systemctl restart redis-sentinel 
