/*
Cool Comments
*/

#include <stdio.h>

int main()

{
    int first, second, third, fourth;
    first = 0 ;
    second = 0 ;
    third = 0 ;
    fourth = 0 ;
    
    printf ("Enter 4 Numbers");
    
    
    scanf ("%d", &fourth );
    scanf ("%d", &third );
    scanf ("%d", &second );
    scanf ("%d", &first );
    
    
    printf ("%d", &fourth);
    printf ("%d", &third);
    printf ("%d", &second);
    printf ("%d", &first);
    
    flushall();
    getchar();
    
    return 0;
}