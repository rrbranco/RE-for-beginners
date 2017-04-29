#include <stdio.h>
#include <stdint.h>

uint32_t form_IP (uint8_t ip1, uint8_t ip2, uint8_t ip3, uint8_t ip4)
{
	return (ip1<<24) | (ip2<<16) | (ip3<<8) | ip4;
};

void print_as_IP (uint32_t a)
{
	printf ("%d.%d.%d.%d\n", 
		(a>>24)&0xFF,
		(a>>16)&0xFF,
		(a>>8)&0xFF,
		(a)&0xFF);
};

// bit=31..0
uint32_t set_bit (uint32_t input, int bit)
{
	return input=input|(1<<bit);
};

uint32_t form_netmask (uint8_t netmask_bits)
{
	uint32_t netmask=0;
	uint8_t i;

	for (i=0; i<netmask_bits; i++)
		netmask=set_bit(netmask, 31-i);

	return netmask;
};

void calc_network_address (uint8_t ip1, uint8_t ip2, uint8_t ip3, uint8_t ip4, uint8_t netmask_bits)
{
	uint32_t netmask=form_netmask(netmask_bits);
	uint32_t ip=form_IP(ip1, ip2, ip3, ip4);
	uint32_t netw_adr;

	printf ("netmask=");
	print_as_IP (netmask);

	netw_adr=ip&netmask;

	printf ("network address=");
	print_as_IP (netw_adr);
};

int main()
{
	calc_network_address (10, 1, 2, 4, 24);    // 10.1.2.4, /24
	calc_network_address (10, 1, 2, 4, 8);     // 10.1.2.4, /8
	calc_network_address (10, 1, 2, 4, 25);    // 10.1.2.4, /25
	calc_network_address (10, 1, 2, 64, 26);   // 10.1.2.4, /26
};
