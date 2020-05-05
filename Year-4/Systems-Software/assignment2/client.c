#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <signal.h>
#include <unistd.h>
#include <pthread.h>

#include "config.h"

int main (int argc, char **argv) {

    int SID;
    struct sockaddr_in server;
    char serverMessage[MAX_BUFFER + 1];
    char file_path[MAX_FILEPATH_LENGTH];

    if(argc != 3) {
        printf("Invalid Argument, Filename & File Path Required \n");
        return 1;
    }

    strcpy(file_path, argv[1]);

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

    if ((fp = fopen(file_path, "r")) == NULL) {
        printf("Failed to Open File, Is Filename correct? \n");
        return 1;
    }

    printf("Successfully connected to the server \n");     
    if(send(SID, file_path, strlen(file_path), 0) < 0) {
        printf("Send Failed");
        return 1;
    }
    if(recv(SID, serverMessage, 500, 0) < 0) {
        printf("IO ERROR");
        return 0;
    }
    printf("Message Sent");

    close(SID);
    printf(file_path);

    return 0;
}