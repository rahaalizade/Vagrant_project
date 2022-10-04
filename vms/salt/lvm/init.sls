lvm2:
  pkg.installed: []

/dev/sdb:
  lvm.pv_present

vg01:
  lvm.vg_present:
    - devices: /dev/sdb


#{% for container, lvname in pillar.get('ns_lv',{} ).items() %}
#/var/lib/machines/{{container}}:
#  mount.unmounted:
#    - device: /dev/vg01/{{lvname}}
#    - fstype: ext4
#    - mkmount: True
#    - opts:
#      - defaults
#{% endfor %}
#
#
#{% for container, lvname in pillar.get('lv_containers',{} ).items() %}
#{{lvname}}:
#  lvm.lv_absent:
#    - vgname: vg01
#{% endfor %}
#
#/var/lib/machines/:
#  file.absent:
#    - name: /var/lib/machines


{% for ns, lvname in pillar.get('lv_containers',{} ).items() %}
{{lvname}}:
  lvm.lv_present:
    - vgname: vg01
    - size: 8G
{% endfor %}



#{% for container, nsname in pillar.get('ns_containers',{} ).items() %}
#mkdir -p /var/lib/machines/{{nsname}}:
#  cmd.run:
#    - creates: /var/lib/machines/container
#{% endfor %}

{% for container, nsname in pillar.get('ns_containers', {} ).items() %}
/var/lib/machines/{{container}}:
  file.directory:
    - name: /var/lib/machines/{{nsname}}
    - mode: 755
    - makedirs: True
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
    - mkmnt: True
    - opts:
      - defaults
{% endfor %}
