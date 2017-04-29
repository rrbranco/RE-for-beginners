void main()
{
	int sum, product; // теперь переменные локальные в этой §ф-ции§

	f1(123, 456, &sum, &product);
	printf ("sum=%d, product=%d\n", sum, product);
};
