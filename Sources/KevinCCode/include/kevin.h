#ifndef IN_KEVIN
#define IN_KEVIN

#include <stdio.h>
#include <stdlib.h>

void printHello();
double getDataFromImplementationDetail();
double * implementationDetail();


double * implementationDetail() {

    double * allocated = malloc(sizeof(double) * 10);

    int i;

    for(i=0; i<10; i++) {
        allocated[i] = 0.5;
    }

    return allocated;
}

#endif