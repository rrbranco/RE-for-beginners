#include <stdio.h>

int f (int a, int b, int c)
{
	return a*b+c;
};

int main() 
{
	printf ("%d\n", f(1, 2, 3));
	return 0;
};
