#include <stdio.h>

void f(int *a1, int *a2, size_t cnt)
{
	size_t i;

	// copy from one array to another in some weird scheme
	for (i=0; i<cnt; i++)
		a1[i*3]=a2[i*7];
};
