name=$1
shift
sudo docker run -i -t --rm=true -v /home/vagrant/app:/app --name $name coadu/pyzmq $@
