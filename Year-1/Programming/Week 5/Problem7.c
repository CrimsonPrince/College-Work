/* Arthur Coll 
Week 5 Problem Q7*/

#include <stdio.h>
int main()
{
    int input ;
    scanf ("%i", &input);
    
    switch(input) 
    {
        case 1: 
            printf("Monday");
            break;
        
        case 2: 
            printf("Tuesday");
            break;
        
        case 3: 
            printf("Wensday");
            break;
        
        case 4:
            printf("Thursday");
            break;
        
        case 5:
            printf("Friday");
            break;
        
        case 6:
            printf("Saturday");
            break;
        
        case 7:
            printf("Sunday");
            break;
        
       default: 
           printf("Invalid input");
       
  }

    flushall();
    getchar();
            
    return(0);
}