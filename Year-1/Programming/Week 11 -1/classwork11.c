#include <stdio.h>
#include <stdlib.h>

int main()
{
    int *ptr;
    int nonum, i;
    char reply;
    
    printf("How many nnumbers to enter \n");
    scanf("%d", &nonum);
    
    ptr = (int*)calloc(nonum, sizeof(int));
    
    if( ptr == NULL)
    {
        printf("Failed to allocate memory");
    }
    else
    {
        for(i=0; i<nonum;i++)
        { 
            scanf("%d", &*(ptr+i));
        }
        
        //ask if they want extra numbers
        
        printf("Extra numbers \n");
        reply = getchar();
        
     if(reply == 'y' || reply == 'if( ptr == NULL))
    {
        printf("Failed to allocate memory");
    }
     else {
         
         printf("How many numbers to be entered \n");
         scanf("%d", &nonum);
         
         ptr = realloc(ptr, nonum * sizeof(int));
         
        if( ptr == NULL)
        {
            printf("Failed to allocate memory");
        }
        
        else 
        {
            //enter data 
            for(i=0;i<nonums;i++)
            { 
                scanf("%d", &*(ptr+i));
            }//end for
        }
    }
    
    free(ptr);
    
    reutrn(0);
}