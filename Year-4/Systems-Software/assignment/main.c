#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <string.h>
#include <mqueue.h>
#include <syslog.h>

#include "config.h"
#include "backup.h"
#include "transfer.h"
#include "permission.h"

int main (int argc, char **argv) {

    int pid = fork();

    if (pid > 0) {
        // Parent process
        sleep(5);
        exit(EXIT_SUCCESS);
    }

    if (pid == -1) {
        exit(EXIT_FAILURE);
    }
    
    // Elevate to Session Leader
    if (setsid() < 0) {
        exit(EXIT_FAILURE);
    }

    // Remove Open File Descriptors
    umask(0);

    // Set Working Directory to ROOT
    if (chdir("/") < 0) {
        exit(EXIT_FAILURE);
    }

    // Close all the file descriptors
    for (int x = sysconf(_SC_OPEN_MAX); x >= 0; x--) {
        close(x);
    }

    // Daemon
    mqd_t mq;

    struct mq_attr queue_attributes;
    char buffer[MAX_BUFFER_LENGTH + 1];

    int terminate = 0;
    int directoryLocked = 0;

    // Create log
    openlog(NULL, LOG_PID | LOG_CONS, LOG_DAEMON);

    // Message Queue Attributes
    queue_attributes.mq_flags = 0;
    queue_attributes.mq_maxmsg = 10;
    queue_attributes.mq_msgsize = MAX_BUFFER_LENGTH;
    queue_attributes.mq_curmsgs = 0;

    mq = mq_open(QUEUE_NAME, O_CREAT | O_RDONLY, 0644, &queue_attributes);

    if (mq == -1) {
        syslog(LOG_ERR, "Cannot create queue, Daemon Exiting");
        exit(EXIT_FAILURE);
    }
    
    syslog(LOG_INFO, "Created Message Queue %s", QUEUE_NAME);
    

    do {
        // Read message
        ssize_t bytes_read;
        memset(buffer, 0, MAX_BUFFER_LENGTH);
        bytes_read = mq_receive(mq, buffer, MAX_BUFFER_LENGTH, NULL);
        buffer[bytes_read] = '\0';

        if (strstr(buffer, "Error:") || strstr(buffer, "Success:")) {
            directoryLocked = 0;
            syslog(LOG_INFO, "Directory Unblocked");
        }

        if (!directoryLocked && !strncmp(buffer, "backup", strlen("backup"))) {
            switch (fork()) {
                case 0:
                    syslog(LOG_INFO, "Initiating Backup from Target: %s to %s", LIVE_PATH, BACKUP_PATH);
                    directoryLocked = 1;
                    backup(LIVE_BACKUP_PATH, BACKUP_PATH);
                    break;
                case -1:
                    syslog(LOG_ERR,"Cannot Fork, Backup Failed");
                    break;
            }
        }

        if (!directoryLocked && !strncmp(buffer, "transfer", strlen("transfer"))) {
            switch (fork()) {
                case 0:
                    syslog(LOG_INFO, "Initiating Transfer from Target: %s to %s", INTRANET_PATH, LIVE_PATH);
                    directoryLocked = 1;
                    transfer(INTRANET_PATH, LIVE_PATH);
                    break;
                case -1:
                    syslog(LOG_ERR,"Cannot Fork, Transfer Failed");
                    break;
            }
        }

        // Exit Daemon
        if (!strncmp(buffer, "exit", strlen("exit"))) {
            terminate = 1;
        }

    } while (!terminate);

    syslog(LOG_INFO, "Exited Daemon");
    mq_close(mq);
    mq_unlink(QUEUE_NAME);
    closelog();

    return 0;
}