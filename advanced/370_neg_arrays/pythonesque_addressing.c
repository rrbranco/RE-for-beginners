#include <string.h>
#include <stdio.h>

int main()
{
	char *s="Hello, world!";
	char *s_end=s+strlen(s);

	printf ("last character: %c\n", s_end[-1]);
	printf ("penultimate character: %c\n", s_end[-2]);
};

