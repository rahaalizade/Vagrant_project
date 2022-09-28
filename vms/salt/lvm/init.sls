lvm2:
  pkg.installed: []

/dev/sdb:
  lvm.pv_present

vg01:
  lvm.vg_present:
    - devices: /dev/sdb


{% for ns, lvname in pillar.get('lv_containers',{} ).items() %}
{{lvname}}:
  lvm.lv_present:
    - vgname: vg01
    - size: 8G
{% endfor %}


#{% for container, lvname in pillar.get('lv_containers',{} ).items() %}
#{{lvname}}:
#  lvm.lv_absent:
#    - vgname: vg01
#{% endfor %}

{% for container, nsname in pillar.get('ns_containers',{} ).items() %}
mkdir -p /var/lib/machines/{{nsname}}:
  cmd.run:
    - creates: /var/lib/machines/container
{% endfor %}

{% for lv, lvname in pillar.get('lv_containers',{} ).items() %} 
format_disk{{lv}}:
  blockdev.formatted:
    - name: /dev/vg01/{{lvname}}
    - fs_type: ext4
    - require:
        - {{lvname}}
{% endfor %}

{% for container, lvname in pillar.get('ns_lv',{} ).items() %}
/var/lib/machines/{{container}}:
  mount.mounted:
    - device: /dev/vg01/{{lvname}}
    - fstype: ext4
    - mkmount: True
    - opts:
      - defaults
{% endfor %}
