FROM ubuntu:16.04

# 源不稳定，如果无法apt-get update，考虑注释掉COPY这一行
COPY ./config/sources.list /etc/apt/
RUN apt-get clean
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get install -y python3 curl net-tools
