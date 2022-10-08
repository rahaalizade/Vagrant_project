Install packages:
  pkg.installed:
    - pkgs:
        - memcached

memcached service:
  service.running:
    - name: memcached
    - enable: True
