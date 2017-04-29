#include <stdint.h>

uint64_t f_add (uint64_t a, uint64_t b)
{
	return a+b;
};

void f_add_test ()
{
#ifdef __GNUC__
	printf ("%lld\n", f_add(12345678901234, 23456789012345));
#else
	printf ("%I64d\n", f_add(12345678901234, 23456789012345));
#endif
};

uint64_t f_sub (uint64_t a, uint64_t b)
{
	return a-b;
};
