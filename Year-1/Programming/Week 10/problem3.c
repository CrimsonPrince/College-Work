#include <stdio.h>

int main()
{
    float input1 = 12.4;
    float input2 = 20.3;
    float *ptr1 = &input1;
    float *ptr2 = &input2;
    
    printf("%p is address 1 of input1 using ptr1 \n", ptr1);
    printf("%p is address 2 of input2 using ptr2 \n", ptr2);
    
    printf("%p is address 3 of ptr1 \n", &ptr1);
    printf("%p is address 4 ptr2 \n", &ptr2);
    
    printf("%p is address 1 without pointer \n", &input1);
    printf("%p is address 2 without pointer \n", &input2);
    
       
    printf("%p is address 3 ptr content \n", ptr1);
    printf("%p is address 4  ptr content \n", ptr2);
    
    

    flushall();
    getchar();
    
    return(0);
    
}