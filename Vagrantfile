# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

 config.vm.synced_folder '/home/fateme/Desktop/Vagrant_project/configs', '/vagrant'
 config.vm.define "master" do |master|
   master.vm.box = "debian/stretch64"
   master.vm.hostname = "master"
   master.vm.network "private_network", ip: "192.168.33.10" 
   master.vm.provider "virtualbox" do |vb|
     vb.memory = 2048
     vb.cpus = 2
   end
 

   master.vm.provision "shell", inline: <<-SHELL
     sudo curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/salt/py3/debian/10/amd64/latest/salt-archive-keyring.gpg

     echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/salt/py3/debian/10/amd64/2016.7.17 buster main" | sudo tee /etc/apt/sources.list.d/salt.list

     apt-get update
     apt-get install salt-master -y 
     apt-get install salt-ssh -y
     apt-get install salt-api -y

     echo "Restart salt master"
     sudo systemctl restart salt-master.service

     echo "Add minion IPs to hosts"
     echo "192.168.33.11   minion1" >> /etc/hosts
     echo "192.168.33.12   minion2" >> /etc/hosts

   SHELL
 end
  
  (1..3).each do |i|
    disk_name = "./disk-minion#{i}.vdi"
    config.vm.define "minion#{i}" do |worker|
      worker.vm.box = "debian/stretch64"
      worker.vm.hostname = "minion#{i}"
      worker.vm.network "private_network", ip: "192.168.33.1#{i}"
      worker.vm.provider "virtualbox" do |vb|
      unless File.exist?(disk_name)
        vb.customize ['createhd', '--filename', disk_name, '--size', 50 * 1024]
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk_name]
      end
        vb.cpus = 2
        vb.memory = 3072
      end

      worker.vm.provision "shell", inline: <<-SHELL
        sudo curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/salt/py3/debian/10/amd64/latest/salt-archive-keyring.gpg

        echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/salt/py3/debian/10/amd64/2016.7.17 buster main" | sudo tee /etc/apt/sources.list.d/salt.list

        apt-get update
        apt-get install salt-minion -y
        apt-get install salt-ssh -y
        apt-get install salt-api -y
        
        apt-get install systemd-container -y
    
        echo "Restart salt minion"
        sudo systemctl restart salt-minion.service
        
        echo "Add salt IP to hosts"
        echo "192.168.33.10   salt" >> /etc/hosts
        echo "192.168.33.10   salt-master" >> /etc/hosts
        
        echo "Install lvm"
        sudo apt-get install lvm2 -y
        pvcreate /dev/sdb
        pvs
        vgcreate vg01 /dev/sdb
        vgdisplay vg01
     SHELL
    end
    
  end

end
