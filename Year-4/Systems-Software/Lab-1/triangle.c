#include <stdio.h>

int main() {
    float base;
    float height;
    float area;

    printf("Enter Height \n");
    scanf("%f", &height);
    printf("Enter Width \n");
    scanf("%f", &base);

    area = base * height / 2;
    
    printf("The Area of the Circle is %f", area);

}