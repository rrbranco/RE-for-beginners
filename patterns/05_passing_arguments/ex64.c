#include <stdio.h>
#include <stdint.h>

uint64_t f (uint64_t a, uint64_t b, uint64_t c)
{
	return a*b+c;
};

int main() 
{
	printf ("%lld\n", f(0x1122334455667788, 
				0x1111111122222222, 
				0x3333333344444444));
	return 0;
};
