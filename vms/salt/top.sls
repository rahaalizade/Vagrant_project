base:
  'minion*':
    - lvm  
    - nspawn

  'php-nginx-*':
    - nginx
    - php-fpm

#  'minion1':
#    - match: glob
#    - nspawn1
##    - nginx
#
#  'minion2':
#    - match: glob
#    - nspawn2
