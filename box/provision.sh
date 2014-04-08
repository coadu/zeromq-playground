#!/bin/bash

sudo apt-get install -y git curl wget net-tools
sudo apt-get install -y build-essential pkg-config libtool autoconf automake
sudo apt-get install -y vim emacs

sudo apt-get install -y uuid-dev

work=/usr/src

cd $work
git clone http://github.com/jedisct1/libsodium.git
cd libsodium
./autogen.sh
./configure && make check
make install
ldconfig

cd $work
git clone http://github.com/zeromq/libzmq.git
cd libzmq
./autogen.sh
./configure && make check
make install
ldconfig

cd $work
git clone http://github.com/zeromq/czmq.git
cd czmq
./autogen.sh
./configure && make check
make install
ldconfig
