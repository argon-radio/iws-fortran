#include <stdio.h>

int fortf(int a);

int main() {
    printf("%s\n", "C says Hi!");
    int a = 55;
    int b;
    b = fortf(a);
    printf("C received %d\n", b);
    return 0;
}