#ifndef IN_SEPARATE
#define IN_SEPARATE

#include <stdio.h>

void printMessageFromSeparateHeader(char * message);
void printMessageFromSeparateHeader(char * message) {
    printf("MSG FROM DIFF hdr FILE:  '%s'\n", message);
}

void printANumber(int number);


#endif