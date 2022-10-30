#/etc/redis/redis.conf:
#  file.managed:
#    - source: salt://redis/files/master/redis.conf
#    - template: jinja

/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/files/master/redis.conf
    - template: jinja

restart redis-server:
  cmd.run:
    - name: systemctl restart redis-server
