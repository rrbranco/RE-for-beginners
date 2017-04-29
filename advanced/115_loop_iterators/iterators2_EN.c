#include <stdio.h>

void f(int *a1, int *a2, size_t cnt)
{
	size_t idx1=0; idx2=0;
	size_t last_idx2=cnt*7;

	// copy from one array to another in some weird scheme
	for (;;)
	{
		a1[idx1]=a2[idx2];
		idx1+=3;
		idx2+=7;
		if (idx2==last_idx2)
			break;
	};
};
