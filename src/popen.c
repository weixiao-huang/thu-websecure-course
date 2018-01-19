#include <stdio.h>

void get_cmd(char * buf, int size) {
    FILE *stream;
    stream = popen( "ls", "r" );
    fread( buf, sizeof(char), size, stream); //将刚刚FILE* stream的数据流读取到buf中
    pclose( stream );
}

int main() {
    char buf[256];
    get_cmd(buf, 256);
    printf("%s", buf);
    return 0;
}