#include <stdio.h>
#include <string.h>
#include <stdlib.h> 
#define PI 3.14

float circle(float height, float width);
float triangle(float height, float width);
float rectangle(float height, float width);

int main(int argc, char *argv[]) {

    if (argc < 4) // Test for correct number of arguments
        printf("Parameter(s) circle/rectangle/triangle, Height, Width");
    
    float height = atoi(argv[2]);
    float width = atoi(argv[3]);
    char* types = argv[1];
    float area;

    if (strcmp(types, "circle") == 0) 
    {
        area = circle(height, width);
    } 
    else if (strcmp(types, "triangle") == 0)
    {
        area = triangle(height, width);
    }
    else if (strcmp(types, "rectangle") == 0)
    {
        area = rectangle(height, width);
    }
    else
    {
        printf("Invalid Argument, Submit either circle, triangle or rectangle");
        return 1;
    }

    printf("Area is %f", area);
    return 0;

}

float circle(float height, float width) {
    return PI * ((height/2) * (height/2));
}

float triangle(float height, float width) {
    return (height * width) / 2;
}

float rectangle(float height, float width) {
    return (height * width);
}