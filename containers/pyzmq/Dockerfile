FROM coadu/zeromq
MAINTAINER Mads Flensted-Urech, Coadu.com
 
RUN apt-get install -y --force-yes python python-dev python-setuptools
RUN cd root && wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py && python get-pip.py
RUN pip install pyzmq

WORKDIR /app
