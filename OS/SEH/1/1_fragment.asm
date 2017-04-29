	...
	xor	eax, eax
	mov	eax, DWORD PTR [eax] ; exception will occur here
	push	eax
	push	OFFSET msg
	call	_printf
	add	esp, 8
	...
