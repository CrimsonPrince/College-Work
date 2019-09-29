/* Programming Lab 5 Q5
Arthur Coll */

#include <stdio.h>

int main()
{
    int counter = 0;    
    
    
    printf("Even Numbers between 1 and a 100 are \n");
    
    for (; counter != 102; counter++)
    { 
        if  (counter%2 == 0)
        {
            printf("%d is an even number between 1 and a hundred \n", counter);
        }
    }

    

    flushall();
    getchar();
        
    return(0);
        
}