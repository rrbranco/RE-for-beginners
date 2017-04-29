#include <stdio.h>

int main() 
{
	int a[20];
	int i;

	for (i=0; i<20; i++)
		a[i]=i*2;

	printf ("a[20]=%d\n", a[20]);

	return 0;
};
