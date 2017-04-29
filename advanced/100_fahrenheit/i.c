#include <stdio.h>
#include <stdlib.h>

int main()
{
	int celsius, fahr;
	printf ("Enter temperature in Fahrenheit:\n");
	if (scanf ("%d", &fahr)!=1)
	{
		printf ("Error while parsing your input\n");
		exit(0);
	};

	celsius = 5 * (fahr-32) / 9;

	if (celsius<-273)
	{
		printf ("Error: incorrect temperature!\n");
		exit(0);
	};
	printf ("Celsius: %d\n", celsius);
};
