#include <stdio.h>
#include <stdint.h>
#include <io.h>
#include <assert.h>
#include <malloc.h>
#include <fcntl.h>
#include <string.h>

int main (int argc, char *argv[])
{
	uint32_t sig, cnt, offset;
	uint32_t *d1, *d2;
	int	h, i, remain, file_len;
	char	*d3;
	uint32_t array_size_in_bytes;

	assert (argv[1]); // file name
	assert (argv[2]); // additional offset (if needed)

	// additional offset
	assert (sscanf (argv[2], "%X", &offset)==1);

	// get file length
	assert ((h=open (argv[1], _O_RDONLY | _O_BINARY, 0))!=-1);
	assert ((file_len=lseek (h, 0, SEEK_END))!=-1);
	assert (lseek (h, 0, SEEK_SET)!=-1);
	
	// read signature
	assert (read (h, &sig, 4)==4);
	// read count
	assert (read (h, &cnt, 4)==4);

	assert (sig==0x4D59534F); // OSYM

	// skip timedatestamp (for 11g)
	//_lseek (h, 4, 1);

	array_size_in_bytes=cnt*sizeof(uint32_t);

	// load symbol addresses array
	d1=(uint32_t*)malloc (array_size_in_bytes);
	assert (d1);
	assert (read (h, d1, array_size_in_bytes)==array_size_in_bytes);

	// load string offsets array
	d2=(uint32_t*)malloc (array_size_in_bytes);
	assert (d2);
	assert (read (h, d2, array_size_in_bytes)==array_size_in_bytes);

	// calculate strings block size
	remain=file_len-(8+4)-(cnt*8);

	// load strings block
	assert (d3=(char*)malloc (remain));
	assert (read (h, d3, remain)==remain);

	printf ("#include <idc.idc>\n\n");
	printf ("static main() {\n");

	for (i=0; i<cnt; i++)
		printf ("\tMakeName(0x%08X, \"%s\");\n", offset + d1[i], &d3[d2[i]]);

	printf ("}\n");

	close (h);
	free (d1); free (d2); free (d3);
};
