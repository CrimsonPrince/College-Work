#include <stdio.h>
#define PI 3.14

int main() {
    float radius;
    float area;

    printf("Enter Radius \n");
    scanf("%f", &radius);

    area = PI * (radius * radius);
    

    printf("The Area of the Circle is %f", area);

}