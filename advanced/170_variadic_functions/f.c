#include <stdio.h>

int main()
{
	char *s1="hello";
	char *s2="world";
	char buf[128];

	// do something mundane here
	strcpy (buf, s1);
	strcpy (buf, " ");
	strcpy (buf, s2);

	printf ("%s");
};
