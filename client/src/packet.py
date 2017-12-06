from scapy.all import *
from debug import handle_recv


dst='192.168.53.131'
url='/mitmproxy'

dport = 80
sport = random.randrange(0, 2**16)

l4 = IP(dst=dst)/TCP(sport=sport, dport=dport, flags=0, seq=random.randrange(0, 2**32))

# send data
getStr = 'GET %s HTTP/1.1\r\nHost: %s\r\n\r\n' % (url, dst)
l4[TCP].flags = 'PA'
# l4[TCP].seq += 1
packet = sr1(l4/getStr)

ans = sniff(filter='tcp port %s' % dport, count=10, timeout=2)

