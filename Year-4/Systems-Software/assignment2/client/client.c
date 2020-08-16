#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <signal.h>
#include <unistd.h>
#include <pthread.h>
#include <string.h>

#include "config.h"

int main (int argc, char **argv) {

    int SID;
    struct sockaddr_in server;
    char response[MAX_BUFFER + 1];
    char file_path[MAX_FILEPATH_LENGTH];
    char file_name[MAX_FILEPATH_LENGTH];
    char file[MAX_BUFFER + 1];
    char buffer[MAX_BUFFER + 1];

    if(argc != 3) {
        printf("Invalid Argument, Filename & File Path Required \n");
        return 1;
    }

    strcpy(file_name, argv[1]);
    strcpy(file_path, argv[2]);

    FILE *fp;

    // Create Socket
    SID = socket(AF_INET, SOCK_STREAM, 0);
    if (SID == -1) {
        printf("Error creating socket\n");
    }
    else {
        printf("Socket created\n");
    }

    // Init Socket
    server.sin_port = htons(PORT);
    server.sin_addr.s_addr = inet_addr(ADDRESS);
    server.sin_family = AF_INET;

    if (connect(SID, (struct sockaddr *) &server, sizeof(server)) < 0) {
        printf("Connection failed\n");
        return 1;
    }

    if ((fp = fopen(file_name, "r")) == NULL) {
        printf("Failed to Open File, Is Filename correct? \n");
        return 1;
    }
    printf("Successfully connected to the server \n"); 

    fscanf(fp,"%s",file);
    if(send(SID, file, strlen(file), 0) < 0) {
        printf("Send Failed");
        return 1;
    }

    if(recv(SID, response, 500, 0) < 0) {
        printf("IO ERROR");
        return 0;
    }


    printf("File %s Sent \n", file_name);
    if(strstr(response, "Success: File Received") != NULL) {
        if(send(SID, file_name, strlen(file_name), 0) < 0) {
            printf("Send Failed");
            return 1;
        }
    }

    if(recv(SID, response, 500, 0) < 0) {
        printf("IO ERROR");
        return 0;
    }



    sprintf(buffer, "%d:%d", getuid(), getgid());

    if(strstr(response, "Success: File Saved") != NULL) {
        if(send(SID, buffer, strlen(buffer), 0) < 0) {
            printf("Send Failed \n");
            return 1;
        }
        printf("Transmitted User Information: %s \n", buffer);
    }

    if(recv(SID, response, 500, 0) < 0) {
        printf("IO ERROR");
        return 0;
    }


    
    if(strstr(response, "Success: Permission Received") != NULL) {
        if(send(SID, file_path, strlen(file_path), 0) < 0) {
            printf("Send Failed \n");
            return 1;
        }
        printf("Transmitted File Path: %s \n", buffer);
    }
    printf("Sent FilePath %s \n", file_path);

    close(SID);

    return 0;
}