#include <stdint.h>
#include <windows.h>
#include <winnt.h>

// from the Numerical Recipes book:
#define RNG_a 1664525
#define RNG_c 1013904223

__declspec( thread ) uint32_t rand_state;

void my_srand (uint32_t init)
{
        rand_state=init;
}

void NTAPI tls_callback(PVOID a, DWORD dwReason, PVOID b)
{
	my_srand (GetTickCount());
}

#pragma data_seg(".CRT$XLB")
PIMAGE_TLS_CALLBACK p_thread_callback = tls_callback;
#pragma data_seg()

int my_rand ()
{
	rand_state=rand_state*RNG_a;
	rand_state=rand_state+RNG_c;
	return rand_state & 0x7fff;
}

int main()
{
	// rand_state is already initialized at the moment (using GetTickCount())
	printf ("%d\n", my_rand());
};
