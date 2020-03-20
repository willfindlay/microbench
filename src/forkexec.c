#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <sys/wait.h>

#define ITERATIONS 11
#define SEC_USEC 1000000

extern char **environ;
char *lsargs[] = {"/bin/ls"};

void work(int count)
{
    int pid;
    for (int i = 0; i < count; i++)
    {
        switch(pid = fork())
        {
            case -1:
                fprintf(stderr, "Unable to fork\n");
                exit(1);
            case 0:
                execve(lsargs[0], lsargs, environ);
            default:
                waitpid(pid, NULL, 0);
        }
    }
}

int main(int argc, char **argv)
{
    int count = ITERATIONS;
    struct timeval t[2];

    gettimeofday(&t[0], NULL);
    work(count);
    gettimeofday(&t[1], NULL);

    unsigned long long diff = (t[1].tv_sec * SEC_USEC + t[1].tv_usec) -
        (t[0].tv_sec * SEC_USEC + t[0].tv_usec);
    fprintf(stderr, "forkexec %0.3f\n", ((double)diff / count));

    return 0;
}
