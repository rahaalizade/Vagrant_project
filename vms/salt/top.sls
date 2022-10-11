base:
  'minion*':
    - lvm  
    - nspawn

  'php-nginx-*':
    - nginx
    - php-fpm

  'redis-1:
    - redis.redis-master
  
  'redis-2:
    - redis.redis-slave
  
  'redis-3:
    - redis.redis-slave   

  'elastic-1':
    - elastic.install-elastic

#  'minion1':
#    - match: glob
#    - nspawn1
##    - nginx
#
#  'minion2':
#    - match: glob
#    - nspawn2
