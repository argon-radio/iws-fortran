#include <stdio.h>

extern void cfunc(char *str) {
    printf("%s\n", "C says Hi!");
    printf("C on behalf of Fortran: \"%s\"\n", str);
}