#include <stdio.h>

void printing_function(int i)
{
	printf ("f(%d)\n", i);
};

int main()
{
	int i;

	for (i=2; i<10; i++)
		printing_function(i);

	return 0;
};
