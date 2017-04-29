void main()
{
	int sum, product; // §maintenant, les variables sont locales à la fonction§

	f1(123, 456, &sum, &product);
	printf ("sum=%d, product=%d\n", sum, product);
};
