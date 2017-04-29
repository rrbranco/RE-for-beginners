#include <stdio.h>

char a[3][4];

char get_by_coordinates1 (char array[3][4], int a, int b)
{
	return array[a][b];
};

char get_by_coordinates2 (char *array, int a, int b)
{
	// обращаться с входным массивом как с одномерным
	// 4 здесь это ширина массива
	return array[a*4+b];
};

char get_by_coordinates3 (char *array, int a, int b)
{
	// обращаться с входным массивом как с указателем,
	// вычислить адрес, получить значение оттуда
	// 4 здесь это ширина массива
	return *(array+a*4+b);
};

int main()
{
	a[2][3]=123;
	printf ("%d\n", get_by_coordinates1(a, 2, 3));
	printf ("%d\n", get_by_coordinates2(a, 2, 3));
	printf ("%d\n", get_by_coordinates3(a, 2, 3));
};
