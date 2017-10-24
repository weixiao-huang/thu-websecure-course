FROM kalilinux/kali-linux-docker

COPY ./config/sources.list /etc/apt/
RUN apt-get clean
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

# RUN apt install -y python3 python3-pip libffi-dev libssl-dev
RUN apt-get install -y python3-pip python3-dev libffi-dev libssl-dev tcpdump
RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple mitmproxy scapy-python3

COPY src/ /usr/src/app/
WORKDIR /usr/src/app

ENV LANG=en_US.UTF-8