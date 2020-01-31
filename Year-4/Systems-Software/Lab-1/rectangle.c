#include <stdio.h>

int main() {
    float width;
    float height;
    float area;

    printf("Enter Width \n");
    scanf("%f", &width);
    printf("Enter Height \n");
    scanf("%f", &height);

    area = width * height;

    printf("The Area of the Rectange is %f", area);

}