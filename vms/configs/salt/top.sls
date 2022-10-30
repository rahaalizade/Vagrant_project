base:
  'minion*':
    - lvm  
    - nspawn
    - elastic.download-elastic    

  'php-nginx-*':
    - nginx
    - php-fpm

  'redis-1:
    - redis.redis-master
    - redis.redis-sentinel-master
    - redis.redis-master-slave
  
  'redis-2:
    - redis.redis-slave
    - redis.redis-sentinel-slave
    - redis.redis-master-slave
  
  'redis-3:
    - redis.redis-slave
    - redis.redis-sentinel-slave
    - redis.redis-master-slave

  'elastic-1':
    - elastic.install-elastic

  'mysql-1':
    - percona.install-percona
    - mysql
    - ssh

  'mysql-2':
    - percona.install-percona
    - mysql
 
  'mysql-3':
    - percona.install-percona
    - mysql

  'mcrouter-1':
    - mcrouter.install-mcrouter

  'mcrouter-2':
    - mcrouter.install-mcrouter
