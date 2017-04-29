#include <stdio.h>

// maintenant x est une variable globale
int x;

int main()
{
	printf ("Enter X:\n");

	scanf ("%d", &x);

	printf ("You entered %d...\n", x);

	return 0;
};
