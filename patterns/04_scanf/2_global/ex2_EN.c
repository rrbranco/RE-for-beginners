#include <stdio.h>

// now x is global variable
int x;

int main() 
{
	printf ("Enter X:\n");

	scanf ("%d", &x);

	printf ("You entered %d...\n", x);

	return 0;
};
