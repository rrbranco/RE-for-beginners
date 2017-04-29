#include <stdint.h>

int64_t my_max(int64_t a, int64_t b)
{
	if (a>b)
		return a;
	else
		return b;
};

int64_t my_min(int64_t a, int64_t b)
{
	if (a<b)
		return a;
	else
		return b;
};
