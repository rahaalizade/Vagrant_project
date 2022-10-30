/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/files/main-config/redis.conf
    - template: jinja

restart redis server:
  cmd.run:
    - name: systemctl restart redis
