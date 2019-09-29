#include <stdio.h>
#define PI 3.14

int main()
{   

int array[3];
int array2[3];
int i;

    
    for( i =0; i < 3; i++)
    { 
       
        scanf("%d", &*(array + i));
    }
 
for( i =0 ; i <  3; i++)
{
    
    *(array2 + i) = *(array + i);
    printf("%d \n", *(array2+i));
}

    
    
    flushall();
    getchar();
    
    return(0);
    
}