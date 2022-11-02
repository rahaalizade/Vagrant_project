~/configuration_pool.json:
  file.managed:
    - source: salt://mcrouter/scripts/configuration_pool.json
    - user: root
    - group: root

/lib/systemd/system/mcrouter.service:
  file.managed:
    - source: salt://mcrouter/scripts/mcrouter.service
    - user: root
    - group: root

system reload:
  cmd.run:
    - name: systemctl daemon-reload
    - user: root
    - group: root

{% set existense = salt['cmd.shell']('[ -f /lib/systemd/system/mcrouter.service ] && echo "Exists" || echo "Not Exists"') %}
{% if existense == "Not Exists" %}
setup mcrouter:
  cmd.run:
    - name: mcrouter --config-file='/root/configuration_pool.json'
    - user: root
    - group: root
{% endif %}

restart service:
  cmd.run:
    - name: systemctl restart mcrouter.service
    - user: root
    - group: root
