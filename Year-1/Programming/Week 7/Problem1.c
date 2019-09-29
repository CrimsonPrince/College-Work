/* Programming Lab week 7 Q1
Arthur Coll */

#include <stdio.h>

int main()
{
    int ReadIn[5];
    int index;
    
    
    printf("Arthur's Printing Program \n");
    for( index=0; index < 5 ; index++)
    {        
        scanf("%d", &ReadIn[index]);
        printf("The Number printed is %d", ReadIn[index]);
    }
    
    printf("/n Limit of 5 reached, Program Ending, Press Any Key");
    flushall();
    getchar();
    
    return(0);
}