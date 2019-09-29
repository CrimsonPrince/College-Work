#include <stdio.h>
#define PI 3.14

int main()
{   
    float diameter;
    float *ptr3 = &diameter;
    float num1 = 0;
    float *ptr2;
    ptr2 = &num1;
    float area = 0;
    float *ptr1 = &area;
    
    
    printf("Enter a radius \n");
    scanf("%f", & *ptr2);
    
   
    printf("%.1f \n", *ptr2);
    
    *ptr3 = *ptr2 * 2;
    printf("%.1f \n", *ptr3);
    
    *ptr1 = (*ptr2) * (*ptr2) * PI;
    printf("%.f \n", *ptr1);
    
    
    
    
    
    flushall();
    getchar();
    
    return(0);
    
}
    