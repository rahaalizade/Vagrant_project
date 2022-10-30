mkdir -p {{ pillar['backup']['dir'] }}

xtrabackup --backup --user={{ pillar['user']['username'] }} --password={{ pillar['user']['password'] }} --target-dir={{ pillar['backup']['dir'] }}/newbackup

xtrabackup --user={{ pillar['user']['username'] }} --password={{ pillar['user']['password'] }}  --prepare --target-dir={{ pillar['backup']['dir'] }}/newbackup

ssh {{ pillar['slave']['user'] }}@{{ pillar['slave']['ip'] }} "mkdir -p /root/data/slave_backup"

rsync -avpP -e ssh {{ pillar['backup']['dir'] }} {{ pillar['slave']['user'] }}@{{ pillar['slave']['ip'] }}:data/slave_backup/
