#include <stdio.h>
#define MAX 3

int main()
{   
    float array1[3];
    float array2[3];
    int i;
    float *ptr , *ptr2;
    
    
    printf("Enter 3 values please \n");
    for(i=0; i < MAX; i++)
    {
        scanf("%f", &array1[i]);
        
    }
   
    ptr = array1;
    ptr2 = array2;
    
    for (i=0; i < MAX; i++)
    {
      *(ptr2 + i) = *(ptr + i);
    }
    
    for ( i=0; i < MAX; i++)
    {
        printf(" \n %d \n", array1[i]);
    }
    
    

    flushall();
    getchar();
    
    return(0);
    
}