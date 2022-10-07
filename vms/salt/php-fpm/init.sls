php7.4-fpm:
   pkg:
     - installed 

create php direcotry:
  file.directory:
    - name: /var/run/php

php-fpm service:
  service.running:
    - name: php7.4-fpm
    - enable: True
  watch:
    - pkg: php7.4-fpm
