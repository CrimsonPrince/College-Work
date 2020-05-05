CC = gcc

server: server.c config.h
		$(CC) server.c -o server -Wall -lrt -pthread

client: client.c config.h
		$(CC) client.c -o client -Wall -lrt

clean:
		rm server

cleancli:
		rm client
