/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/files/slave/redis.conf
    - template: jinja
