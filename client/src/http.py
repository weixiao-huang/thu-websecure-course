def get(host, url='/'):
    syn = IP(dst=host) / TCP(dport=80, flags='S')
    # get synack
    syn_ack = sr1(syn)
    
    getStr = 'GET %s HTTP/1.1\r\nHost: %s\r\n\r\n' % (url, host)
    # send ack and package
    request = IP(dst=host) / TCP(dport=80, sport=syn_ack[TCP].dport,
                 seq=syn_ack[TCP].ack, ack=syn_ack[TCP].seq + 1, flags='A') / getStr
    reply = sr1(request)