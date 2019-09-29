/* Programming Lab 5 Q1
Arthur Coll */

#include <stdio.h>

int main()
{
    int counter = 0;
    
    while ( counter <= 10 )
    { printf("%d,", counter);
      counter++;
        }
        
        printf("End Program ");
        
        flushall ();
        getchar();
        
    return(0);
        
}