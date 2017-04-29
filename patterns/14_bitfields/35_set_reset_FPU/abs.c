#include <stdio.h>

float my_abs (float i)
{
	unsigned int tmp=(*(unsigned int*)&i) & 0x7FFFFFFF;
	return *(float*)&tmp;
};

float set_sign (float i)
{
	unsigned int tmp=(*(unsigned int*)&i) | 0x80000000;
	return *(float*)&tmp;
};

float negate (float i)
{
	unsigned int tmp=(*(unsigned int*)&i) ^ 0x80000000;
	return *(float*)&tmp;
};

int main()
{
	printf ("my_abs():\n");
	printf ("%f\n", my_abs (123.456));
	printf ("%f\n", my_abs (-456.123));
	printf ("set_sign():\n");
	printf ("%f\n", set_sign (123.456));
	printf ("%f\n", set_sign (-456.123));
	printf ("negate():\n");
	printf ("%f\n", negate (123.456));
	printf ("%f\n", negate (-456.123));
};
