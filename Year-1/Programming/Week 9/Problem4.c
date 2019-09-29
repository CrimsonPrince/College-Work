#include <stdio.h>
#define ROW 3
#define COL 2

int main()
{
    int data[ROW][COL];
    int largest = 0;
    int i, j;
    
    // code
int var1;
int *ptr;
var1 = 1;
ptr = &var1;

printf("the address of var1 is %p", &var1); // the %d should be %p
printf("ptr contains %p", &*ptr); 
/* 
there is a missing & and should be
&ptr
*/
printf("*ptr contains %d", *ptr); /* 
there is a missing * (indirection operator) and therefore should be*ptr
*/


    
flushall();
getchar();

return(0);
}