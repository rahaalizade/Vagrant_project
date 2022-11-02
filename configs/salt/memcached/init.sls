install memcached package:
  pkg.installed:
    - pkgs:
        - memcached
    - hold: True

/etc/memcached.conf:
  file.managed:
    - source: salt://memcached/files/memcached.conf
    - template: jinja
    - user: root
    - group: root

memcached service:
  service.running:
    - name: memcached
    - enable: True

