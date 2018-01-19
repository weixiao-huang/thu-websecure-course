INPUT      := ./recho.c ./libc.so.6 
CFLAGS     := -m32 -fno-stack-protector -z execstack 

OUTPUT     := irecho

default:
	gcc $(INPUT) $(CFLAGS) -o $(OUTPUT)

clean:
	rm $(OUTPUT)
