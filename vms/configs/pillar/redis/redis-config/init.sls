config:
  master_ip: 192.168.33.11
  port: 6379
  masterauth: redismasterpassword
  requirepass: redisrequirepassword
  protected-mode: "no"
  loglevel: debug
  appendonly: "yes"
  daemonize: "yes"
  supervised: systemd
  pidfile: /var/run/redis/redis-server.pid
  logfile: /var/log/redis/redis-server.log
  dir: /var/lib/redis
