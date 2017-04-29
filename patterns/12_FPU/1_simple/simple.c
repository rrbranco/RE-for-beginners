#include <stdio.h>

double f (double a, double b)
{
	return a/3.14 + b*4.1;
};

int main()
{
	printf ("%f\n", f(1.2, 3.4));
};
