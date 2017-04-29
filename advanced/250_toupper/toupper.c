char toupper (char c)
{
	if(c>='a' && c<='z')
		return c-'a'+'A';
	else
		return c;
}
