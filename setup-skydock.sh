#Prepare docker dns for skydns dns server
sudo docker pull crosbymichael/skydns
sudo docker pull crosbymichael/skydock
egrep -q "^DOCKER_OPTS=\"-dns" /etc/default/docker || sudo sed -i '/#DOCKER_OPTS/ aDOCKER_OPTS=\"-dns 172.17.42.1\"' /etc/default/docker
sudo service docker restart
sudo docker run -d -p 172.17.42.1:53:53/udp --name skydns crosbymichael/skydns -nameserver 8.8.8.8:53 -domain docker
sudo docker run -d -v /var/run/docker.sock:/docker.sock --name skydock --link=skydns:skydns crosbymichael/skydock -ttl 30 -environment dev -s /docker.sock -domain dockerR
