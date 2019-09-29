/* Arthur Coll 
Week 5 Problem Q5*/

#include <stdio.h>
int main()
{
    int side1, side2, side3 ;
    
    
    printf("Enter side 1's value \n");
    scanf ("%i", &side1);
    
    printf("Enter side 2's value \n");
    scanf ("%i", &side2);
    
    printf("Enter the largest side 3's value \n");
    scanf ("%i", &side3);
    
    
    if(side1+side2 > side3)
    {
        printf ( "This is a triagle \n" );
    }
    
    else 
    {
        printf ( "This is not a triangle \n" );
    }
    

    flushall();
    getchar();
            
    return(0);
}