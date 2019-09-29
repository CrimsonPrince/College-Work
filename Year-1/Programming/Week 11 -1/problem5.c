#include <stdio.h>


int main()
{   

float gallons[5];
float miles[5];
float mpg[5];
    int i;

    
    printf("Enter a Gallon value \n");
    
    for( i =0; i < 5; i++)
    {
        
        scanf("%f", (gallons + i));
    }

 printf("Enter a miles value \n");
    
    for( i =0; i < 5; i++)
    {
        
        scanf("%f", (miles + i));
    }
    
    for( i=0; i < 5; i++)
    {
        *(mpg + i) = *(miles + i) / *(gallons + i);
    }
    
    for( i=0; i <5; i++)
    {
        printf("%f \n", *(mpg + i));
    }
    
    
    
    flushall();
    getchar();
    
    return(0);
    
}