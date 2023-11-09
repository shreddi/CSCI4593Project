#include "stdio.h"
#include "string.h"

/*
 *  c abstraction assignment
 */

int main() {
    unsigned int letter = 'j';
    int result = 0;
    int i = 0;
    for(i = 0; i < letter; i++){
        result = result + i + letter;
    }
    printf("Result = %d\n", result);
    return result;
}

//The time to implement this C program was about 10 minutes. It was easy to debug.
