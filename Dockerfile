FROM ubuntu:16.04
MAINTAINER Doug Toppin dougtoppin@gmail.com

COPY ./lenticulate.pl /tmp

WORKDIR /tmp

RUN [ "apt-get", "update" ]
RUN [ "apt-get", "install", "-y", "libgd-perl" ]

ENTRYPOINT [ "/tmp/lenticulate.pl" ]

