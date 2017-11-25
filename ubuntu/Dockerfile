FROM ubuntu:16.04

# 源不稳定，如果无法apt-get update，考虑注释掉COPY这一行
COPY ./config/sources.list /etc/apt/
RUN apt-get clean
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt install -y gcc libpcre3-dev zlib1g-dev libpcap-dev openssl \
    libssl-dev libnghttp2-dev libdumbnet-dev bison flex libdnet

# Define working directory.
WORKDIR /opt

ENV DAQ_VERSION 2.0.6
RUN wget https://www.snort.org/downloads/snort/daq-${DAQ_VERSION}.tar.gz \
    && tar -xvfz daq-${DAQ_VERSION}.tar.gz \
    && cd daq-${DAQ_VERSION} \
    && ./configure; make; make install

ENV SNORT_VERSION 2.9.9.0
RUN wget https://www.snort.org/downloads/snort/snort-${SNORT_VERSION}.tar.gz \
    && tar -xvfz snort-${SNORT_VERSION}.tar.gz \
    && cd snort-${SNORT_VERSION} \
    && ./configure --enable-sourcefire; make; make install

RUN ldconfig

RUN ln -s /usr/local/bin/snort /usr/sbin/snort