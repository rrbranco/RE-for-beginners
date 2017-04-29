#include <windows.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <time.h>
#include <sys/stat.h>

#define BUF_SIZE 0x8000

void collect_stat(long long *array, unsigned char *buf, size_t size)
{
	int i;
	for (i=0; i<size; i++)
		array[buf[i]]++;
};

void output_stat(long long *array)
{
	int i;
	char buf[128];

	for (i=0; i<256; i++)
	{
		if (array[i]==0)
			continue;
		
		if (isprint(i))
			sprintf (buf, "  %c: %06d\n", i, array[i]);
		else
			sprintf (buf, "%03d: %06d\n", i, array[i]);
		OutputDebugString (buf);
	};
};

int output_file_info(char *fname)
{
	struct stat st;
	char buf[128];
	struct tm *t;

	if (stat(fname, &st)!=0)
	{
		OutputDebugString ("cannot stat file:\n");
		OutputDebugString (fname);
		return 0;
	};

	sprintf (buf, "file size: %d\n", st.st_size);
	OutputDebugString (buf);
	t=localtime (&st.st_mtime);
	sprintf (buf, "File modification date/time: %04d-%02d-%02d %02d:%02d:%02d", t->tm_year+1900, t->tm_mon, t->tm_mday,
		t->tm_hour, t->tm_min, t->tm_sec);
	OutputDebugString (buf);
	return 1;
};

int PASCAL WinMain( HINSTANCE hInstance,
                    HINSTANCE hPrevInstance,
                    LPSTR lpCmdLine,
                    int nCmdShow )
{
	FILE* f;
	long long stat[256];
	int i;
	unsigned char *buf=NULL;
	size_t was_read;

	for (i=0; i<256; i++)
		stat[i]=0;

	f=fopen(lpCmdLine, "rb");
	if (f==NULL)
	{
		OutputDebugString ("cannot open file:\n");
		OutputDebugString (lpCmdLine);
		goto exit;
	};

	if (output_file_info(lpCmdLine)==0)
		goto exit;

	buf=malloc(BUF_SIZE);
	if (buf==NULL)
	{
		OutputDebugString ("cannot allocate buffer\n");
		goto exit;
	};

	do
	{
		was_read=fread (buf, 1, BUF_SIZE, f);
		if (was_read==0)
		{
			OutputDebugString ("read file failed\n");
			// errno?
			goto exit;
		};

		collect_stat(stat, buf, was_read);
	} while (was_read==BUF_SIZE);

	output_stat (stat);
exit:
	fclose (f);
	free (buf);
	return 0;
};
