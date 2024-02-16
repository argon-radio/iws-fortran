#include <stdio.h>

extern void cfunc(int i) {
    printf("%s\n", "C says Hi!");
    printf("C received: %d\n", i);
}