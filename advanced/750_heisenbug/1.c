#include <stdio.h>
	
int array1[128];
int important_var1;
int important_var2;
int important_var3;
int important_var4;
int important_var5;

int main()
{
	important_var1=1;
	important_var2=2;
	important_var3=3;
	important_var4=4;
	important_var5=5;

	array1[0]=123;
	array1[128]=456; // BUG

	printf ("important_var1=%d\n", important_var1);
	printf ("important_var2=%d\n", important_var2);
	printf ("important_var3=%d\n", important_var3);
	printf ("important_var4=%d\n", important_var4);
	printf ("important_var5=%d\n", important_var5);
};

