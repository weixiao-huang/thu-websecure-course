FROM kalilinux/kali-linux-docker

COPY ./config/sources.list /etc/apt/
RUN apt-get clean
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get install -y python3-pip python3-dev libffi-dev libssl-dev tcpdump curl

COPY src/ /usr/src/app/
WORKDIR /usr/src/app

CMD ["python3", "socks5_server.py"]
