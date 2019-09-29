/* Programming Lab week 7 Q2
Arthur Coll */

#include <stdio.h>
#define NUM_CONV 3


int main()
{
    float TempVal[NUM_CONV];
    int index;
    float celsius[NUM_CONV];
    
    
    printf("Arthur's Tempature Converting Program \n");
    
    
    for(index=0; index < NUM_CONV; index++)
    {
        printf("Please Enter celsius value %d \n ", index + 1 );
        scanf("%f", &TempVal[index]);
    }
    
    
    for(index=0; index < NUM_CONV; index++)
    {
        celsius[index] = (TempVal[index] - 32.0) * (5.0 / 9.0);
        printf("You entered %f farnheight which is %f celsius \n", TempVal[index], celsius[index]);
    }
    
    
        
      
    
    printf("/n Limit of 3 reached, Program Ending, Press Any Key");
    flushall();
    getchar();
    
    return(0);
}