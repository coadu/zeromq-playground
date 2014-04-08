#!/bin/bash

sudo apt-get install -y git curl wget net-tools build-essential pkg-config libtool autoconf automake
sudo apt-get install -y vim emacs

sudo apt-get install -y uuid-dev

work=/tmp/zmq
mkdir -p $work

cd $work
wget https://download.libsodium.org/libsodium/releases/libsodium-0.4.5.tar.gz
wget https://download.libsodium.org/libsodium/releases/libsodium-0.4.5.tar.gz.sig
# TODO: Can't get this to work, dig +dnssec +short txt <file>.download.libsodium.org, see https://github.com/jedisct1/libsodium#installation
tar xzvf libsodium-0.4.5.tar.gz
cd libsodium-0.4.5
./autogen.sh
./configure && make && make check && sudo make install
ldconfig

cd $work
wget http://download.zeromq.org/zeromq-4.0.4.tar.gz
tar xzvf zeromq-4.0.4.tar.gz
cd zeromq-4.0.4
./autogen.sh
./configure && make && sudo make install
ldconfig

cd $work
wget https://github.com/zeromq/czmq/archive/v2.1.0.tar.gz
tar xzvf v2.1.0.tar.gz
cd czmq-2.1.0
./autogen.sh
./configure && make && sudo make install
ldconfig

rm -rf $work
