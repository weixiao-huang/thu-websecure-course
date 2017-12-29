import select
import socket
import socketserver
import struct
import ssl
import _ssl
import os

basedir = os.path.abspath(os.path.dirname(__file__))

port = int(os.getenv('SERVER_PORT'))

class ThreadingTCPServer(socketserver.ThreadingMixIn, socketserver.TCPServer): pass


def handle_tcp(sock, remote):
    fdset = [sock, remote]
    while True:
        r, w, e = select.select(fdset, [], [])
        if sock in r:
            data = sock.recv(4096)
            if remote.send(data) <= 0: break
        if remote in r:
            data = remote.recv(4096)
            if sock.send(data) <= 0: break


class TLSTCPServer(socketserver.StreamRequestHandler):
    def handle(self):
        try:
            print('TLS TCP connection from %s:%d' % self.client_address)
            client_tcp = self.connection
            ssl_client_tcp = ssl.wrap_socket(client_tcp,
                                             server_side=True,
                                             certfile=os.path.join(basedir, 'cert.pem'),
                                             keyfile=os.path.join(basedir, 'key.pem'),
                                             ssl_version=_ssl.PROTOCOL_TLSv1)
            pkg = ssl_client_tcp.recv(1024)

            data = pkg[0:4]
            mode = data[1]
            addrtype = data[3]
            if addrtype == 1:  # IPv4
                addr = socket.inet_ntoa(pkg[4:8])
                port = struct.unpack('>H', pkg[8:10])
            elif addrtype == 3:  # Domain name
                ip_len = pkg[4]
                addr = pkg[5:5 + ip_len]
                port = struct.unpack('>H', pkg[5 + ip_len:7 + ip_len])
            reply = b"\x05\x00\x00\x01"
            try:
                if mode == 1:  # 1. Tcp connect
                    remote = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                    remote.connect((addr, port[0]))
                    print('Tcp connect to', addr, port[0])
                    local = remote.getsockname()
                    reply += socket.inet_aton(local[0]) + struct.pack(">H", local[1])
                else:
                    reply = b"\x05\x07\x00\x01"  # Command not supported
            except socket.error:
                # Connection refused
                reply = b"\x05\x05\x00\x01\x00\x00\x00\x00\x00\x00"
            ssl_client_tcp.send(reply)
            # 3. Transfering
            if not reply[1]:  # Success
                if mode == 1:  # 1. Tcp connect
                    handle_tcp(ssl_client_tcp, remote)
        except socket.error:
            print('socket error')


def main():
    server = ThreadingTCPServer(('0.0.0.0', port), TLSTCPServer)
    server.serve_forever()


if __name__ == '__main__':
    main()
