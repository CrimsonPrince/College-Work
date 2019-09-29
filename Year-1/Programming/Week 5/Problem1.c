/* Problem 1 Programming 
Arthur Coll */
#include <stdio.h>
int main()

{ 
    char inputchar;
 
    
    printf( "Enter a characther\n");
    scanf("%c", &inputchar );
     
    if( inputchar == 'a' || inputchar == 'e' || inputchar == 'i' || inputchar == 'u' || inputchar == 'o' || inputchar == 'A' || inputchar == 'U' || inputchar == 'O' || inputchar =='I' || inputchar == 'E')
    {
        printf( "You entered a vowel\n");
                                            }
    
    else
    {
        printf(" You did not enter a vowel\n");
    }
    
    flushall();
    getchar();
    
    return(0);
    
}