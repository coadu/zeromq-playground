name=$1
shift
sudo docker run -d -v /home/vagrant/app:/app --name $name coadu/pyzmq $@
