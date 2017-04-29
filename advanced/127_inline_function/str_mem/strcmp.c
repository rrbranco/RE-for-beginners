bool is_bool (char *s)
{
	if (strcmp (s, "true")==0)
		return true;
	if (strcmp (s, "false")==0)
		return false;

	assert(0);
};
