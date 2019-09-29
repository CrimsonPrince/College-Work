/* Programming Lab week 8 Q5
Arthur Coll */

#include <stdio.h>
#define ROW 5
#define COL 4

int main()
{
    int data[ROW][COL];
    int i, j;
    
    
    for(i = 0; i < ROW; i++)
    {
        for(j = 0; j < COL; j++)
        {
            printf("Enter value \n", i, j);
            scanf("%d", &data[i][j]);
        }
    }
    
    for(i = 0; i < ROW; i++)
    {
        for(j = 0; j < COL; j++)
        {
            if( data[i][j] == 0)
            {
                printf("%d is the value at (%d,%d)", data[i][j],i,j);
            }
        }
    }
        

    
    
    flushall();
    getchar();
    
    return(0);     
}

