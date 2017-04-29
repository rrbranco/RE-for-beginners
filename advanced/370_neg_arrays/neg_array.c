#include <stdio.h>

int main()
{
	int random_value=0x11223344;
	unsigned char array[10];
	int i;
	unsigned char *fakearray=&array[-1];
	
	for (i=0; i<10; i++)
		array[i]=i;

	printf ("first element %d\n", fakearray[1]);
	printf ("second element %d\n", fakearray[2]);
	printf ("last element %d\n", fakearray[10]);

	printf ("array[-1]=%02X, array[-2]=%02X, array[-3]=%02X, array[-4]=%02X\n", 
		array[-1],
		array[-2],
		array[-3],
		array[-4]);
};
