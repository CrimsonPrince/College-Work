/*  Lab test 2

Short program to initialize multi dimensional arrays with various patterns of numbers

Name: Arthur Coll
No: C16406984
Date: 06/12/2016 
Time: 9.30
*/

#include <stdio.h>
#define ROW 5
#define COL 5
#define CUBE 2

int main()
{
    int array[ROW][COL];
    int i, j =0; //declaring arrays and variables for use
    int counter0 =0;
    int counter1 =0; 
    int counter2 =0; 
    int counter5 = 0;
    int counter;
    
    for( i=0; i<ROW; i++) //Loop used to initially populate array with 5's
        {
            for(j=0; j<COL; j++)
            {
                array[i][j] = 5;
            }
        }
    
    
       
    for( i=0; i<ROW; i++)
    {
        for(j=0; j<COL; j++)
        {
            array[i][j] = 5;
    
        }
    }
        
    
    counter = 4;
    
    for( i=0; i<ROW; i++) //loop attempting to populate the array with 0's diagnoally
    {
            array[i][j] = 0;
            array[i][j + counter] = 0;
            counter--;
        
    }
    
    for( i=0; i <ROW; i++) //Loop to fill the array with 1's
    {
        for(i=0; i <COL; i++)
        {
            array[CUBE][j] = 1;
            array[i][CUBE] = 1;
        }
    }
    
 
    array [i][j] = 2;
    
    
    
    
    
    for( i=0; i<ROW; i++) //For Loop to count the number of each element in the array
    {
        for(j=0; j<COL; j++)
        {
            printf("%d", array[i][j]);
            
            if( array[i][j] == 0) // If statment used to determine number and increment appropriate counter
            {  
                counter0++;
            }
            
            if (array[i][j] == 2) // If statment used to determine number and increment appropriate counter
            {
                counter2++;
            }
            
            if (array[i][j] == 1) // If statment used to determine number and increment appropriate counter
            {
                counter1++;
            }
            
            if (array[i][j] == 5) // If statment used to determine number and increment appropriate counter
            {
                counter5++;
            }
            
        }
    }
    
    //printf's used here to print counter of specific element numbers
    
    printf("There is %d 5's in the array \n", counter5); 
    printf("There is %d 2's in the array \n", counter2);
    printf("There is %d 1's in the array \n", counter1);
    printf("There is %d 0's in the array \n", counter0);
    
    
    
    flushall();
    getchar();
    
    return(0);
}