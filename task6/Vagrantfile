Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "forwarded_port", guest: 80, host: 20080, host_ip: "0.0.0.0"
  config.vm.network "forwarded_port", guest: 81, host: 20081, host_ip: "0.0.0.0"
  config.vm.network "forwarded_port", guest: 82, host: 20082, host_ip: "0.0.0.0"

  config.vm.provider "virtualbox" do |vb|
      vb.name = "docker-lab1"
      vb.memory = "2048"
   end

  config.vm.provision :docker
  config.vm.provision :docker_compose

  config.vm.provision "shell", inline: <<-SHELL
  apt-get update
  apt-get install -y mc iptraf-ng links
  SHELL
end