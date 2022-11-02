Install php-fpm package:
   pkg.installed:
    - pkgs:
        - php-fpm
    - hold: True

create php direcotry:
  file.directory:
    - name: /var/run/php

php-fpm service:
  service.running:
    - name: php7.0-fpm
    - enable: True
  watch:
    - pkg: php7.0-fpm
