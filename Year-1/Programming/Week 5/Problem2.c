/* Arthur Coll Problem 2
Week 5 */
#include <stdio.h>
int main()
{
    int inputnum = 0;
    
    
    printf ( " Enter an integer between a 100 \n" );
    scanf( "%i", &inputnum );
    
    if( inputnum%2 == 0)
    {
        printf ( "You entered an even number \n" );
    }
    
    else 
    {
        printf ( "You entered an Odd Number \n" );
    }
    
    flushall();
    getchar();
    
    return (0);
    
}