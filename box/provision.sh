#!/bin/bash

# Patch to docker 0.9.0
sudo wget -O /etc/init/docker.conf https://raw.github.com/dotcloud/docker/master/contrib/init/upstart/docker.conf

# Prepare for skydns dns server
egrep -q "^DOCKER_OPTS=\"-dns" /etc/default/docker || sudo sed -i '/#DOCKER_OPTS/ aDOCKER_OPTS=\"-dns 172.17.42.1\"' /etc/default/docker

sudo service docker restart
sleep 5
