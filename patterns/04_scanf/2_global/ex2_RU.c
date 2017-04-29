#include <stdio.h>

// теперь x это глобальная переменная
int x;

int main() 
{
	printf ("Enter X:\n");

	scanf ("%d", &x);

	printf ("You entered %d...\n", x);

	return 0;
};
