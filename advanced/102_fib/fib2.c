#include <stdio.h>

void fib (int a, int b, int limit)
{
	int next=a+b;
	printf ("%d\n", next);
	if (next > limit)
		return;
	fib (b, next, limit);
};

int main()
{
	printf ("0\n1\n1\n");
	fib (1, 1, 20);
};
