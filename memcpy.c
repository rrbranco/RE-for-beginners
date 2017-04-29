#include <stdio.h>

void my_memcpy (unsigned char* dst, unsigned char* src, size_t cnt)
{
	size_t i;
	for (i=0; i<cnt; i++)
		dst[i]=src[i];
};
