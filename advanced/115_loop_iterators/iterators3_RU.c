#include <stdio.h>

void f(int *a1, int *a2, size_t cnt)
{
	size_t i;
	size_t idx1=0; idx2=0;

	// копировать из одного массива в другой по §какой-то§ странной схеме
	for (i=0; i<cnt; i++)
	{
		a1[idx1]=a2[idx2];
		idx1+=3;
		idx2+=7;
	};
};
