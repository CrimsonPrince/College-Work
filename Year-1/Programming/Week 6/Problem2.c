/* Programming Lab 5 Q2 
Arthur Coll */

#include <stdio.h>

int main()
{
    int counter = 0;
    int value = 0;
    
    printf("Please Enter a Value");
   
    scanf("%d", &value);
    
    while ( value == 0)
        { printf("Invalid Input try again");
            scanf("%d", &value);
            }

    while ( value != 1)
    { 
        if(value%2 != 0)
        { 
            value = value*3;
            value++;
            counter++;
            printf(" The next value is %d \n", value);
            
        }
        
        else
        { 
            value = value/2;
            counter++;
            printf("The next value is %d \n", value);
            
        }
        
    }
    
    printf("The Final Value is 1, it took %d steps", counter);
        
                
        flushall ();
        getchar();
        
    return(0);
        
}