FROM kalilinux/kali-linux-docker

COPY ./config/sources.list /etc/apt/
RUN apt-get clean
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get install -y bro bro-aux tcpdump curl

COPY bro/src /usr/src/app

WORKDIR /usr/src/app

CMD ["/bin/bash"]
