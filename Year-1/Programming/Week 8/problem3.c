/* Programming Lab week 8 Q3
Arthur Coll */

#include <stdio.h>


int main()
{
    int numbers[15];
    int i;
    
    
    for(i = 0 ; i < 15; i++)
    {
        printf("Please Enter a value \n");
        scanf("%d", &numbers[i]);
    }
    
    for(i = 0 ; i < 15; i++)
    {
        printf("%d \n", numbers[i]);
    }
    
    
    for(i = 0 ; i < 15; i++)
    {
        printf("%d ", numbers[i]);
    }
    
    printf("\n");
    
     for(i = 15 ; i > 0 ; i--)
    {
        printf("%d ", numbers[i]);
    }
    
    
    
    
    flushall();
    getchar();
    
    return(0);     
}
