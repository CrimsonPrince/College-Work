#include <stdio.h>

#define ROW 5
#define COL 5

int main()
{
    int matrix[ROW][COL];
    int i, j;
    
    //filling array with 5's
    
    for(i=0; i < ROW; i++)
    {
        for(j=0; j <COL; j++)
        {
            matrix[i][j]=5;
        }
    }
    
    
    for(i=0; i <ROW;i++)
    {
        for( j=0; j <COL; j++)
        {
            if (i==j)
            {
                matrix[i][j]=0;
            }
        }
    }
    
    
    for( i=0; i <ROW; i++)
    {
        for(j=0;j<COL;j++)
        {
            if(i==2 || j==2)
            {
                matrix[i][j] = 1;
            }
        }
    }
    
    for(i=0; i <ROW;i++)
    {
        for(j=0;j<COL;j++)
        {
            if((i==0 || i==4) && (j==0|| j==4))
            {
                matrix[i][j]=2;
            }
        }
    }
    
    return(0);
}
    