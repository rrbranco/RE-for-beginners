#include <stdint.h>
#include <stdio.h>

union uint_float
{
        uint32_t i;
        float f;
};

float flt_2n(int N)
{
	union uint_float tmp;

	tmp.i=(N<<23)+0x3f800000;
	return tmp.f;
};

struct float_as_struct
{
        unsigned int fraction : 23;
        unsigned int exponent : 8;
        unsigned int sign : 1;
};

float flt_2n_v2(int N)
{
	struct float_as_struct tmp;

	tmp.fraction=0;
	tmp.sign=0;
	tmp.exponent=N+0x7f;
	return *(float*)(&tmp);
};

union uint64_double
{
	uint64_t i;
        double d;
};

double dbl_2n(int N)
{
	union uint64_double tmp;

	tmp.i=((uint64_t)N<<52)+0x3ff0000000000000UL;
	return tmp.d;
};

struct double_as_struct
{
        uint64_t fraction : 52;
        int exponent : 11;
        int sign : 1;
};

double dbl_2n_v2(int N)
{
	struct double_as_struct tmp;

	tmp.fraction=0;
	tmp.sign=0;
	tmp.exponent=N+0x3ff;
	return *(double*)(&tmp);
};

int main()
{
	// 2^11=2048
	printf ("%f\n", flt_2n(11));
	printf ("%f\n", flt_2n_v2(11));
	printf ("%lf\n", dbl_2n(11));
	printf ("%lf\n", dbl_2n_v2(11));
};

