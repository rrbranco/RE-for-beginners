#include <stdio.h>

int main() 
{
	int x;
	printf ("Enter X:\n");

	if (scanf ("%d", &x)==1)
		printf ("You entered %d...\n", x);
	else
		printf ("What you entered? Huh?\n");

	return 0;
};
