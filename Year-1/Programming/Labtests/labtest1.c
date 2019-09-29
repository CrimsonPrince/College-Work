/* Programming Lab Test 1
Arthur Coll */


#include <stdio.h>

int main()
    {  
    


        int fnum, terms, i, fnum2;
        fnum = 0;
        fnum2 = 0;
        
        
        // Asking user for input number of terms
        printf("Enter the number of terms you wish to display \n");
        scanf("%d", &terms);
        
        // Loop to repeat function till all terms in sequences are printed
        for(i=1; i != terms ; i++)
        {

            printf("%d is number %d in the sequence \n", fnum, i);

            fnum = fnum + fnum2 - i;
            num2 = fnum;
            
            
               if( fnum == 0)
                { 
                    fnum ++;
            }
            
            
            
        }
        
        
        
flushall();
getchar();
    
return(0);  
        
}