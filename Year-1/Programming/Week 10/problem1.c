#include <stdio.h>

int main()
{
    int num1 = 22;
    char char1 = 'f';
    char *ptr1 = &char1;
    int *ptr2= &num1;
    
    printf(" %p is address \n ", ptr1 );
    printf(" %d is content \n", num1 );
    printf(" %p is content confirmed \n", &num1);
    
    printf(" %p is char address \n", ptr2 );
    printf(" %c is char content \n", char1);
    printf(" %p is content confirmed \n", &char1);
   
    printf("Do %p", ptr1);
    printf("Do %p", ptr2);

    flushall();
    getchar();
    
    return(0);
    
}
    