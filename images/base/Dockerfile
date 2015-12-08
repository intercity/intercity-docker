# NAME:     todo_base
# VERSION:  0.1.0

FROM ubuntu:14.04

MAINTAINER Jeroen van Baarsen "https://twitter.com/jvanbaarsen"

RUN echo "0.1.0" > /VERSION

# Install dependencies
RUN apt-get -y upgrade &&\
    apt-get -y install software-properties-common &&\
    add-apt-repository -y ppa:rwky/redis &&\
    apt-get -y update &&\
    apt-get -y install build-essential git curl wget \
      libxslt-dev libcurl4-openssl-dev \
      libssl-dev libyaml-dev libtool \
      libxml2-dev \
      postgresql-9.3 postgresql-client-9.3 \
      postgresql-contrib-9.3 libpq-dev libreadline-dev \
      nginx vim nodejs openssh-server runit &&\
    mkdir -p /etc/runit/1.d

# Install ruby 2.2.3
RUN echo 'gem: --no-document' >> /usr/local/etc/gemrc &&\
       mkdir /src && cd /src &&\
       git clone https://github.com/sstephenson/ruby-build.git &&\
       cd /src/ruby-build && ./install.sh &&\
       cd / && rm -rf /src/ruby-build && ruby-build 2.2.3 /usr/local &&\
       gem update --system &&\
       gem install bundler &&\
       rm -rf /usr/local/share/ri/2.2.3/system

# Install Pups
RUN cd / && git clone https://github.com/SamSaffron/pups.git

# clean up for docker squash
RUN rm -fr /usr/share/man && rm -fr /usr/share/doc && mkdir -p /etc/runit/3.d

ADD runit-1 /etc/runit/1
ADD runit-2 /etc/runit/2
ADD runit-3 /etc/runit/3
ADD boot /sbin/boot

ADD cron /etc/service/cron/run
