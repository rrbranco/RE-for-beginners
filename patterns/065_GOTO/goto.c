#include <stdio.h>

int main()
{
	printf ("begin\n");
	goto exit;
	printf ("skip me!\n");
exit:
	printf ("end\n");
};
