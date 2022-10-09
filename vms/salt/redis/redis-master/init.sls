/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/files/master/redis.conf
    - template: jinja
