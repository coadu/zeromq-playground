FROM stackbrew/ubuntu:13.10
MAINTAINER Mads Flensted-Urech, Coadu.com
 
RUN echo 'deb http://archive.ubuntu.com/ubuntu saucy main universe' > /etc/apt/sources.list
RUN apt-get update -y

RUN apt-get install -y --force-yes tar git curl nano wget dialog net-tools build-essential
RUN apt-get install -y --force-yes vim emacs

# TODO: add libsodium to this image
RUN apt-get install -y --force-yes uuid-dev
RUN cd /root && wget http://download.zeromq.org/zeromq-4.0.4.tar.gz
RUN cd /root && tar xzvf zeromq-4.0.4.tar.gz
RUN cd /root/zeromq-4.0.4 && ./configure && make && make install
