zeromq-playground
=================

This is a playground setup that I put together in preparation for attending [ZeroMQ CPH Community Meetup with Pieter Hintjen](http://www.eventbrite.com/e/zeromq-cph-community-meetup-with-pieter-hintjens-registration-10826864443?utm_campaign=event_reminder&ref=eemaileventremind&utm_medium=email&utm_source=eb_email&utm_term=eventname)

It is a vagrant box with docker installed and some docker containers for running [ØMQ](http://zeromq.org/).

In addition the box includes containers and configuration for using Skydns and Skydoc, for DNS based service discovery, allowing each container to find each other via names instead of ip addresses.

Install
=======
To use this setup you need to install:

* [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)

I am using this setup on Linux, but it should work on Mac and Windows as well.

Get
===
Clone this repository and start get the box:
```
git clone https://github.com/madscoaducom/zeromq-playground
cd zeromq-playground
vagrant up
(time for coffee)
```

Run
===
Here are instructions for running the [ØMQ zguide](http://zguide.zeromq.org/) Hellow World example in Python. The source to zguide examples are included on the image, look in "zguide/examples"

Open a terminal and run:
```
vagrant ssh
/vagrant/pyzmq.sh z1
python hwserver.py
```

Open another terminal:
```
vagrant ssh
/vagrant/pyzmq.sh z2
sed -i 's/localhost:5555/z1.pyzmq.dev.docker/'
python hwclient.py
```
You should see the server and client talking.

Learn more about the fun things you can do with [Skydoc](https://github.com/crosbymichael/skydock) and [Skydns](https://github.com/skynetservices/skydns)

Other clients
=============
Currently I have published a docker container with Python ØMQ bindings, but you can easily build others with your [prefered language bindings](http://zeromq.org/bindings:_start).

Simply:

* Copy pyzmq folder
* Edit Dockerfile
* Build docker image

```
docker build --rm=true -t <name of conainer> .
```
(Notice the trailing '.')

To run your new container, look in pyzmq.sh for an example, or lookup the [docker run](http://docs.docker.io/en/latest/reference/commandline/cli/#run) docs.

ToDo's and Issues:
==================


References
=========
This setup is possible because of these great projects:
* [Docker](http://docker.io)
* [Vagrant](http://www.vagrantup.com) and [Vagrant Cloud](http://www.vagrantcloud.com)
* [Ge.tt](http://ge.tt)
* [Skydns](https://github.com/skynetservices/skydns)
* [Skydoc](https://github.com/crosbymichael/skydock)
Check them out!
    

