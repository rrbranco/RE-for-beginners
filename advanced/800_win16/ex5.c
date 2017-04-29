#include <windows.h>

int PASCAL string_compare (char *s1, char *s2)
{
	while (1)
	{
		if (*s1!=*s2)
			return 0;
		if (*s1==0 || *s2==0)
			return 1; // end of string
		s1++;
		s2++;
	};

};

int PASCAL string_compare_far (char far *s1, char far *s2)
{
	while (1)
	{
		if (*s1!=*s2)
			return 0;
		if (*s1==0 || *s2==0)
			return 1; // end of string
		s1++;
		s2++;
	};

};

void PASCAL remove_digits (char *s)
{
	while (*s)
	{
		if (*s>='0' && *s<='9')
			*s='-';
		s++;
	};
};

char str[]="hello 1234 world";

int PASCAL WinMain( HINSTANCE hInstance,
                    HINSTANCE hPrevInstance,
                    LPSTR lpCmdLine,
                    int nCmdShow )
{
	string_compare ("asd", "def");
	string_compare_far ("asd", "def");
	remove_digits (str);
	MessageBox (NULL, str, "caption", MB_YESNOCANCEL);
	return 0;
};
