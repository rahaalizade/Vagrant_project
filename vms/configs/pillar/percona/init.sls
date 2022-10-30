backup:
  target_dir: ~/data/slave_backup/backups/newbackup
  dir: data/backups
  datadir: /tmp/mysql 
  owner: mysql
 
slave:
  user: root
  ip: 192.168.33.12
