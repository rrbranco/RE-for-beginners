#include <memory.h>
#include <stdio.h>

void swap_bytes (unsigned char* first, unsigned char* second)
{
	unsigned char tmp1;
	unsigned char tmp2;

	tmp1=*first;
	tmp2=*second;

	*first=tmp2;
	*second=tmp1;
};

int main()
{
	// §copier la chaîne dans la heap, afin de pouvoir la modifier§
	char *s=strdup("string"); 

	// §échanger le 2ème et le 3ème caractères§
	swap_bytes (s+1, s+2);

	printf ("%s\n", s);
};

