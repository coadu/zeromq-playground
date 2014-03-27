#!/bin/bash

apt-get install -y --force-yes git curl wget net-tools build-essential
apt-get install -y --force-yes vim emacs

apt-get install -y --force-yes uuid-dev

workdir=/home/vagrant/tmp
mkdir -p $work

cd $work
wget https://download.libsodium.org/libsodium/releases/libsodium-0.4.5.tar.gz
wget https://download.libsodium.org/libsodium/releases/libsodium-0.4.5.tar.gz.sig
# TODO: Can't get this to work, dig +dnssec +short txt <file>.download.libsodium.org, see https://github.com/jedisct1/libsodium#installation
tar xzvf libsodium-0.4.5.tar.gz
cd libsodium-0.4.5
./configure && make && make check && make install

cd $work
wget http://download.zeromq.org/zeromq-4.0.4.tar.gz
tar xzvf zeromq-4.0.4.tar.gz
cd zeromq-4.0.4
./configure && make && make install

rm -rf $work
