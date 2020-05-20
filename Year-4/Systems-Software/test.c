int main()
{
    int fd;
    char * tmpfifo = "/tmp/fifo";

    /* create the FIFO (named pipe) */
    mkfifo(tmpfifo, 0666);

    /* write "Hi" to the FIFO */
    fd = open(tmpfifo, O_WRONLY);
    write(fd, "Hi", sizeof("Hi"));
    close(fd);

    /* remove the FIFO */
    unlink(myfifo);

    return 0;
}

void transfer(char* targetPath, char* livePath) {
   char buffer[MAX_BUFFER_LENGTH];
   char command[MAX_COMMAND_LENGTH];
 
   FILE * fp;
   int status;
 
   sprintf(command, "rsync -avP %s %s", targetPath, livePath);
 
   // Run command in Child Process and Get Status Back
   fp = popen(command, "r");
   // Get Status Back
   status = pclose(fp);
}


void sendUserInfo() {

   int fd;
   char * tmpfifo = "/tmp/fifo";
   char buffer[MAX_BUFFER_LENGTH];

    // Get Real UserId and Real Group Id and insert into string
    sprintf(buffer, "%d:%d", getuid(), getgid());
    // Create Named Pipe 
    mkfifo(tmpfifo, 0666);

    // Write User Permission to Pipe
    fd = open(tmpfifo, O_WRONLY);
    write(fd, buffer, sizeof(buffer));
    close(fd);

    // Close Pipe
    unlink(tmpfifo);
}


int checkPermission()
{
    int fd;
    char * tmpfifo = "/tmp/myfifo";
    char permissions[MAX_BUFFER_LENGTH];
    char command = "cp /tmp/test.html /var/www/html"

    /* open, read, and display the message from the FIFO */
    fd = open(tmpfifo, O_RDONLY);
    read(fd, permissions, MAX_BUFFER_LENGTH);
    
    // Set Effective ID to UID Taken from Permissions String
    seteuid(atoi(strtok(permissions, ":")));
    // Set Effective GID to GID from Permission Strign
    setegid(atoi(permissions));
    if(system(command) != 0) {
        strcpy(response, "Failed: Permission Denied"); 
    } else {
        strcpy(response, "Success: File Moved");
    }

    close(fd);

    return 0;
}

int pid;
int pipeFd[2];

int pipeExample() {
    
    if(pipe(pipeFd) == -1) {
        perror("Error Cannot Init Pipe");
        exit(1);
    }

    if((pid = fork()) == -1) {
        perror("Cannot Init Fork");
        exit(1); 
    }
    elseif(pid == 0) {
        exec1()
    }

    if((pid = fork()) == -1)
    {
        perror("Cannot Init Fork");
        exit(1); 
    }
    elseif(pid == 0)
    {
        exec2()
    }

}

int exec1() {

    dup2(pipeFd[1], 1);
    close(pipeFd[1]);
    close(pipeFd[2]);

    execlp("/sbin/ausearch -f /var/www/html");

    perror("Error With Aussearch");
    exit(1);
}

int exec2() {

    dup2(pipeFd[0], 0);
    close(pipeFd[1]);
    close(pipeFd[2]);

    execlp("/sbin/aureport -f -i > auditlogs.txt");

    perror("Error With AuReport");
    exit(1);

}

int newfd = open("auditlogs.txt");

pid = fork();

if(pid == 0)
{

    exec("/sbins/ausearch", "-f", "/var/www/html"); 
}
else
{
    dup2(newfd, STDOUT_FILENO);
    exec("/sbin/aureport", "-f", "-i");
}

pthread_t thread;
int iret;

iret = pthread_create(&thread, NULL, print_message_function, (void*) message);
if(iret) {
    fprintf(stderr, "Error Pthread Create failed, Code: %d", iret2);
    exit(EXIT_FAILURE);
}
pthread_join(thred2, NULL);
exit(EXIT_SUCCESS);