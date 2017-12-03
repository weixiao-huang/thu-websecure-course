FROM kalilinux/kali-linux-docker

COPY ./config/sources.list /etc/apt/
RUN apt-get clean
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get install -y suricata

WORKDIR /etc/suricata

COPY suricata/suricata.yaml .

CMD ["/bin/bash"]
# CMD ["suricata", "-c", "suricata.yaml", "-q", "0"]