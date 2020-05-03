#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "config.h"

int main (int argc, char **argv) {

    char file_path[MAX_FILEPATH_LENGTH];

    if(argc != 2) {
        printf("Invalid Argument, File Path Required \n");
    }

    strcpy(file_path, argv[1]);

    printf(file_path);

    return 0;
}