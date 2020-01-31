#include <stdio.h>
#include <string.h>
#include <stdlib.h> 

int main(int argc, char *argv[]) {

    if (argc < 2) { // Test for correct number of arguments
        printf("Parameter Roman Numeral");
        return 1; 
    }

    FILE * fp;
    fp = fopen ("numeral.txt","w");
    int decimal = atoi(argv[1]);
    char roman[100];
    strcpy(roman, "Roman Numeral is ");

    while(decimal > 0)
    {
        if (decimal >= 1000) { decimal -= 1000; strcat(roman, "M"); }
        else if (decimal >= 900) { decimal -= 900; strcat(roman, "CM"); }
        else if (decimal >= 500) { decimal -= 500; strcat(roman, "D"); }
        else if (decimal >= 400)  { decimal -= 400; strcat(roman, "CD"); }
        else if (decimal >= 100) { decimal -= 100; strcat(roman, "C"); }
        else if (decimal >= 90)  { decimal -= 90; strcat(roman, "XC"); }
        else if (decimal >= 50)   { decimal -= 50; strcat(roman, "L"); }
        else if (decimal >= 40)   { decimal -= 40; strcat(roman, "XL"); }
        else if (decimal >= 10)  { decimal -= 10; strcat(roman, "X"); }
        else if (decimal >= 9)  { decimal -= 9; strcat(roman, "IX"); }
        else if (decimal >= 5)    { decimal -= 5; strcat(roman, "V"); }
        else if (decimal >= 4)    { decimal -= 4; strcat(roman, "IV"); }
        else if (decimal >= 1)  { decimal -= 1; strcat(roman, "I"); }
    }

    printf("%s", roman);
    fprintf(fp, "%s", roman);

    fclose(fp);
    return 0;
}