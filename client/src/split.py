#!/usr/bin/env python3
from scapy.all import *
from time import sleep

def split(ippacket, keyword):
    pkts = plist.PacketList()
    data = ippacket.load
    pos = data.find(keyword.encode('utf-8'))
    cur = 0
    while pos >= 0:
        cut = pos + len(keyword) - 1 - (pos + len(keyword) - 1) % 8
        if (cut <= pos):
            print("Error! This data can not escape the IDS by splitting.")
            return

        leftdata = data[:cut]
        data = data[cut:]

        leftpkt = ippacket.copy()
        leftpkt.load = leftdata
        leftpkt.flags = "MF"
        leftpkt.frag = int(cur / 8)
        pkts.append(leftpkt)
        cur = cur + cut;

        pos = data.find(keyword.encode('utf-8'))

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


def get(host, url='/'):
    # send syn
    syn = IP(dst=host) / TCP(dport=80, flags='S')
    # get synack
    syn_ack = sr1(syn)
    
    getStr = 'GET %s HTTP/1.1\r\nHost: %s\r\n\r\n' % (url, host)
    # send ack and package
    request = IP(dst=host) / TCP(dport=80, sport=syn_ack[TCP].dport,
                 seq=syn_ack[TCP].ack, ack=syn_ack[TCP].seq + 1, flags='A') / getStr
    reply = sr1(request)
    return reply


def get_by_split(keyword, host, url='/'):
    target = (host, url)
    dport = 80
    sport = random.randrange(0, 2**16)
    # send syn
    l4 = IP(dst=host) / TCP(sport=sport, dport=dport, flags=0, seq=random.randrange(0, 2**32))
    l4[TCP].flags = 'S'

    # get synack
    syn_ack = sr1(l4)
    l4[TCP].flags = 'A'

    # send ack
    l4[TCP].seq += 1
    l4[TCP].ack = syn_ack[TCP].seq + 1
    send(l4)
    
    getStr = 'GET %s HTTP/1.1\r\nHost: %s\r\n\r\n' % (url, host)
    l4[TCP].flags = 'PA'
    # send ack and package
    # request = IP(dst=host) / TCP(dport=80, sport=syn_ack[TCP].dport,
                #  seq=syn_ack[TCP].ack, ack=syn_ack[TCP].seq + 1, flags='PA') / getStr
    pkts = split(l4/getStr, keyword)
    pkts.show()

    sendpkts(pkts)


# test
if __name__ == "__main__":
    packet = IP(dst="8.8.8.8")/TCP()/"I want to search on Google scholar!"
    packet.show()

    keyword = "Google"

    pkts = split(packet, keyword)
    pkts.show()

    send(packet)
    sendpkts(pkts)
