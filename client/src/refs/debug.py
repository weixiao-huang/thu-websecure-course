from scapy.all import *

def handle_recv(pkt):
    if pkt[TCP].flags & 4 != 0:      # RST
        raise Exception("RST")
