include(`commons.m4')#include <stdio.h>
#include <assert.h>

const char month2[12][10]=
{
	{ 'J','a','n','u','a','r','y',  0,  0,  0 },
	{ 'F','e','b','r','u','a','r','y',  0,  0 },
	{ 'M','a','r','c','h',  0,  0,  0,  0,  0 },
	{ 'A','p','r','i','l',  0,  0,  0,  0,  0 },
	{ 'M','a','y',  0,  0,  0,  0,  0,  0,  0 },
	{ 'J','u','n','e',  0,  0,  0,  0,  0,  0 },
	{ 'J','u','l','y',  0,  0,  0,  0,  0,  0 },
	{ 'A','u','g','u','s','t',  0,  0,  0,  0 },
	{ 'S','e','p','t','e','m','b','e','r',  0 },
	{ 'O','c','t','o','b','e','r',  0,  0,  0 },
	{ 'N','o','v','e','m','b','e','r',  0,  0 },
	{ 'D','e','c','e','m','b','e','r',  0,  0 }
};

// _EN(`in 0..11 range')_RU(`в пределах 0..11')
const char* get_month2 (int month)
{
	return &month2[month][0];
};