#include "include/kevin.h"
#include "include/separate.h"

void printHello() {
    printf("Hello from C and the SNERKLOR subsystem\n");
    printf("Data from Implementation:  %f\n", getDataFromImplementationDetail());

    printMessageFromSeparateHeader("Hello separate header");

}

double getDataFromImplementationDetail() {
    double * detail = implementationDetail();
    return detail[1];
}

void printANumber(int number) {
    printf("Hello from a separate header.  The number is %d\n", number);
}