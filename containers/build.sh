sudo docker pull crosbymichael/skydns
sudo docker pull crosbymichael/skydock
sudo docker run -d -p 172.17.42.1:53:53/udp --name skydns crosbymichael/skydns -nameserver 8.8.8.8:53 -domain docker
sudo docker run -d -v /var/run/docker.sock:/docker.sock --name skydock -link skydns:skydns crosbymichael/skydock -ttl 30 -environment dev -s /docker.sock -domain dockerR
for image in zeromq pyzmq; do (cd $image && sudo docker build --rm=true -t coadu/$image .); done 
