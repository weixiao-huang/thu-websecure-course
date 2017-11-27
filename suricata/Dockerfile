FROM jasonish/suricata

COPY config/ /etc/yum.repos.d/
RUN dnf makecache

RUN yum update -y
RUN yum install -y net-tools iptables

CMD ["/bin/bash"]