nginx:
  pkg:
    - installed

#service.running:
#  - watch:
#      - pkg: nginx
#      - file: /etc/nginx/nginx.conf
#      - file: /etc/nginx/sites-available/default
#
#/etc/nginx/nginx.conf:
#  file.managed:
#    - source: salt://nginx/files/etc/nginx/nginx.conf
#    - user: root
#    - group: root
#    - mode: 640
#
#/var/www/html/index.php:
#  file.managed:
#    - source: salt://nginx/index.php
