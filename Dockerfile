FROM alpine
MAINTAINER Doug Toppin dougtoppin@gmail.com

COPY ./lenticulate.pl /tmp

WORKDIR /tmp

RUN [ "apk", "update" ]
RUN [ "apk", "add", "perl" ]
RUN [ "apk", "add", "perl-gd" ]

ENTRYPOINT [ "/tmp/lenticulate.pl" ]

