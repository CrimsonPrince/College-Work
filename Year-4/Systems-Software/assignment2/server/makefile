CC = gcc

server: server.c config.h
		$(CC) server.c -o server -g -Wall -lrt -pthread

clean:
		rm server client

