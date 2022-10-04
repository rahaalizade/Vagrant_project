php-fpm:
   pkg:
     - installed 

php-fpm service:
  service.running:
    - name: php7.4-fpm
    - enable: True
  watch:
    - pkg: php7.4-fpm
