#include <stdio.h>
#define ROW 3
#define COL 2

int main()
{
    int data[ROW][COL];
    int largest = 0;
    int i, j;
    int sum = 0;
    int sum2=0;
    int sum3=0;
    int sum4=0 ;
    int sum5=0;
    

    
    printf("Enter Values sucessively \n");
    
    for( i =0 ;i < ROW; i++)
    {
        for(j =0; j < COL; j++)
        {
            printf("Enter Value (%d , %d) \n ", i ,j );
            scanf("%d", &data[i][j]);
        }
    }
    
 

        for(j =0; j < COL; j++)
        {
           sum = data[0][j] + sum; 
           sum2 = data[1][j] + sum2;
            sum3 = data[2][j] + sum3;
        }
    
    printf("Row 1 sum is %d \n", sum);
    printf("Row 2 sum is %d \n", sum2);
    printf("Row 3 sum is %d \n", sum3);
        
        
    
        

        for(i =0; i < COL; i++)
        {
            sum4 = sum4 + data[i][0];
            sum5 = sum5 + data[i][1];
        }

      printf("Column1 sum is %d \n", sum4);
    printf("Column 2 sum is %d \n", sum5);
        
        
          
    for( i =0 ;i < ROW; i++)
    {
        for(j =0; j < COL; j++)
        {
            if(data[i][j] > largest)
            {
                largest = data[i][j];
            }
        }
    }  
    
 printf("Largest is %d", largest);
    
flushall();
getchar();

return(0);
}