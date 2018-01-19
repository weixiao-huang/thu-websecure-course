# FROM kalilinux/kali-linux-docker
FROM ubuntu:16.04
LABEL AUTHOR="Weixiao Huang"

COPY ./config/sources.list /etc/apt/
RUN apt-get clean
RUN dpkg --add-architecture i386
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get install -y \
    sudo libc6:i386 libncurses5:i386 libstdc++6:i386 socat \
    gdb build-essential make gcc-multilib g++-multilib \
    python-dev python-pip
    # python3-dev python3-pip

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple zio
# RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple \
#     capstone keystone-engine unicorn retdec-python ropper

# RUN useradd -ms /bin/bash -r -u 1001 -g root recho
RUN useradd -m recho && echo "recho:recho" | chpasswd && adduser recho sudo
USER recho

COPY ./config/.gdbinit /home/recho

WORKDIR /usr/src/app

ENTRYPOINT [ "/bin/bash" ]