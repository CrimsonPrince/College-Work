#include <stdio.h>

int main()
{
    int num1 = 22;
    char char1 = 'f';
    char *ptr1 = &char1;
    int *ptr2= &num1;
    char *ptr3 = &char1;
    
    printf(" %p is address \n ", ptr1 );
    printf(" %d is content \n", num1 );
    printf(" %p is content confirmed \n", &num1);
    
    printf(" %p is char address \n", ptr2 );
    printf(" %c is char content \n", char1);
    printf(" %p is content confirmed \n", &char1);
    
    printf("%p is confirmed ptr3 \n", ptr3);
        printf("%c is confirmed Cptr3 \n", &ptr3);
        printf("%d is confirmed Dptr3 \n", &ptr3);
    
    flushall();
    getchar();
    
    return(0);
}