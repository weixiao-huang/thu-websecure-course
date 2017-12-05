FROM huangwx/snort3

RUN apt-get update -y
RUN apt-get install -y tcpdump

WORKDIR /tmp
RUN wget https://github.com/snortadmin/snort3/archive/master.tar.gz
RUN tar -xvzf master.tar.gz
WORKDIR /tmp/snort3-master/extra
RUN autoreconf -isvf
ENV PKG_CONFIG_PATH=/opt/snort/lib/pkgconfig
RUN ./configure --prefix=/opt/snort && make && make install

WORKDIR /opt/snort/etc/snort
RUN rm -rf /tmp/*

COPY snort3/snort.lua /opt/snort/etc/snort/snort.lua
COPY snort3/rules/local.rules /opt/snort/etc/snort/rules/local.rules

# CMD ["/bin/bash"]
# CMD snort -c snort.lua -R rules/local.rules -i eth0:eth1 -A alert_fast -k none --daq afpacket -Q
CMD snort -c snort.lua -R rules/local.rules -A alert_fast -k none --daq nfq -Q --plugin-path /opt/snort/lib/snort_extra