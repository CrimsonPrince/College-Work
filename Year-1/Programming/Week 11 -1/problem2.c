#include <stdio.h>
#define PI 3.14

int main()
{   

int  count = 10, *temp, sum = 0;
temp = &count;
*temp = 20;
temp = &sum;
*temp = count;
printf("count = %d, *temp = %d, sum = %d \n", count, *temp, sum );
    
    
    
    
    flushall();
    getchar();
    
    return(0);
    
}