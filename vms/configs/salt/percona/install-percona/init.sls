Delete salt.list:
  file.absent:
    - name: /etc/apt/sources.list.d/salt.list

Update and fix broken packages:
  cmd.run:
    - name: apt --fix-broken install -y && apt-get update -y

Install dependencies:
  pkg.installed:
    - pkgs:
      - lsb-release
    - hold: True

~/percona.deb:
  file.managed:
    - source: salt://percona/repo/percona.deb
    - user: root
    - group: root

dpkg percona:
  cmd.run:
    - name: dpkg -i ./percona.deb
    - user: root
    - group: root

Update again: 
  cmd.run:
    - name: apt-get update -y

Install percona:
  cmd.run:
    - name: |
        percona-release setup ps80
        apt install percona-server-server -y

Install xtrabackup server:
  cmd.run:
    - name: apt install percona-xtrabackup-80 -y 
