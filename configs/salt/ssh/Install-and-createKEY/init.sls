Install ssh:
  pkg.installed:
    - pkgs:
      - openssh-server

ssh server:
  service.running:
    - name: ssh

#generate ssh-key:
#  cmd.run:
#    - name: |
#        mkdir ~/.ssh
#        ssh-keygen -q -N '' -f ./.ssh/id_rsa
#    - runas: root

Add private key:
  cmd.run: 
   - name: |
       eval "$(ssh-agent -s)"
       ssh-add ~/.ssh/id_rsa
   - user: root
