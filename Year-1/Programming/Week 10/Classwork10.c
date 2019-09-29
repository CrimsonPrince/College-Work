/* Program that uses DMA and malloc() */

#include  <stdio.h>
#include <stdlib.h>
#define size 5

int main() 
	{
		int *ptr;
		int noofnums;
		int nobytes, i ;
		
		noofnums = nobytes = i = 0;
		
		printf("How many numbers do you enter? \n");
		scanf("%d", &noofnums);
		
		//calculate how many blank size required
		nobytes = noofnums * sizeof(int);
		
		//allocate memory
		ptr = (int*) malloc(nobytes);
        //error becuase no casting
		
		// check if memory allocated correctly 
		
		if( ptr == NULL)
		{ printf("failed to allocate memory");
		}

		else
		{
		//sucessfully allocated memory 
		//enter data into the memory block, finished with memory release it back to OS
		 for(i=0; i < noofnums ; i++)
            {
                scanf("%d",&*(ptr+i));
            }
            
        //display data entered
            for(i=0; i < noofnums ; i++)
            {
                printf("%d", *(ptr +i));
            }
		free(ptr);
		//end else
        }
		
		return(0);
		
}//end main