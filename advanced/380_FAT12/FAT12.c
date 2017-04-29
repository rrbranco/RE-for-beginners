#include <stdio.h>
#include <stdint.h>
#include <assert.h>

#define ARRAY_SIZE (0x1000/2*3)
uint8_t array[ARRAY_SIZE]; // big enough array of triplets

unsigned int get_from_array (unsigned int idx)
{
	// find right triple in array:
	int triple=(idx>>1);
	int array_idx=triple*3;
	//assert (array_idx<ARRAY_SIZE);
	
	if (idx&1)
	{
		// this is odd element

		// compose value using middle and rightmost bytes:
		return ((array[array_idx+1]&0xF) << 8)|array[array_idx+2];
	}
	else
	{
		// this is even element

		// compose value using rightmost and middle bytes:
		return array[array_idx]<<4 | ((array[array_idx+1]>>4)&0xF);
	};
};

void put_to_array (unsigned int idx, unsigned int val)
{
	//assert (val<=0xFFF);

	// find right triple in array:
	int triple=(idx>>1);
	int array_idx=triple*3;
	//assert (array_idx<ARRAY_SIZE);

	if (idx&1)
	{
		// this is odd element
		// put value into middle and rightmost bytes:
	
		// decompose value to be stored:
		uint8_t val_lowest_byte=val&0xFF; // isolate lowest 8 bits
		uint8_t val_highest_nibble=val>>8; // no need to apply &0xF, we already know the val<=0xFFF

		// clear low 4 bits in the middle byte:
		array[array_idx+1]=array[array_idx+1]&0xF0;
		
		array[array_idx+1]=array[array_idx+1]|val_highest_nibble;
		array[array_idx+2]=val_lowest_byte;
	}
	else
	{
		// this is even element
		// put value into leftmost and middle bytes:

		// decompose value to be stored:
		uint8_t val_highest_byte=val>>4;
		uint8_t val_lowest_nibble=val&0xF;

		array[array_idx]=val_highest_byte;

		// clear high 4 bits in the middle byte:
		array[array_idx+1]=array[array_idx+1]&0xF;
		array[array_idx+1]=array[array_idx+1]|val_lowest_nibble<<4;
	};
};

int main()
{
	int i;
	
	// test
	for (i=0; i<0x1000; i++)
	{
		put_to_array(i, i);
	};
	
	for (i=0; i<0x1000; i++)
	{
		assert(get_from_array(i)==i);
	};
	//put_to_array(0x1000, 1); // will fail due to assert()
	
	// print triples:
	for (int i=0;i<0x1000/2;i++)
		printf ("0x%02X%02X%02X\n",array[i*3],array[i*3+1],array[i*3+2]);
};
