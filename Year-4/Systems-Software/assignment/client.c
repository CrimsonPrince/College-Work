#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mqueue.h>
#include <syslog.h>

#include "config.h"

int main (int argc, char **argv) {

    if(argc != 2) {
        printf("Invalid Arguments are exit, transfer, backup \n");
    }

    mqd_t mq;
    char buffer[MAX_BUFFER_LENGTH];
    mq = mq_open(QUEUE_NAME, O_WRONLY);

    if (mq == -1) {
        printf("Cannot Open Message Queue: %s \n", QUEUE_NAME);
        exit(EXIT_FAILURE);
    }

    strcpy(buffer, argv[1]);
    mq_send(mq, buffer, MAX_BUFFER_LENGTH, 0);
    printf("Successfully Sent %s to Daemon \n", buffer);
    mq_close(mq);

    return 0;
}