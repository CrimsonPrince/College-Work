/* Programming Lab 5 Q6
Arthur Coll */

#include <stdio.h>

int main()
{
    int counter = 0;  
    int ans = 0;
    
    
    printf("Sum of the odd numbers between 1-99 \n");
    
    for (; counter != 100; counter++)
    { 
        if  (counter%2 != 0)
        {
            ans = counter + ans;
        }
    }

    printf("%d is the sum of the odd number between 1-99 \n", ans);

    flushall();
    getchar();
        
    return(0);
        
}