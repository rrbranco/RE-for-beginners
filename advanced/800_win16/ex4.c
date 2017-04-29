#include <windows.h>

int PASCAL func1 (int a, int b, int c)
{
	return a*b+c;
};

long PASCAL func2 (long a, long b, long c)
{
	return a*b+c;
};

long PASCAL func3 (long a, long b, long c, int d)
{
	return a*b+c-d;
};

int PASCAL WinMain( HINSTANCE hInstance,
                    HINSTANCE hPrevInstance,
                    LPSTR lpCmdLine,
                    int nCmdShow )
{
	func1 (123, 456, 789);
	func2 (600000, 700000, 800000);
	func3 (600000, 700000, 800000, 123);
	return 0;
};
