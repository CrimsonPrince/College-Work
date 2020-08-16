#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <arpa/inet.h>
#include <fcntl.h> // for open
#include <unistd.h> // for close
#include <pthread.h>

pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

void * socketThread(void *arg) {

  FILE *fp;
  char command[2000];
  char filePath[2000];
  char fileBuffer[2000];
  char fileName[2000];
  char tempPath[2000] = "/tmp/";
  char permissions[2000];
  char response[2000];
  char buffer[4096];
  int groupid;
  int userid;

  int threadSocket = *((int *)arg);
  recv(threadSocket , fileBuffer , 2000 , 0);
  strcpy(response, "Success: File Received"); 
  send(threadSocket, response, strlen(response), 0);
  recv(threadSocket , fileName , 2000 , 0);
  strcat(tempPath, fileName);

  pthread_mutex_lock(&lock);
  fp = fopen(tempPath, "w");
  if (fp == NULL) {
      perror("Failed: ");
      return 1;
  }
  fprintf(fp, "%s", fileBuffer);
  fclose(fp);  
  printf("File Name %s Wrote to %s \n", fileName, tempPath);
  fflush(stdout);
  

  bzero(response, 2000);
  strcpy(response, "Success: File Saved"); 

  send(threadSocket, response, strlen(response), 0);
  recv(threadSocket, permissions, 2000, 0);

  strcpy(response, "Success: Permission Received");
  send(threadSocket, response, strlen(response), 0);
  recv(threadSocket, filePath, 2000, 0);

  printf("Permission %s Received \n", permissions);
  fflush(stdout);
  userid = atoi(strtok(permissions, ":"));
  groupid = atoi(permissions);
  setegid(groupid);
  seteuid(userid);
  printf("File Path %s \n", filePath);
  fflush(stdout);

  sprintf(command, "cp %s %s", tempPath, filePath);
  printf("Running Command %s with permissions %d : %d \n", command, geteuid(), getegid());
  fflush(stdout);
  bzero(response, 2000);
  if(system(command) != 0) {
    strcpy(response, "Failed: Permission Denied \n"); 
  } else {
    strcpy(response, "Success: File Moved \n");
  }
  send(threadSocket, response, strlen(response), 0);

  pthread_mutex_unlock(&lock);
  
  close(threadSocket);
  pthread_exit(NULL);
}

int main(){

  int serverSocket, threadSocket;
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
  fflush(stdout);

  pthread_t tid[60];
  int i = 0;

    while(1) {

        addr_size = sizeof serverStorage;
        threadSocket = accept(serverSocket, (struct sockaddr *) &serverStorage, &addr_size);

        if( pthread_create(&tid[i], NULL, socketThread, &threadSocket) != 0 )

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