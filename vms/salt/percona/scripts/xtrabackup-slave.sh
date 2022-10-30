#! /bin/bash

{% set existense = salt['cmd.shell']('[ -d /tmp/mysql ] && echo "Exists" || echo "Not Exists"') %}

{% if existense == "Not Exists" %}

service mysql stop

mkdir {{ pillar['backup']['datadir'] }}

mv /var/lib/mysql/* {{ pillar['backup']['datadir'] }}

xtrabackup --move-back --target-dir={{ pillar['backup']['target_dir'] }}

{% endif %}

chown {{ pillar['backup']['owner'] }}:{{ pillar['backup']['owner'] }} /var/lib/mysql/*
