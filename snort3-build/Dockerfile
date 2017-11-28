FROM kalilinux/kali-linux-docker

COPY ./config/sources.list /etc/apt/
RUN apt-get clean
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get install -y \
    build-essential autotools-dev libdumbnet-dev libluajit-5.1-dev libpcap-dev libpcre3-dev \
    zlib1g-dev pkg-config libhwloc-dev cmake bison flex libtool autoconf libssl-dev python-dev

RUN mkdir -p /tmp/snort_src
RUN mkdir -p /tmp/snort_src/hyperscan-4.5.2-build
WORKDIR /tmp/snort_src

RUN wget http://downloads.sourceforge.net/project/safeclib/libsafec-10052013.tar.gz
RUN wget http://www.colm.net/files/ragel/ragel-6.10.tar.gz
RUN wget https://dl.bintray.com/boostorg/release/1.64.0/source/boost_1_64_0.tar.gz
RUN wget https://github.com/01org/hyperscan/archive/v4.5.2.tar.gz
RUN wget https://www.snort.org/downloads/snortplus/daq-2.2.2.tar.gz
RUN wget https://github.com/snortadmin/snort3/archive/master.tar.gz
RUN wget https://www.snort.org/downloads/community/snort3-community-rules.tar.gz

RUN tar -xzf snort3-community-rules.tar.gz
RUN tar -xzf daq-2.2.2.tar.gz
RUN tar -xzf master.tar.gz
RUN tar -xzf libsafec-10052013.tar.gz
RUN tar -xzf ragel-6.10.tar.gz
RUN tar -xzf boost_1_64_0.tar.gz
RUN tar -xzf v4.5.2.tar.gz

WORKDIR /tmp/snort_src/libsafec-10052013
RUN ./configure && make && make install

WORKDIR /tmp/snort_src/ragel-6.10
RUN ./configure && make && make install

WORKDIR /tmp/snort_src/hyperscan-4.5.2-build
RUN cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBOOST_ROOT=/tmp/snort_src/boost_1_64_0/ ../hyperscan-4.5.2 && make && make install

WORKDIR /tmp/snort_src/daq-2.2.2
RUN ./configure && make && make install

RUN ldconfig

ADD tmp/master.tar.gz /tmp/snort_src
WORKDIR /tmp/snort_src/snort3-master
# WORKDIR /tmp/snort_src/snort-3.0.0-a4
RUN autoreconf -isvf
RUN ./configure --prefix=/opt/snort && make && make install

ENV LUA_PATH=/opt/snort/include/snort/lua/\?.lua\;\;
ENV SNORT_LUA_PATH=/opt/snort/etc/snort

RUN mkdir -p /opt/snort/etc/snort/rules
WORKDIR /tmp/snort_src/snort3-community-rules
RUN cp snort3-community.rules /opt/snort/etc/snort/rules/
RUN cp sid-msg.map /opt/snort/etc/snort/rules/

RUN rm -rf /tmp/snort_src && ln -s /opt/snort/bin/snort /usr/sbin/snort

WORKDIR /opt/snort/etc/snort
