void dbg_print (const char *fmt, ...)
{
#ifdef _DEBUG
	// open log file
	// write to log file
	// close log file
#endif
};

void some_function()
{
	...

	dbg_print ("we did something\n");

	...
};
