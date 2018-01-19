#include<stdio.h> 
#include<stdlib.h>

int main() { 
    FILE * fp;
    char buffer[80];
    system("ls > 1.txt");
    fp = popen("cat 1.txt","r");
    fgets(buffer, sizeof(buffer), fp);
    printf("ls: %s", buffer); 
    pclose(fp); 
    return 0;
}