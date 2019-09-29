/* Programming Lab 5 Q3
Arthur Coll */

#include <stdio.h>

int main()
{
    int counter = 0;
    int value = 0;
    
    
    printf("Please Enter a Value between 1 and 5");
   
    scanf("%d", &value);
    
    
    for(; counter <= 20; counter++ )
    { 
        if(counter%value == 0)
        { 
            printf("The even Value is %d \n", counter);   
        }
        
    }
    

    flushall();
    getchar();
        
    return(0);
        
}