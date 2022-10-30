Delete salt.list:
  file.absent:
    - name: /etc/apt/sources.list.d/salt.list

Install redis and redis-sentinel:
  pkg.installed:
    - pkgs: 
      - redis-server
      - redis-sentinel
    - hold: True
  
redis service:
  service.running:
    - name: redis
    - enable: True

redis-sentinel service:
  service.running:
    - name: redis-sentinel
    - enable: True
