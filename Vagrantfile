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
  sudo docker pull crosbymichael/skydns
  sudo docker pull crosbymichael/skydock
  sudo docker pull coadu/zeromq
  sudo docker pull coadu/pyzmq
  sudo docker run -d -p 172.17.42.1:53:53/udp --name skydns crosbymichael/skydns -nameserver 8.8.8.8:53 -domain docker
  sudo docker run -d -v /var/run/docker.sock:/docker.sock --name skydock --link=skydns:skydns crosbymichael/skydock -ttl 30 -environment dev -s /docker.sock -domain dockerR
SCRIPT

