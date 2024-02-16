#include <stdio.h>

int cfunc(int i) {
    printf("%s\n", "C says Hi!");
    printf("C received: %d\n", i);
    return 6;
}