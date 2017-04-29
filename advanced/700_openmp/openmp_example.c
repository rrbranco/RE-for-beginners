#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include "sha512.h"

int found=0;
int32_t checked=0;

int32_t* __min;
int32_t* __max;

time_t start;

#ifdef __GNUC__
#define min(X,Y) ((X) < (Y) ? (X) : (Y))
#define max(X,Y) ((X) > (Y) ? (X) : (Y))
#endif

void check_nonce (int32_t nonce)
{
	uint8_t buf[32];
	struct sha512_ctx ctx;
	uint8_t res[64];

	// update statistics
	int t=omp_get_thread_num();

	if (__min[t]==-1)
		__min[t]=nonce;
	if (__max[t]==-1)
		__max[t]=nonce;

	__min[t]=min(__min[t], nonce);
	__max[t]=max(__max[t], nonce);

	// idle if valid nonce found
	if (found)
		return;

	memset (buf, 0, sizeof(buf));
	sprintf (buf, "hello, world!_%d", nonce);

	sha512_init_ctx (&ctx);
	sha512_process_bytes (buf, strlen(buf), &ctx);
	sha512_finish_ctx (&ctx, &res);
	if (res[0]==0 && res[1]==0 && res[2]==0)
	{
		printf ("found (thread %d): [%s]. seconds spent=%d\n", t, buf, time(NULL)-start);
		found=1;
	};
	#pragma omp atomic
	checked++;

	#pragma omp critical
	if ((checked % 100000)==0)
		printf ("checked=%d\n", checked);
};

int main()
{
	int32_t i;
	int threads=omp_get_max_threads();
	printf ("threads=%d\n", threads);

	__min=(int32_t*)malloc(threads*sizeof(int32_t));
	__max=(int32_t*)malloc(threads*sizeof(int32_t));
	for (i=0; i<threads; i++)
		__min[i]=__max[i]=-1;

	start=time(NULL);

	#pragma omp parallel for
	for (i=0; i<INT32_MAX; i++)
		check_nonce (i);

	for (i=0; i<threads; i++)
		printf ("__min[%d]=0x%08x __max[%d]=0x%08x\n", i, __min[i], i, __max[i]);

	free(__min); free(__max);
};
