#include <stdio.h>

int main()
{
   int i;
    int a[8];

for  (i = 0; i < 10; i++)
{
    a[i]  = 9 -i;
    printf("%d \n", a[i]);
}

for  (i = 0; i < 10; i++)
{
    a[i]  = a[ a[i]  ];
    printf("%d \n", a[i]);
}

flushall();
getchar();

return(0);
}