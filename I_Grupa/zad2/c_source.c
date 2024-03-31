#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    // Seed the random number generator using the current time
    srand(time(NULL));

    // Generate a random number
    int random_number = rand();

    // Print the random number to stdout
    printf("Random number: %d\n", random_number);

    return 0;
}

