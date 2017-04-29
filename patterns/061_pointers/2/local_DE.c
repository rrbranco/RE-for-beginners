void main()
{
	int sum, product; // die beiden sind nun lokale Variablen

	f1(123, 456, &sum, &product);
	printf ("sum=%d, product=%d\n", sum, product);
};
