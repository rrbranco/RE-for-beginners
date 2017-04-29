#include <windows.h>
#include <stdio.h>

DWORD new_value=1234;

EXCEPTION_DISPOSITION __cdecl except_handler(
		struct _EXCEPTION_RECORD *ExceptionRecord,
		void * EstablisherFrame,
		struct _CONTEXT *ContextRecord,
		void * DispatcherContext )
{
	unsigned i;

	printf ("%s\n", __FUNCTION__);
	printf ("ExceptionRecord->ExceptionCode=0x%p\n", ExceptionRecord->ExceptionCode);
	printf ("ExceptionRecord->ExceptionFlags=0x%p\n", ExceptionRecord->ExceptionFlags);
	printf ("ExceptionRecord->ExceptionAddress=0x%p\n", ExceptionRecord->ExceptionAddress);

	if (ExceptionRecord->ExceptionCode==0xE1223344)
	{
		printf ("That's for us\n");
		// yes, we "handled" the exception
		return ExceptionContinueExecution;
	}
	else if (ExceptionRecord->ExceptionCode==EXCEPTION_ACCESS_VIOLATION)
	{
		printf ("ContextRecord->Eax=0x%08X\n", ContextRecord->Eax);
		// will it be possible to 'fix' it?
		printf ("Trying to fix wrong pointer address\n");
		ContextRecord->Eax=(DWORD)&new_value;
		// yes, we "handled" the exception
		return ExceptionContinueExecution;
	}
	else
	{
		printf ("We do not handle this\n");
		// someone else's problem
		return ExceptionContinueSearch;
	};
}

int main()
{
	DWORD handler = (DWORD)except_handler; // take a pointer to our handler

	// install exception handler
	__asm
	{                           	// make EXCEPTION_REGISTRATION record:
		push    handler         // address of handler function
		push    FS:[0]          // address of previous handler
		mov     FS:[0],ESP      // add new EXECEPTION_REGISTRATION
	}

    	RaiseException (0xE1223344, 0, 0, NULL);

        // now do something very bad
	int* ptr=NULL;
	int val=0;
	val=*ptr;
	printf ("val=%d\n", val);

	// deinstall exception handler
	__asm
	{                          	// remove our EXECEPTION_REGISTRATION record
		mov     eax,[ESP]       // get pointer to previous record
		mov     FS:[0], EAX     // install previous record
		add     esp, 8          // clean our EXECEPTION_REGISTRATION off stack
	}

	return 0;
}
