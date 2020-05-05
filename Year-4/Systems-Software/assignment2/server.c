// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
// #include <sys/socket.h>
// #include <arpa/inet.h>
// #include <signal.h>
// #include <unistd.h>
// #include <pthread.h>
// #include <fcntl.h>
// #include <sys/types.h>
// #include <netinet/in.h>

// #include "config.h"

// pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

// void  socketThread(int  clientSocket) {

//    char client_message[2000];

//    char buffer[1024];

//   int newSocket = clientSocket;

//   recv(newSocket , client_message , 2000 , 0);

//   // Send message to the client socket 

//   char *message = malloc(sizeof(client_message)+20);

//   strcpy(message,"Hello Client : ");

//   strcat(message,client_message);

//   strcat(message,"\n");

//   strcpy(buffer,message);

//   free(message);

//   pthread_mutex_unlock(&lock);

//   sleep(1);

//   send(newSocket,buffer,13,0);

//   printf("Exit socketThread \n");

//   close(newSocket);

//   }

// int main (int argc, char **argv) {

//     int s;
//     int cs;
//     int connSize;
//     int READSIZE;

//     struct sockaddr_in server, client;
//     char message[MAX_BUFFER];

//     s = socket(AF_INET, SOCK_STREAM, 0);
//     if(s == -1) {
//         printf("Could not create Socket \n");
//     } else {
//         printf("Socket Successfully Created \n");
//     }

//     server.sin_port = htons(PORT);
//     server.sin_family = AF_INET;
//     server.sin_addr.s_addr = INADDR_ANY;
//     memset(server.sin_zero, '\0', sizeof server.sin_zero);

//     if(bind(s,(struct sockaddr *)&server , sizeof(server)) < 0)
//     {
//         perror("Binding to Port Failed \n");
//         return 1;
//     } else {
//         printf("Binding to Port Succeeded \n");
//     }

//   if(listen(s,50)==0) {
//     printf("Listening\n");
//   }
//   else {
//     printf("Error\n");
//     pthread_t tid[60];
//     int i = 0;
//   }

//   return EXIT_SUCCESS;
// }


#include<stdio.h>

#include<stdlib.h>

#include<sys/socket.h>

#include<netinet/in.h>

#include<string.h>

#include <arpa/inet.h>

#include <fcntl.h> // for open

#include <unistd.h> // for close

#include<pthread.h>

char client_message[2000];
char buffer[1024];
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

void * socketThread(void *arg) {

  FILE *fp;

  int newSocket = *((int *)arg);
  recv(newSocket , client_message , 2000 , 0);
  
  // fp = fopen("add1.txt","w+"); 

  pthread_mutex_lock(&lock);

  char *message = malloc(sizeof(client_message)+20);
  strcpy(message,"Hello Client : ");
  strcat(message, client_message);
  strcat(message,"\n");
  strcpy(buffer,message);
  free(message);
  pthread_mutex_unlock(&lock);
  sleep(1);
  send(newSocket,buffer,13,0);
  printf("Exit socketThread \n");
  printf(client_message);
  close(newSocket);
  pthread_exit(NULL);

}

int main(){

  int serverSocket, newSocket;

  struct sockaddr_in serverAddr;

  struct sockaddr_storage serverStorage;

  socklen_t addr_size;

  serverSocket = socket(PF_INET, SOCK_STREAM, 0);

  serverAddr.sin_family = AF_INET;
  serverAddr.sin_addr.s_addr = INADDR_ANY;
  serverAddr.sin_port = htons(8000);

  //Set all bits of the padding field to 0 

  memset(serverAddr.sin_zero, '\0', sizeof serverAddr.sin_zero);

  //Bind the address struct to the socket 

  bind(serverSocket, (struct sockaddr *) &serverAddr, sizeof(serverAddr));

  //Listen on the socket, with 40 max connection requests queued 

  if(listen(serverSocket,50)==0) {
    printf("Listening\n");
  } else {
    printf("Error\n");
  }

  pthread_t tid[60];
  int i = 0;

    while(1) {

        addr_size = sizeof serverStorage;
        newSocket = accept(serverSocket, (struct sockaddr *) &serverStorage, &addr_size);

        if( pthread_create(&tid[i], NULL, socketThread, &newSocket) != 0 )

           printf("Failed to create thread\n");

        if( i >= 50) {
          i = 0;
          while(i < 50) {
            pthread_join(tid[i++],NULL);
          }
          i = 0;
        }
    }

  return 0;

}