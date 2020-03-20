#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <sys/wait.h>

#define ITERATIONS 11
#define SEC_USEC 1000000

char *ls = "/bin/ls";

void work(int count)
{
    for (int i = 0; i < count; i++)
    {
        system(ls);
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
    fprintf(stderr, "system %0.3f\n", ((double)diff / count));

    return 0;
}
