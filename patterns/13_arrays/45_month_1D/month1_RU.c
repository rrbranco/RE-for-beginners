#include <stdio.h>

const char* month1[]=
{
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December"
};

// в пределах 0..11
const char* get_month1 (int month)
{
	return month1[month];	
};
