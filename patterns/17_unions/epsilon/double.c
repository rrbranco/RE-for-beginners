#include <stdio.h>
#include <stdint.h>

typedef union 
{
	uint64_t i;
	double d;
} uint_double;

double calculate_machine_epsilon(double start)
{
	uint_double v;
	v.d=start;
	v.i++;
	return v.d-start;
}

void main()
{
	printf ("%g\n", calculate_machine_epsilon(1.0));
};
