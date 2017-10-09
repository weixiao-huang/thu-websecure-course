FROM kalilinux/kali-linux-docker

COPY ./config/sources.list /etc/apt/
RUN apt clean
RUN apt -y update && apt -y upgrade && apt -y dist-upgrade

RUN apt install -y tcpdump nmap curl
