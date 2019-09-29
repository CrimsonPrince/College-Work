/* Arthur Coll Labwork week 9
15/11/16 
C16406984 */
#include <stdio.h>

#define ROW 3
#define COL 4


int main()

{ 
    int i, j;
    int data[ROW][COL];
    int data2[ROW][COL];
    int data3[ROW][COL];
    
    for(i = 0; i < ROW ; i++ )
    {
        for(j = 0; j < COL ; j++ )
        {  
            printf("%d %d contains", i,j); 
            data[i][j] = j ;
            printf("%d \n", data[i][j]);
        }
    }
    
       for(i = 0; i < ROW ; i++ )
    {
        for(j = 0; j < COL ; j++ )
        {  
            printf("%d %d contains", i,j); 
            data2[i][j] = j ;
            printf("%d \n", data2[i][j]);
        }
    }
    
        for(i = 0; i < ROW ; i++ )
    {
        for(j = 0; j < COL ; j++ )
        {
            data3[i][j] = ( data2[i][j] * data[i][j] );
            printf(" \n Values are %d %d contains %d", i,j,data3[i][j]);
        }
    }

   

    
    flushall();
    getchar();
  
    return(0);
}