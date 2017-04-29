#include <stdio.h>
#include <stdint.h>

union uint_float
{
	uint32_t i;
	float f;
};

float calculate_machine_epsilon(float start)
{
	union uint_float v;
	v.f=start;
	v.i++;
	return v.f-start;
}

void main()
{
	printf ("%g\n", calculate_machine_epsilon(1.0));
};
