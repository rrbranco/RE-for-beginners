#include <stdio.h>

double d_max (double a, double b)
{
	if (a>b)
		return a;

	return b;
};

int main()
{
	printf ("%f\n", d_max (1.2, 3.4));
	printf ("%f\n", d_max (5.6, -4));
};
