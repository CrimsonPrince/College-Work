CC = gcc
objects = main.o backup.o transfer.o permission.o
headers = config.h backup.h transfer.h permission.h

daemon: $(objects)
		$(CC) -o daemon $(objects) -Wall -lrt

main.o: main.c $(headers)
		$(CC) -c main.c -Wall

backup.o: backup.c config.h
		$(CC) -c backup.c -Wall

transfer.o: transfer.c config.h
		$(CC) -c transfer.c -Wall

permission.o: permission.c config.h
		$(CC) -c permission.c -Wall

client: client.c config.h
		$(CC) client.c -o client -Wall -lrt

clean:
		rm daemon $(objects)

cleancli:
		rm client
