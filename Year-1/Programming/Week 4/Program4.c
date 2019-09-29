/*
My Cool Comments
*/

#include <stdio.h>

int main()

{
   
    float decimal4 ,decimal3 ,decimal1;
    
    
    printf ( "Enter a 4 Decimal number");
    scanf ( "%f", &decimal4) ;
    
    printf ( "Enter a 3 Decimal number");
    scanf ( "%f", &decimal3) ;
    
        
    printf ( "Enter a 1 Decimal number");
    scanf ( "%f", &decimal1) ;
    
    
    
    
    
    
    printf ( "%8.4f", decimal4);
    printf ( "%.3f", decimal3);
    printf ("%.0f", decimal1);
    
    flushall();
    getchar();
    
    return 0;
}