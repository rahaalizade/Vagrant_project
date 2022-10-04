nginx:
  pkg:
    - installed

nginx service:
  service.running:
    - name: nginx
    - enable: True
    - watch:
        - pkg: nginx
        - file: /etc/nginx/sites-available/default
  
/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx/files/default
    - user: root
    - group: root
    - mode: 640

/var/www/html/info.php:
  file.managed:
    - source: salt://php-fpm/files/info.php
