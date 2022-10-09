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
    - redis-master.redis_configuration_master
  
  'redis-2':  
    - redis-slave.redis_configuration_slave

  'redis-3':
    - redis-slave.redis_configuration_slave

