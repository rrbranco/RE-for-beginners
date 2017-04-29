// Windows XP MineSweeper cheater
// written by dennis(a)yurichev.com for http://beginners.re/ book
#include <windows.h>
#include <assert.h>
#include <stdio.h>

int main (int argc, char * argv[])
{
	int i, j;
	HANDLE h;
	DWORD PID, address=0, rd;
	BYTE board[27][32];
	DWORD start_addr=0x01000000;
	int process_mem_size=0x10000;
	BYTE* process_mem;

	if (argc!=2)
	{
		printf ("Usage: %s <PID>\n", argv[0]);
		return 0;
	};

	assert (argv[1]!=NULL);

	assert (sscanf (argv[1], "%d", &PID)==1);

	h=OpenProcess (PROCESS_VM_OPERATION | PROCESS_VM_READ | PROCESS_VM_WRITE, FALSE, PID);

	if (h==NULL)
	{
		DWORD e=GetLastError();
		printf ("OpenProcess error: %08X\n", e);
		return 0;
	};

	// find frame to determine the address
	process_mem=(BYTE*)malloc(process_mem_size);
	assert (process_mem!=NULL);

	if (ReadProcessMemory (h, (LPVOID)start_addr, process_mem, process_mem_size, &rd)!=TRUE)
	{
		printf ("ReadProcessMemory() failed\n");
		return 0;
	};

	// for 9*9 grid.
	// FIXME: slow!
	for (i=0; i<process_mem_size; i++)
	{	
		if (memcmp(process_mem+i, "\x10\x10\x10\x10\x10\x10\x10\x10\x10\x10\x10\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x0F\x10", 32)==0)
		{
			// found
			address=start_addr+i;
			break;
		};
	};
	if (address==0)
	{
		printf ("Can't determine address of frame (and grid)\n");
		return 0;
	}
	else
	{
		printf ("Found frame and grid at 0x%x\n", address);
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
				printf (".");

		};
		printf ("\n");
	};

	printf ("\n");

	for (i=1; i<26; i++)
	{
		if (board[i][0]==0x10 && board[i][1]==0x10)
			break; // end of board
		for (j=1; j<31; j++)
		{
			if (board[i][j]==0x10)
				break; // board border
			printf ("%02X ", board[i][j]);
		};
		printf ("\n");
	};

	CloseHandle (h);
};
