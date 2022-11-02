base:
  'minion1':
    - minion1.lv_containers_minion1
    - minion1.ns_containers_minion1
    - minion1.ns_lv_minion1
  
  'minion2':
    - minion2.lv_containers_minion2
    - minion2.ns_containers_minion2
    - minion2.ns_lv_minion2

  'minion3':
    - minion3.lv_containers_minion3
    - minion3.ns_containers_minion3
    - minion3.ns_lv_minion3
 
  'redis-1':
    - redis.redis-config
    - redis.redis-sentinel-config
  
  'redis-2':  
    - redis.redis-config
    - redis.redis-sentinel-config

  'redis-3':
    - redis.redis-config
    - redis.redis-sentinel-config
     
  'elastic-1':
    - elastic.elastic-master

  'elastic-2':
    - elastic.elastic-master

  'elastic-3':
    - elastic.elastic-master
  
  'mysql-1':
    - mysql
    - percona
  
  'mysql-2':
    - mysql
    - percona
  
  'mcrouter-1':
    - mcrouter.pkgs
 
  'memcached-2':
    - memcached

  'memcached-3':
    - memcached
