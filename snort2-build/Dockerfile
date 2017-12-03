FROM kalilinux/kali-linux-docker

COPY ./config/sources.list /etc/apt/
RUN apt-get clean
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get install -y \
    libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev libnfnetlink0 \
    gcc flex bison make libpcap-dev libdnet-dev libdumbnet-dev libpcre3-dev libghc-zlib-dev

RUN mkdir -p /tmp/snort_src

#-------------------------------------------------------------------------
# Get and compile daq and snort
#-------------------------------------------------------------------------
WORKDIR /tmp/snort_src
RUN wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz
RUN wget https://www.snort.org/downloads/snort/snort-2.9.11.tar.gz
RUN tar -xvzf daq-2.0.6.tar.gz
RUN tar -xvzf snort-2.9.11.tar.gz

WORKDIR /tmp/snort_src/daq-2.0.6
RUN ./configure --with-libpcap-includes=/usr/include/libnetfilter_queue --with-libpcap-libraries=/usr/lib && make && make install

WORKDIR /tmp/snort_src/snort-2.9.11
RUN ./configure --enable-sourcefire && make && make install

RUN ldconfig

RUN ln -s /usr/local/bin/snort /usr/sbin/snort

RUN mkdir -p /etc/snort/rules
RUN mkdir /var/log/snort
RUN mkdir /usr/local/lib/snort_dynamicrules

RUN touch /etc/snort/rules/white_list.rules
RUN touch /etc/snort/rules/black_list.rules
RUN touch /etc/snort/rules/local.rules

RUN cp /tmp/snort_src/snort-2.9.11/etc/*.conf* /etc/snort
RUN cp /tmp/snort_src/snort-2.9.11/etc/*.map /etc/snort

#-------------------------------------------------------------------------
# Get and set community rules
#-------------------------------------------------------------------------
WORKDIR /tmp/snort_src
# RUN wget https://www.snort.org/rules/community -O /tmp/community.tar.gz
RUN wget https://www.snort.org/downloads/community/community-rules.tar.gz
RUN tar -xvf /tmp/snort_src/community-rules.tar.gz
RUN cp /tmp/snort_src/community-rules/* /etc/snort/rules
RUN sed -i 's/include \$RULE\_PATH/#include \$RULE\_PATH/' /etc/snort/snort.conf

#-------------------------------------------------------------------------
# Remove snort_src
#-------------------------------------------------------------------------
RUN rm -rf /tmp/snort_src

#-------------------------------------------------------------------------
# Set workdir and command
#-------------------------------------------------------------------------
WORKDIR /etc/snort

CMD ["/bin/bash"]