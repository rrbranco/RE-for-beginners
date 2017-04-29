// Windows XP MineSweeper cheater
// written by dennis(a)yurichev.com for http://beginners.re/ book
#include <windows.h>
#include <assert.h>
#include <stdio.h>

int main (int argc, char * argv[])
{
	int i, j;
	HANDLE h;
	DWORD PID, address, rd;
	BYTE board[27][32];

	if (argc!=3)
	{
		printf ("Usage: %s <PID> <address>\n", argv[0]);
		return 0;
	};

	assert (argv[1]!=NULL);
	assert (argv[2]!=NULL);

	assert (sscanf (argv[1], "%d", &PID)==1);
	assert (sscanf (argv[2], "%x", &address)==1);

	h=OpenProcess (PROCESS_VM_OPERATION | PROCESS_VM_READ | PROCESS_VM_WRITE, FALSE, PID);

	if (h==NULL)
	{
		DWORD e=GetLastError();
		printf ("OpenProcess error: %08X\n", e);
		return 0;
	};

	if (ReadProcessMemory (h, (LPVOID)address, board, sizeof(board), &rd)!=TRUE)
	{
		printf ("ReadProcessMemory() failed\n");
		return 0;
	};

	for (i=1; i<26; i++)
	{
		if (board[i][0]==0x10 && board[i][1]==0x10)
			break; // end of board
		for (j=1; j<31; j++)
		{
			if (board[i][j]==0x10)
				break; // board border
			if (board[i][j]==0x8F)
				printf ("*");
			else
				printf (" ");

		};
		printf ("\n");
	};

	CloseHandle (h);
};
