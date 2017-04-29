#include <stdio.h>
#include <stdarg.h>

int arith_mean(int v, ...)
{
	va_list args;
	int sum=v, count=1, i;
	va_start(args, v);

	while(1)
	{
		i=va_arg(args, int);
		if (i==-1) // terminator
			break;
		sum=sum+i;
		count++;
	}
	
	va_end(args);
	return sum/count;
};

int main()
{
	printf ("%d\n", arith_mean (1, 2, 7, 10, 15, -1 /* terminator */));
};
