memcached:
  pkg:
    - installed

memcached service:
  service.running:
    - enable: True
