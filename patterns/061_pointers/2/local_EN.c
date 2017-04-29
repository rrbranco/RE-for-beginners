void main()
{
	int sum, product; // now variables are local in this function

	f1(123, 456, &sum, &product);
	printf ("sum=%d, product=%d\n", sum, product);
};
