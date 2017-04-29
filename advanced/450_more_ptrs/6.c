#include <memory.h>
#include <stdio.h>

void print_something ()
{
	printf ("we are in %s()\n", __FUNCTION__);
};

int main()
{
	print_something();
	printf ("first 3 bytes: %x %x %x...\n",
			*(unsigned char*)print_something,
			*((unsigned char*)print_something+1),
			*((unsigned char*)print_something+2));

	*(unsigned char*)print_something=0xC3; // opecode of RET
	printf ("going to call patched print_something():\n");
	print_something();
	printf ("it must exit at this point\n");

};

