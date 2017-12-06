from scapy.all import *
from split import split

def handle_recv(pkt):
    if pkt[TCP].flags & 4 != 0:      # RST
        raise Exception("RST")

def get(dst='192.168.53.131', url='/mitmproxy'):
    dport = 80
    sport = random.randrange(0, 2**16)

    l4 = IP(dst=dst)/TCP(sport=sport, dport=dport, flags=0, seq=random.randrange(0, 2**32))

    # start
    # send syn
    l4[TCP].flags = 'S'

    # reveice syn_ack
    syn_ack = sr1(l4)
    handle_recv(syn_ack)
    l4[TCP].flags = 'A'

    # hack
    # rst = l4.copy()
    # rst[TCP].flags = 'R'
    # ack = l4.copy()
    # ack[TCP].ack = syn_ack[TCP].seq
    # ack[TCP].seq = syn_ack[TCP].ack
    # send(rst)
    # send(ack)

    # send ack
    l4[TCP].seq += 1
    l4[TCP].ack = syn_ack[TCP].seq + 1
    send(l4)

    # send data
    getStr = 'GET %s HTTP/1.1\r\nHost: %s\r\n\r\n' % (url, dst)
    l4[TCP].flags = 'PA'
    # l4[TCP].seq += 1
    packet = sr1(l4/getStr)
    handle_recv(packet)
    ans = sniff(filter='tcp port %s' % dport, count=10, timeout=2)

    packet = ans[-1]
    handle_recv(packet)

    pkts = plist.PacketList()

    will_finish = False
    finished = False
    while packet is not None:
        handle_recv(packet)
        l4[TCP].ack = packet[TCP].seq
        try:
            l4[TCP].ack += len(packet[TCP].load)
        except AttributeError as e:
            pass
        if packet[TCP].flags & 0x1 == 1:     # FIN
            l4[TCP].flags = 'FA'
            l4[TCP].ack += 1
            will_finish = True
        else:
            l4[TCP].flags = 'A'
        l4[TCP].seq = packet[TCP].ack
        pkts.append(packet)
        packet = sr1(l4, timeout=1)
        if will_finish:
            finished = True
            break
    # ans = sniff(filter='tcp port %s' % dport, count=10, timeout=2)

    if not finished:
        l4[TCP].flags = 'FA'
        fin_ack = sr1(l4)
        l4[TCP].flags = 'A'
        l4[TCP].seq = fin_ack[TCP].ack
        l4[TCP].ack = fin_ack[TCP].seq + 1
        send(l4)

    return pkts

def getSplit(keyword='mitmproxy', dst='192.168.53.131', url='/mitmproxy'):
    dport = 80
    sport = random.randrange(0, 2**16)

    l4 = IP(dst=dst)/TCP(sport=sport, dport=dport, flags=0, seq=random.randrange(0, 2**32))

    # start
    # send syn
    l4[TCP].flags = 'S'

    # reveice syn_ack
    syn_ack = sr1(l4)
    handle_recv(syn_ack)
    l4[TCP].flags = 'A'

    # hack
    # rst = l4.copy()
    # rst[TCP].flags = 'R'
    # ack = l4.copy()
    # ack[TCP].ack = syn_ack[TCP].seq
    # ack[TCP].seq = syn_ack[TCP].ack
    # send(rst)
    # send(ack)

    # send ack
    l4[TCP].seq += 1
    l4[TCP].ack = syn_ack[TCP].seq + 1
    send(l4)

    # send data
    getStr = 'GET %s HTTP/1.1\r\nHost: %s\r\n\r\n' % (url, dst)
    l4[TCP].flags = 'PA'
    # l4[TCP].seq += 1
    splitedPkts = split(l4/getStr, keyword)
    send(splitedPkts[0])
    # packet = sr1(l4/getStr)
    packet = sr1(splitedPkts[1])
    handle_recv(packet)
    ans = sniff(filter='tcp port %s' % dport, count=10, timeout=2)

    packet = ans[-1]
    handle_recv(packet)

    pkts = plist.PacketList()

    will_finish = False
    finished = False
    while packet is not None:
        handle_recv(packet)
        l4[TCP].ack = packet[TCP].seq
        try:
            l4[TCP].ack += len(packet[TCP].load)
        except AttributeError as e:
            pass
        if packet[TCP].flags & 0x1 == 1:     # FIN
            l4[TCP].flags = 'FA'
            l4[TCP].ack += 1
            will_finish = True
        else:
            l4[TCP].flags = 'A'
        l4[TCP].seq = packet[TCP].ack
        pkts.append(packet)
        packet = sr1(l4, timeout=1)
        if will_finish:
            finished = True
            break
    # ans = sniff(filter='tcp port %s' % dport, count=10, timeout=2)

    if not finished:
        l4[TCP].flags = 'FA'
        fin_ack = sr1(l4)
        l4[TCP].flags = 'A'
        l4[TCP].seq = fin_ack[TCP].ack
        l4[TCP].ack = fin_ack[TCP].seq + 1
        send(l4)

    return pkts


if __name__ == '__main__':
    get()
