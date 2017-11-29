FROM kalilinux/kali-linux-docker

COPY ./config/sources.list /etc/apt/
RUN apt-get clean
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get install -y python3-pip python3-dev libffi-dev libssl-dev tcpdump curl
RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple scapy-python3

COPY src/ /usr/src/app/
WORKDIR /usr/src/app
