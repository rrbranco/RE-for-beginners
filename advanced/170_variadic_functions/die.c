#include <stdlib.h>
#include <stdarg.h>

void die (const char * fmt, ...)
{
	va_list va;
	va_start (va, fmt);

	vprintf (fmt, va);
	exit(0);
};
