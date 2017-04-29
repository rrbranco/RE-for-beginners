#include <windows.h>
#include <time.h>
#include <stdio.h>

char strbuf[256];

int PASCAL WinMain( HINSTANCE hInstance,
                    HINSTANCE hPrevInstance,
                    LPSTR lpCmdLine,
                    int nCmdShow )
{

	struct tm *t;
	time_t unix_time;

	unix_time=time(NULL);

	t=localtime (&unix_time);

	sprintf (strbuf, "%04d-%02d-%02d %02d:%02d:%02d", t->tm_year+1900, t->tm_mon, t->tm_mday,
		t->tm_hour, t->tm_min, t->tm_sec);
	
	MessageBox (NULL, strbuf, "caption", MB_OK);
	return 0;
};
