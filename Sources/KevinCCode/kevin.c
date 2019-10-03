#include "include/kevin.h"


void printHello() {
    printf("Hello from C and the SNERKLOR subsystem\n");
    printf("Data from Implementation:  %f\n", getDataFromImplementationDetail());
}

double getDataFromImplementationDetail() {
    double * detail = implementationDetail();
    return detail[1];
}

