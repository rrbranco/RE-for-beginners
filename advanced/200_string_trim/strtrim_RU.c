#include <stdio.h>
#include <string.h>

char* str_trim (char *s)
{
	char c;
	size_t str_len;
	
	// работать до тех пор, пока \r или \n находятся в конце строки
	// остановиться, если там §какой-то§ другой символ, или если строка пустая
	// §(на старте, или в результате наших действий)§
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
	// тест

	// здесь применяется strdup() для копирования строк в сегмент данных,
	// потому что иначе процесс упадет в Linux,
	// где текстовые строки располагаются в константном сегменте данных,
	// и не могут модифицироваться.

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
