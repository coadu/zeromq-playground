FROM stackbrew/ubuntu:13.10
MAINTAINER Mads Flensted-Urech, Coadu.com
 
RUN echo 'deb http://archive.ubuntu.com/ubuntu saucy main universe' > /etc/apt/sources.list
RUN apt-get update -y

RUN apt-get install -y tar git curl wget dialog net-tools build-essential vim emacs nano
RUN apt-get install -y python python-dev python-distribute python-pip

RUN apt-get install -y uuid-dev
RUN cd /root && wget http://download.zeromq.org/zeromq-4.0.4.tar.gz
RUN cd /root && tar xzvf zeromq-4.0.4.tar.gz
RUN cd /root/zeromq-4.0.4 && ./configure && make && make install
RUN pip install pyzmq

WORKDIR /usr/src/zguide/examples/Python
