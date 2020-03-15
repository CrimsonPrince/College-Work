#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <mqueue.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "config.h"

void changePermission(char* directory, char* mode) {
    mqd_t mq;
    char buffer[MAX_BUFFER_LENGTH];
    char command[MAX_COMMAND_LENGTH];

    FILE *fp;
    int status;

    sprintf(command, "chmod -R %s %s", mode, directory);

    // Run command and get status
    fp = popen(command, "r");
    status = pclose(fp);
    

    // Send status to message queue
    mq = mq_open(QUEUE_NAME, O_WRONLY);

    if (status == 0) sprintf(buffer, "Success: Changed mode of directory %s to %s", directory, mode);
    else sprintf(buffer, "Error: Cannot change mode of directory %s to %s. Returned value %d", directory, mode, status);

    mq_send(mq, buffer, strlen(buffer), 0);
    mq_close(mq);

    if (status == 0) exit(EXIT_SUCCESS);
    else exit(EXIT_FAILURE);
}
