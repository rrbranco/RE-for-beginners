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
	// copy string into heap, so we will be able to modify it
	char *s=strdup("string"); 

	// swap 2nd and 3rd characters
	swap_bytes (s+1, s+2);

	printf ("%s\n", s);
};

