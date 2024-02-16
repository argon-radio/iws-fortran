#include <stdio.h>

void fortf(int *a);

int main() {
    printf("%s\n", "C says Hi!");
    int a = 55;
    fortf(&a);
    printf("C received %d\n", a);
    return 0;
}