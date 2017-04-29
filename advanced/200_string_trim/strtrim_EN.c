#include <stdio.h>
#include <string.h>

char* str_trim (char *s)
{
	char c;
	size_t str_len;
	
	// work as long as \r or \n is at the end of string
	// stop if some other character there or its an empty string'
	// (at start or due to our operation)
	for (str_len=strlen(s); str_len>0 && (c=s[str_len-1]); str_len--)
	{
		if (c=='\r' || c=='\n')
			s[str_len-1]=0;
		else
			break;
	};
	return s;
};

int main()
{
	// test

	// strdup() is used to copy text string into data segment,
	// because it will crash on Linux otherwise,
	// where text strings are allocated in constant data segment,
	// and not modifiable.

	printf ("[%s]\n", str_trim (strdup("")));
	printf ("[%s]\n", str_trim (strdup("\n")));
	printf ("[%s]\n", str_trim (strdup("\r")));
	printf ("[%s]\n", str_trim (strdup("\n\r")));
	printf ("[%s]\n", str_trim (strdup("\r\n")));
	printf ("[%s]\n", str_trim (strdup("test1\r\n")));
	printf ("[%s]\n", str_trim (strdup("test2\n\r")));
	printf ("[%s]\n", str_trim (strdup("test3\n\r\n\r")));
	printf ("[%s]\n", str_trim (strdup("test4\n")));
	printf ("[%s]\n", str_trim (strdup("test5\r")));
	printf ("[%s]\n", str_trim (strdup("test6\r\r\r")));
};
