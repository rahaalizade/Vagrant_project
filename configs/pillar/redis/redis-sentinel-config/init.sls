sentinel:
  master_ip: 192.168.33.11
  master_name: mymaster
  supervised: systemd
  daemonize: "yes"
  redis_port: 6379
  sentinel_port: 26379
  quorum: 2
  pidfile: /var/run/redis/redis-sentinel.pid
  logfile: /var/log/redis/redis-sentinel.log
  dir: /var/lib/redis
  failover: 18000
  down: 5000
