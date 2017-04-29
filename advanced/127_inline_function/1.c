#include <stdio.h>

int celsius_to_fahrenheit (int celsius)
{
	return celsius * 9 / 5 + 32;
};

int main(int argc, char *argv[])
{
	int celsius=atol(argv[1]);
	printf ("%d\n", celsius_to_fahrenheit (celsius));
};

