slave:
  slave_ip: 192.168.33.12
  master_ip: 192.168.33.11
  master_name: mymaster
  redis_port: 6379
  sentinel_port: 26379
  quorum: 2
  failover: 60000
  down: 5000
