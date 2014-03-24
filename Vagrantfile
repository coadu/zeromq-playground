# -*- mode: ruby -*-
# # vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.box = "coadu/zeromq-playground"
  config.vm.box = "saucy"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"

  # Fix docker not being able to resolve private registry in VirtualBox
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

  # Open web app port to host
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 5080, host: 5080

  config.vm.synced_folder "./containers", "/home/vagrant/containers"
  config.vm.synced_folder "./app", "/home/vagrant/app"

  config.vm.provision "shell",
    inline: "sudo apt-get update && sudo apt-get -y upgrade"

  config.vm.provision "docker"

  # Patch to docker 0.9.0
  config.vm.provision "shell",
    inline: "sudo wget -O /etc/init/docker.conf https://raw.github.com/dotcloud/docker/master/contrib/init/upstart/docker.conf"

  config.vm.provision "shell",
    inline: "sudo sed -i '/#DOCKER_OPTS/ aDOCKER_OPTS=\"-dns 172.17.42.1\"' /etc/default/docker"

  config.vm.provision "shell",
    inline: "sudo docker service restart"

  config.vm.provision "shell",
    inline: "sudo docker pull crosbymichael/skydns"

  config.vm.provision "shell",
    inline: "sudo docker pull crosbymichael/skydock"

  config.vm.provision "shell",
    inline: "git clone --depth=1 git://github.com/imatix/zguide.git"

end
