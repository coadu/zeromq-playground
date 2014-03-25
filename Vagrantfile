# -*- mode: ruby -*-
# # vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "coadu/zeromq-playground"
  config.vm.box_url = "http://"

  # Open ports to host
  config.vm.network "forwarded_port", guest: 5555, host: 5555

  config.vm.synced_folder "./app", "/home/vagrant/app"

  config.vm.provision "shell",
    inline: "git clone --depth=1 git://github.com/imatix/zguide.git ./app/zguide"

end
