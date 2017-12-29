import select
import socket
import socketserver
import ssl
import _ssl
import os

basedir = os.path.abspath(os.path.dirname(__file__))

# ---Change this address into your server addr---
server_ip = os.getenv('SERVER_IP')
# -----------------------------------------------

server_port = int(os.getenv('SERVER_PORT'))
server_addr = (server_ip, server_port)
client_port = int(os.getenv('CLIENT_PORT'))


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


class Socks5Server(socketserver.StreamRequestHandler):
    def handle(self):
        try:
            print('socks connection from %s:%d' % self.client_address)
            sock = self.connection

            # 1. Version
            sock.recv(1024)
            sock.send(b"\x05\x00")

            # 2. Request
            ## Server TCP
            server_tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

            context = ssl.SSLContext(_ssl.PROTOCOL_TLSv1)
            context.verify_mode = _ssl.CERT_REQUIRED
            context.check_hostname = True
            context.load_verify_locations(os.path.join(basedir, 'cert.pem'))
            ssl_server_tcp = context.wrap_socket(server_tcp, server_hostname='socks5')
            ssl_server_tcp.connect(server_addr)
            print('TLS TCP connect to the server %s:%d' % server_addr)

            ssl_server_tcp.send(sock.recv(1024))
            reply = ssl_server_tcp.recv(1024)

            ## socks send the reply from the server TCP
            sock.send(reply)
            # 3. Transfering
            if not reply[1]:  # Success
                handle_tcp(sock, ssl_server_tcp)
        except socket.error:
            print('socket error')


def main():
    server = ThreadingTCPServer(('0.0.0.0', client_port), Socks5Server)
    server.serve_forever()


if __name__ == '__main__':
    main()
