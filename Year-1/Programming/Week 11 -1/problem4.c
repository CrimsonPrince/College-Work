#include <stdio.h>
#define PI 3.14

int main()
{   

float array[3] = {1.1, 2.2, 3.3};
float array2[3];
int i = 0;

    

 
for( i=0 ;i<3 ;i++)
{
    
    *(array2 + i) = &*(array + i);
    printf("%d \n", *(array2 + i ));
}

    
    
    flushall();
    getchar();
    
    return(0);
    
}