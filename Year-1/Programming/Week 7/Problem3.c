/* Programming Lab week 7 Q3
Arthur Coll */

#include <stdio.h>
#define NUM_ELEMENTS 4

int main()
{
    int Values[NUM_ELEMENTS];
    int index;
    
    for( index = 0; index < NUM_ELEMENTS; index++)
    {
        printf("Please Enter Value %d \n", index + 1);
        scanf("%d", &Values[index]);
    }
    
    printf("You entered the values in the following order \n ");
    
    for( index = 0; index < NUM_ELEMENTS; index++)
    {
        printf("You entered %d \n", Values[index]);
    }

    
    printf("The values will now be modified, Printing below \n");

        printf("%d", Values[1] ) ;
        printf("%d", Values[0] ) ;
        printf("%d", Values[3] ) ;
        printf("%d", Values[2] ) ;
        
    
    
    
    printf(" \n Limit of 5 reached, Program Ending, Press Any Key");
    flushall();
    getchar();
    
    return(0);
}