zeromq-playground
=================

Updates
-------
* Vagrant box 0.2.0:
  * Added zmq directly on the box, including libsodium for curve crypto support
  * Updated docker to 0.9.1
* Moved the Skydock/Skydns from Vagrant file to separate script.

Background
----------

This is a playground setup that I put together in preparation for attending [ZeroMQ CPH Community Meetup with Pieter Hintjen](http://www.eventbrite.com/e/zeromq-cph-community-meetup-with-pieter-hintjens-registration-10826864443?utm_campaign=event_reminder&ref=eemaileventremind&utm_medium=email&utm_source=eb_email&utm_term=eventname)

It is a vagrant box with docker installed and some docker containers for running [ØMQ](http://zeromq.org/).

There is also a script to install and run Skydns and Skydock (DNS based service discovery for docker) allowing containers to reference each other by dns name instead of ip address.

Install
-------
To use this setup you need to install:

* [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)

I am using this setup on Linux, but it should work on Mac and Windows as well.

Get
---
Clone this repository and start the box:
```
git clone https://github.com/madscoaducom/zeromq-playground
cd zeromq-playground
vagrant box add coadu/zeromq-playground
vagrant up
# time for coffee
```
To access the image:
```
vagrant ssh
```
ZMQ tutorial is located in `./zguide`

Run with Skydock
----------------
Setup Skydock/Skydns:
```
vagrant ssh
/vagrant/setup-skydock.sh
```

Here are instructions for running the [ØMQ zguide](http://zguide.zeromq.org/) Hello World example in Python. The source to zguide examples are included on the image, look in "zguide/examples".

**NOTE** that the standard examples are written for a singlehost setup, so some tweaking is needed for them to work here.

I have tweaked two of the examples and included the code in the app folder including run scripts.

For below examples when it says "Open a terminal and run", it expects you to be inside vagrant image in app folder:

```
vagrant ssh
cd app
```

#### [Hello World](http://zguide.zeromq.org/page:all#Ask-and-Ye-Shall-Receive)

Open a terminal and run:
```
./hwserver.sh
```

Open another terminal:
```
./hwclient.sh
```
You should see the server and client talking.


#### [BStar](http://zguide.zeromq.org/page:all#Binary-Star-Implementation)
Open a terminal and run:
```
./bstarprimary.sh
```

Open another terminal:
```
./bstarbackup.sh
```

Open a third terminal:
```
./bstarcli.sh
```

Now the primary and backup are connected, and the client connected to the primary. 

If you kill the primary:
```
sudo docker kill primary
```

You should see the client switching to use the backup.

#### Tweaking notes
When using hostnames in code they have to resolve at time of bind(), but skydock only adds entries to the skydns when a container starts. So the code has to be tolerant and wait to bind() untill necesary parts are running (Note that currently docker does not support assigning IP's to containers).

In the BStar example, the primary and backup need to know about each other at startup time, I have hacked the example for it to retry connection to the other node indefinetely. I am sure there are better solutions, but that is something to work on.


Working on your own code
------------------------
Simply place your source files inside the `app` folder on your host, and you can access it from vagrant, in `/home/vagrant/app` and in containers from `/app` (you can change this by means of the `-v` option to docker run)


Other clients
-------------
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
------------------
* Have fun with ZMQ

If you find (and fix?) issues please report them on [github](https://github.com/madscoaducom/zeromq-playground)


References
---------
This setup is possible because of these great projects and services:
* [Docker](http://docker.io)
* [Vagrant](http://www.vagrantup.com) and [Vagrant Cloud](http://www.vagrantcloud.com)
* [Skydns](https://github.com/skynetservices/skydns)
* [Skydoc](https://github.com/crosbymichael/skydock)
* [Ge.tt](http://ge.tt), hosting the Vagrant box

Check them out!
