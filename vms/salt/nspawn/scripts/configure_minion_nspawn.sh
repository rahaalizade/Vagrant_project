#! /bin/bash

{% for container, nsname in pillar.get('ns_containers',{} ).items() %}

mv ./salt_minion.sh /var/lib/machines/{{nsname}}
cd /var/lib/machines/{{nsname}}

machinectl shell {{nsname}} /bin/bash /salt_minion.sh
{% endfor %}
