/* Programming Lab 5 Q4
Arthur Coll */

#include <stdio.h>

int main()
{
    int counter = 0;    
    
    
    printf("Counting Program \n");
   
  
    for(; counter < 11; counter++ )
    { 
        if( counter == 3 || counter == 7)
        { 
            printf("This is Number %d \n", counter);                  
        }
       
        else
        { 
            printf("%d  \n", counter);
        }
    }
    

    flushall();
    getchar();
        
    return(0);
        
}