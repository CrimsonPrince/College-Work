#include <stdio.h>

int main()
{   
    int num1, num2, sum =0;
    int *ptr1 = &num1;
    int *ptr2 = &num2;
    int *ptr3 = &sum;
    
    
    printf("Enter 2 values please \n");
    scanf("%d", &num1);
    scanf("%d", &num2);
    
    printf("Entered %d \n", *ptr1);
    printf("Entered %d \n", *ptr2);
    
    *ptr3 = *ptr1 + *ptr2 ;
    
    printf("%d is the sum", *ptr3);
    
    

    flushall();
    getchar();
    
    return(0);
    
}