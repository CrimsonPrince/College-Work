/* Programming Lab week 8 Q2
Arthur Coll */

#include <stdio.h>
#define ROW 3
#define COL 2

int main()
{
    int data[ROW][COL];
    int i, j, largest, smallest, average, counter;
    largest = 0;
    smallest = 0;
    average = 0;
    counter = 0 ;
    
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
            printf("%d \n", data[i][j]);
        }
    }
        

    
    
    for(i = 0; i < ROW; i++)
    {
        for(j = 0; j < COL; j++)
        {
             if( data[i][j] > largest)
                {
                    largest = data[i][j];
                }
                
            if( data[i][j] < smallest)
                {
                    smallest = data[i][j];
                }
        }
    }

    
    for(i = 0; i < ROW; i++)
    {
        for(j = 0; j < COL; j++)
        {
        average = average + data[i][j];
        counter++;
        }
    }

    average = average / counter;
    
    
 

    printf("%d is the largest \n", largest);
    printf("%d is the smallest \n", smallest);
    printf("%d is the average \n", average);

    flushall();
    getchar();
    
    return(0);     
}
