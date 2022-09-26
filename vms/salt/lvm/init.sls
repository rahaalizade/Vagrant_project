lvm2:
  pkg.installed: []

/dev/sdb:
  lvm.pv_present

vg01:
  lvm.vg_present:
    - devices: /dev/sdb

lvnspawn:
  lvm.lv_present:
    - vgname: vg01
    - size: 6G

mkdir -p /var/lib/machines/ns1:
  cmd.run:
    - creates: /var/lib/machines/ns1

format_disk:
  blockdev.formatted:
    - name: /dev/vg01/lvnspawn
    - fs_type: ext4
    - require:
      - lvnspawn

#Run fstype script:
#  cmd.run:
#    - name: mkfs.ext4 /dev/vg01/lvnspawn 

/var/lib/machines/ns1:
  mount.mounted:
    - device: /dev/vg01/lvnspawn
    - fstype: ext4
    - mkmount: True
    - opts:
      - defaults
