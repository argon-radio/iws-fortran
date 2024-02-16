#include <stdio.h>

void fprint(int a, char b[]);

int main()
{
    printf("%s\n", "C says Hi!");
    char b[] = "I come from C and this is crazy";
    fprint(sizeof(b), b);
    return 0;
}
