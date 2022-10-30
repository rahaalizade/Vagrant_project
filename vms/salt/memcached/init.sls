install memcached package:
  pkg.installed:
    - pkgs:
        - memcached
    - hold: True

memcached service:
  service.running:
    - name: memcached
    - enable: True
