#include <stdio.h>

struct compatible
{
    int i1;
    double d1;
};

void fillstruct(struct compatible *s);

int main() {
    struct compatible s;
    fillstruct(&s);
    printf("Integer: %d\nDouble: %f\n", s.i1, s.d1);
}