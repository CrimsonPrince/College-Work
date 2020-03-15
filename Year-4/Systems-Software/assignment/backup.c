#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <mqueue.h>

#include "config.h"

void backup(char* targetPath, char* backupPath) {
    mqd_t mq;
    char buffer[MAX_BUFFER_LENGTH];
    char command[MAX_COMMAND_LENGTH];

    FILE * fp;
    int status;

    sprintf(command, "rsync -avP %s %s", targetPath, backupPath);

    // Run command and get status
    fp = popen(command, "r");
    status = pclose(fp);

    // Send status to message queue
    mq = mq_open(QUEUE_NAME, O_WRONLY);

    if (status == 0) sprintf(buffer, "Success: Target: %s Backed Up To %s", targetPath, backupPath); 
    else sprintf(buffer, "Error: Failed to Backup Website. Returned value %d", status);

    mq_send(mq, buffer, strlen(buffer), 0);
    mq_close(mq);

    if (status == 0) {
        exit(EXIT_SUCCESS);
    }
    else {
        exit(EXIT_FAILURE);
    }
}