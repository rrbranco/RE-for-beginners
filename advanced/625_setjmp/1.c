#include <stdio.h>
#include <setjmp.h>

jmp_buf env;

void f2()
{
	printf ("%s() begin\n", __FUNCTION__);
	// something odd happened here
	longjmp (env, 1234);
	printf ("%s() end\n", __FUNCTION__);
};

void f1()
{
	printf ("%s() begin\n", __FUNCTION__);
	f2();
	printf ("%s() end\n", __FUNCTION__);
};

int main()
{
	int err=setjmp(env);
	if (err==0)
	{
		f1();
	}
	else
	{
		printf ("Error %d\n", err);
	};
};
