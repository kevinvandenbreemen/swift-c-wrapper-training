#include <stdlib.h>

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

void callSwift(CallbackIntoSwift *callback) {
    printf("C Received a request to call Swift Code!\n");
    callback->callSwiftFromC(2501);
}

void executeAdvancedCode(CallbackWithArray *callback) {
    int *data = malloc(10 * sizeof(int));
    int i;
    for(i=0; i<10; i++) {
        data[i] = i*2;
    }

    int num = callback->executeAdvancedCode(data);

    free(data);

    printf("Result of call to Swift:  %d\n", num);
}