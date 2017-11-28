#!/usr/bin/env python
from scapy.all import *

def split(ippacket, keyword):
    pkts = plist.PacketList()
    data = ippacket.load
    pos = data.find(keyword)
    cur = 0
    while pos >= 0:
        cut = pos + len(keyword) - 1 - (pos + len(keyword) - 1) % 8
        if (cut <= pos):
            print "Error! This data can not escape the IDS by splitting."
            return

        leftdata = data[:cut]
        data = data[cut:]

        leftpkt = ippacket.copy()
        leftpkt.load = leftdata
        leftpkt.flags = "MF"
        leftpkt.frag = int(cur / 8)
        pkts.append(leftpkt)
        cur = cur + cut;

        pos = data.find(keyword)

    endpkt = ippacket.copy()
    endpkt.load = data
    endpkt.flags = 0
    endpkt.frag = int(cur / 8)
    pkts.append(endpkt)
    return pkts


def sendpkts(pkts):
    number = len(pkts)
    for i in range(number):
        pkts[i].show()
        send(pkts[i])

# test
if __name__ == "__main__":
    packet = IP(dst="8.8.8.8")/TCP()/"I want to search on Google scholar!"
    packet.show()

    keyword = "Google"

    pkts = split(packet, keyword)
    pkts.show()

    send(packet)
    sendpkts(pkts)


