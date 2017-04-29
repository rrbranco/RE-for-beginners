char nco1, nco2;

void f(int if_freq_khz)
{

	switch (if_freq_khz) {
		default:
			printf("IF=%d KHz is not supportted, 3250 assumed\n", if_freq_khz);
			/* fallthrough */
		case 3250: /* 3.25Mhz */
			nco1 = 0x34;
			nco2 = 0x00;
			break;
		case 3500: /* 3.50Mhz */
			nco1 = 0x38;
			nco2 = 0x00;
			break;
		case 4000: /* 4.00Mhz */
			nco1 = 0x40;
			nco2 = 0x00;
			break;
		case 5000: /* 5.00Mhz */
			nco1 = 0x50;
			nco2 = 0x00;
			break;
		case 5380: /* 5.38Mhz */
			nco1 = 0x56;
			nco2 = 0x14;
			break;
	}
};

