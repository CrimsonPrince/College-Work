#include	"unp.h"
#define MAXATTEMPTS 3

int main(int argc, char **argv) {
	// just some variables needed
	int				listenfd, connfd;
	struct sockaddr_in	servaddr;
	char				sendbuff[MAXLINE], rcvbuff[MAXLINE], user[20], pw[20];
	int				attempts;

	// argument count check
	if (argc != 2)
		err_quit("usage: ./authserver <Port>");

	// socket primitive
	listenfd = Socket(AF_INET, SOCK_STREAM, 0);

	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family      = AF_INET;
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servaddr.sin_port        = htons(atoi(argv[1]));  // set the port

	// bind primitive
	Bind(listenfd, (SA *) &servaddr, sizeof(servaddr));

	// Listen primitive
	Listen(listenfd, LISTENQ);

	for (;;) {
		// wait for a connection from a client

		connfd = Accept(listenfd, (SA *) NULL, NULL);

		attempts = 0; // reset attempts for this (new) client

		// this loop will run until the user is out of attempts
		do {

			// read loop
			while (read(connfd, rcvbuff, MAXLINE)) {
				printf("rcvbuff: '%s'\n", rcvbuff);
				if (strstr(rcvbuff, "\r\n\r\n") > 0)
				{
					break;
				}
			}
			sscanf(rcvbuff, "%s %s", user, pw); // parse input

			// check if username and password are correct
			if (strcmp(user, "admin") == 0 && strcmp(pw, "pass") == 0)
			{
				// if so, write PROCEED

				snprintf(sendbuff, sizeof(sendbuff), "PROCEED\r\n");
				attempts = -1; // and remember to close socket

			} else
			{
				attempts++; // else: increment attempts
			}

			// if no attempts left
			if (attempts == MAXATTEMPTS)
			{
				snprintf(sendbuff, sizeof(sendbuff), "DENIED\r\n"); // print denied

			} else if (attempts >= 0)
			{
				// else: print how many are left
				snprintf(sendbuff, sizeof(sendbuff), "You have %d attempt(s) left.\r\n", (MAXATTEMPTS-attempts));
			}
			// write primitive: write sendbuff to socket
			Write(connfd, sendbuff, strlen(sendbuff));
			printf("written: '%s'\n", sendbuff);fflush(stdout);

		// if DENIED or PROCEED, leave loop
		} while (attempts != MAXATTEMPTS && attempts != -1);

		// and close socket ... continue infinite loop and wait for the next client
		Close(connfd);
	}
}
