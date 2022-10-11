{% set repo_url = 'https://artifacts.elastic.co/packages/'  %}

apt-transport-https:
  pkg.installed


prepare installation:
  pkgrepo.managed:
    - name: deb {{ repo_url }}/apt stable main







Prapare installation:
  cmd.run:
    - names: 
        - curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
  
        -  echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
  
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - elasticsearch
