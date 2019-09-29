/* Arthur Coll 
Week 5 Problem Q1 */

#include <stdio.h>
int main()
{
    char status;
    
    
    scanf ( "%c", &status);
    
    switch(status)
    {
        case 'S':
        case 's':
        printf ( "single" );
        break;
       
        case 'M':
        case 'm':
        printf( "Married" );
        break;
            
        case  'W':
        case 'w':
        printf ("Widowed");
        break;
                
        case 'E':
        case 'e':
        printf ("Seperated");
        break;
                
        case 'D':
        case 'd':
        printf ("divorced");
        break;
                
        default: printf ("Invalid input");
    }
            
    flushall();
    getchar();
            
    return(0);
}