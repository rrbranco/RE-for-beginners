#include <stdio.h>

char a[3][4];

int main()
{
	int x, y;
	
	// Array leeren
	for (x=0; x<3; x++)
		for (y=0; y<4; y++)
			a[x][y]=0;

	// zweite Spalte mit 0..3 füllen:
	for (y=0; y<4; y++)
		a[1][y]=y;
};
