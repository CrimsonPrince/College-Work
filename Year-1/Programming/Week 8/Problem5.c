/* Programming Lab week 8 Q4
Arthur Coll */

#include <stdio.h>


int main()
{
    int values[5];
    int values2[5];
    int i, j;
    
    for( i=0; i < 5; i++)
    {   
        printf("Enter Values \n");
        scanf("%d", &values[i]);
    }
        
    for( i=0; i < 5; i++)
    {
        printf("Enter Values 2 \n");
        scanf("%d", &values2[i]);
    }

    for( i=0; i < 5; i++)
    {
        j = values[i] + values2[i];
        printf("%d is the value togetheerr \n", j);
    }

    
    flushall();
    getchar();
    
    return(0);     
}
