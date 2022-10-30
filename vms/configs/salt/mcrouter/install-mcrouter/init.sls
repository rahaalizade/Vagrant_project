/etc/apt/sources.list:
  file.managed:
    - source: salt://mcrouter/files/sources.list
    - user: root
    - group: root

download mcrouter debian file:
  cmd.run:
    - name: |
        apt-get update -y
        apt-get install apt-transport-https -y
        wget -O - https://facebook.github.io/mcrouter/debrepo/bionic/PUBLIC.KEY | apt-key add 
        apt-get update
        apt-get download mcrouter

create directories for packages:
  file.directory:
    - name: ~/pkgs

~/pkgs:
  file.recurse:
    - source: salt://mcrouter/pkgs
    - target: ~/pkgs
    - makedirs: True

dpkg and install dependencies:
  cmd.script:
    - name: installation.sh
    - source: salt://mcrouter/scripts/installation.sh
    - template: jinja
