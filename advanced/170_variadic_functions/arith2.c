#include <stdio.h>

int arith_mean(int v, ...)
{
	int *i=&v;
	int sum=*i, count=1;
	i++;

	while(1)
	{
		if ((*i)==-1) // terminator
			break;
		sum=sum+(*i);
		count++;
		i++;
	}
	
	return sum/count;
};

int main()
{
	printf ("%d\n", arith_mean (1, 2, 7, 10, 15, -1 /* terminator */));
	// test: https://www.wolframalpha.com/input/?i=mean(1,2,7,10,15)
};

