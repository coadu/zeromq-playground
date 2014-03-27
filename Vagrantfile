# -*- mode: ruby -*-
# # vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "coadu/zeromq-playground"

  # Open ports to host
  config.vm.network "forwarded_port", guest: 5555, host: 5555

  config.vm.synced_folder "./app", "/home/vagrant/app"

  config.vm.provision "shell",
    inline: $script

end

$script = <<SCRIPT
  git clone --depth=1 git://github.com/imatix/zguide.git /home/vagrant/zguide
  sudo docker pull coadu/zeromq
  sudo docker pull coadu/pyzmq
SCRIPT

